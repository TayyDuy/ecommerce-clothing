package com.asm.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.asm.dao.CategoryDAO;
import com.asm.dao.OrderDAO;
import com.asm.dao.ProductDAO;
import com.asm.dao.UserDAO;
import com.asm.dao.WarehouseDAO;
import com.asm.model.Order;
import com.asm.model.Product;
import com.asm.model.User;
import com.asm.model.Warehouse;
import com.asm.service.CookieService;
import com.asm.service.ParamService;
import com.asm.service.SessionService;

@Controller
public class AdminController {

	@Autowired
	SessionService ss;

	@Autowired
	CookieService ck;

	@Autowired
	ParamService ps;

	@Autowired
	UserDAO uDao;

	@Autowired
	ProductDAO pDao;

	@Autowired
	CategoryDAO cDao;
	
	@Autowired
	WarehouseDAO wDao;
	
	@Autowired
	OrderDAO oDao;

	@RequestMapping("/admin/profile")
	public String showAdminPage(Model model) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		return "admin_profile";
	}

	@RequestMapping("/admin/profile/update")
	public String profileUpdateAdmin(Model model, @RequestParam("fullname") String fullname,
			@RequestParam("birthdate") String birthdate, @RequestParam("gender") String gender,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("img") MultipartFile img) {

		User user = (User) ss.get("user");
		user.setHoten(fullname);
		user.setGioitinh(gender.equals("male") ? false : true);
		user.setSdt(phone);
		user.setDiachi(address);
		user.setNgaysinh(ps.getDate("birthdate", "yyyy-MM-dd"));

		try {
			if (!img.isEmpty()) {
				user.setHinhanh(img.getOriginalFilename());
				ps.save(img, "/img");
			}
		} catch (Exception e) {
		}

		// Cập nhật thông tin người dùng trong cơ sở dữ liệu
		uDao.save(user);
		User u = uDao.getOne(user.getUsername());
		ss.set("user", u);
		model.addAttribute("messagePF", "Cập nhật thành công");
		User test = ss.get("user");
		return "admin_profile";
	}

	//Kho hang
	@RequestMapping("/admin/khohang")
	public String Khohang1() {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		ss.set("warehouses", wDao.findAll());
		ss.set("warehouse", new Warehouse());
		ss.set("products", pDao.findAll());
		return "admin_khohang";
	}
	
	@RequestMapping("/admin/khohang/edit")
	public String adminKhohangEdit(Model model, @RequestParam("id") String id) {
		ss.set("warehouse", wDao.getOne(id));
		return "admin_khohang";
	}
	
	@RequestMapping("/admin/khohang/update")
	public String adminKhohangUpdate(Model model, 
	        @RequestParam("khohang-id") String warehouseId,
	        @RequestParam("product-warehouse") String productId,
	        @RequestParam("size") String size,
	        @RequestParam("quantity") int quantity) {
	    
	    Optional<Warehouse> existingWarehouse = wDao.findById(warehouseId); 
	    List<Warehouse> pAs = wDao.findByProductAndSize(productId, size);
	    if (!existingWarehouse.isPresent() && pAs.isEmpty()) {
	        Warehouse newWarehouse = new Warehouse();
	        newWarehouse.setId(warehouseId);
	        newWarehouse.setProduct(pDao.getOne(productId)); 
	        newWarehouse.setSize(size);
	        newWarehouse.setSoluongton(quantity);

	        wDao.save(newWarehouse);
	        ss.set("warehouse", newWarehouse);
	        model.addAttribute("messageK", "Thêm mới thành công");
	    } else if(existingWarehouse.isPresent() && pAs.isEmpty()){

	        Warehouse updateWarehouse = existingWarehouse.get();
	        updateWarehouse.setProduct(pDao.getOne(productId)); 
	        updateWarehouse.setSize(size);
	        updateWarehouse.setSoluongton(quantity);

	        wDao.save(updateWarehouse);
	        ss.set("warehouse", updateWarehouse);
	        model.addAttribute("messageK", "Cập nhật thành công");
	    } else if (!existingWarehouse.isPresent() && !pAs.isEmpty()) {
	        model.addAttribute("errorK", "Sản phẩm đã tồn tại");
	    } else {
	    	Warehouse updateWarehouse = existingWarehouse.get();
	        updateWarehouse.setSoluongton(quantity);

	        wDao.save(updateWarehouse);
	        ss.set("warehouse", updateWarehouse);
	        model.addAttribute("messageK", "Cập nhật thành công");
	    }


	    ss.set("warehouses", wDao.findAll());
	    return "admin_khohang";
	}

	@RequestMapping("/admin/khohang/remove")
	public String adminKhohangRemove(Model model, @RequestParam("id") String id) {
		Warehouse test = wDao.getOne(id);
		if (test != null) {
			wDao.delete(test);			
			ss.set("warehouses", wDao.findAll());
			model.addAttribute("messageK", "Xóa thành công");
		}
		return "admin_khohang";
	}

	// Product
	@RequestMapping("/admin/product")
	public String adminProduct(Model model) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		ss.set("products", pDao.findAll());
		ss.set("product", new Product());
		ss.set("categories", cDao.findAll());
		return "admin_product";
	}

	@RequestMapping("/admin/product/edit")
	public String adminProductEdit(Model model, @RequestParam("id") String id) {
		ss.set("product", pDao.getOne(id));
		return "admin_product";
	}

	@RequestMapping("/admin/product/update")
	public String adminProductUpdate(Model model, @RequestParam("product-id") String id,
			@RequestParam("product-name") String name, @RequestParam("product-price") double price,
			@RequestParam("product-category") String category, @RequestParam("product-image") MultipartFile file) {
		Optional<Product> test = pDao.findById(id);

		if (!test.isPresent()) {
			Product nProduct = new Product();
			nProduct.setId(id);
			nProduct.setTensp(name);
			nProduct.setGiasp(price);
			nProduct.setCategory(cDao.getById(category));
			try {
				if (!file.isEmpty()) {
					nProduct.setAnhsp(file.getOriginalFilename());
					ps.save(file, "/img");
				}
			} catch (Exception e) {
			}
			pDao.save(nProduct);
			ss.set("product", nProduct);
			model.addAttribute("messageP", "Thêm mới thành công");
		} else {
			Product nProduct = pDao.getOne(id);
			nProduct.setTensp(name);
			nProduct.setGiasp(price);
			nProduct.setCategory(cDao.getById(category));
			try {
				if (!file.isEmpty()) {
					nProduct.setAnhsp(file.getOriginalFilename());
					ps.save(file, "/img");
				}
			} catch (Exception e) {
			}
			pDao.save(nProduct);
			ss.set("product", nProduct);
			
			model.addAttribute("messageP", "Cập nhật thành công");
		}
		
		ss.set("products", pDao.findAll());
		return "admin_product";
	}

	@RequestMapping("/admin/product/remove")
	public String adminProductRemove(Model model, @RequestParam("id") String id) {
		Product test = pDao.getOne(id);
		if (test != null) {			
			pDao.delete(test);
			ss.set("product", test);
			ss.set("products", pDao.findAll());
			model.addAttribute("messageP", "Xóa thành công");
		}
		return "admin_product";
	}

	@RequestMapping("/admin/report")
	public String showAdminPage4(Model model) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		List<Order> listOrder = oDao.findAll();
		model.addAttribute("report", listOrder);
		return "admin_report";
	}
	
	@RequestMapping("/admin/report/search")
	public String showAdminPage5(Model model, @RequestParam("date") String date) {
		LocalDate selectedDate = LocalDate.parse(date);
	    int month = selectedDate.getMonthValue();
	    int year = selectedDate.getYear();
		List<Order> listOrder = oDao.findAllByMonthAndYear(month, year);
		
		Long countOrder = oDao.countTotalOrdersByMonthAndYear(month, year);
		Double totalPrice = oDao.sumTotalAmountByMonthAndYear(month, year);
		
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		model.addAttribute("countOrder", countOrder);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("report", listOrder);
		return "admin_report";
	}
}
