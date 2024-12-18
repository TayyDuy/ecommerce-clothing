package com.asm.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.CartDAO;
import com.asm.dao.ProductDAO;
import com.asm.dao.WarehouseDAO;
import com.asm.model.Cart;
import com.asm.model.Product;
import com.asm.model.User;
import com.asm.service.CookieService;
import com.asm.service.ParamService;
import com.asm.service.SessionService;

@Controller
public class CartController {

	@Autowired
	SessionService ss;

	@Autowired
	CookieService ck;

	@Autowired
	ParamService ps;

	@Autowired
	ProductDAO pDao;

	@Autowired
	WarehouseDAO wDao;

	@Autowired
	CartDAO cDao;

	@RequestMapping("/cart")
	public String showCartPage(Model model) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		Integer cartSL = cDao.getTotalQuantityByUser(u.getUsername());
		Double cartG = cDao.getTotalPriceByUser(u.getUsername());

		ss.set("carts", cDao.getAllByUser(u.getUsername()));
		model.addAttribute("cartSL", cartSL);
		ss.set("cartG", cartG);
		return "cart";
	}

	@RequestMapping("/cart/add")
	public String addCart(Model model, @RequestParam("selectedSize") Optional<String> size,
			@RequestParam("quantity") Optional<Integer> quantity) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		Product p = ss.get("pDetail");
		List<Cart> existingCartItems = cDao.getAllByUser(u.getUsername());

		// Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng với cùng kích thước chưa
		boolean found = false;
		for (Cart cartItem : existingCartItems) {
			if (cartItem.getProduct().getId().equals(p.getId()) && cartItem.getSize().equals(size.orElse("S"))) {
				cartItem.setSoluong(cartItem.getSoluong() + quantity.orElse(1)); // Tăng số lượng
				cDao.save(cartItem);
				found = true;
				break;
			}
		}

		// Nếu không tìm thấy, thêm sản phẩm mới vào giỏ hàng
		if (!found) {
			Cart newCartItem = new Cart();
			newCartItem.setProduct(p);
			newCartItem.setUser(u);
			newCartItem.setSize(size.orElse("S"));
			newCartItem.setSoluong(quantity.orElse(1));
			cDao.save(newCartItem);
		}

		ss.set("carts", cDao.getAllByUser(u.getUsername()));

		Integer cartSL = cDao.getTotalQuantityByUser(u.getUsername());
		Double cartG = cDao.getTotalPriceByUser(u.getUsername());

		model.addAttribute("cartSL", cartSL);
		ss.set("cartG", cartG);
		return "redirect:/cart";
	}

	@RequestMapping("/cart/update/{id}")
	public String updateCart(Model model, @PathVariable("id") Integer id, @RequestParam("qty") Integer qty) {
		Cart cart = cDao.getOne(id);
		cart.setSoluong(qty);
		cDao.save(cart);

		User u = ss.get("user");
		ss.set("carts", cDao.getAllByUser(u.getUsername()));

		Integer cartSL = cDao.getTotalQuantityByUser(u.getUsername());
		Double cartG = cDao.getTotalPriceByUser(u.getUsername());
		model.addAttribute("cartSL", cartSL);
		ss.set("cartG", cartG);
		return "redirect:/cart";
	}

	@RequestMapping("/cart/remove/{id}")
	public String removeCart(Model model, @PathVariable("id") Integer id) {
		Cart cart = cDao.getOne(id);
		cDao.delete(cart);

		User u = ss.get("user");
		ss.set("carts", cDao.getAllByUser(u.getUsername()));

		Integer cartSL = cDao.getTotalQuantityByUser(u.getUsername());
		Double cartG = cDao.getTotalPriceByUser(u.getUsername());
		model.addAttribute("cartSL", cartSL);
		ss.set("cartG", cartG);
		return "redirect:/cart";
	}
}
