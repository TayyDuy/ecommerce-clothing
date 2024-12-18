package com.asm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.CartDAO;
import com.asm.dao.OrderDAO;
import com.asm.dao.OrderDetailDAO;
import com.asm.dao.WarehouseDAO;
import com.asm.model.Cart;
import com.asm.model.Order;
import com.asm.model.OrderDetail;
import com.asm.model.User;
import com.asm.model.Warehouse;
import com.asm.service.CookieService;
import com.asm.service.ParamService;
import com.asm.service.SessionService;

@Controller
public class PaymentController {

	@Autowired
	SessionService ss;

	@Autowired
	CookieService ck;

	@Autowired
	ParamService ps;

	@Autowired
	OrderDAO oDao;

	@Autowired
	OrderDetailDAO odDao;

	@Autowired
	WarehouseDAO wDao;

	@Autowired
	CartDAO cDao;

	@RequestMapping("/payment")
	public String showPaymentPage() {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		return "payment";
	}

	@RequestMapping("/orderHistory")
	public String showOrderHistory(Model model) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		List<Order> orderHistory = oDao.findAllByUser(u.getUsername());
		ss.set("orderHistory", orderHistory);
		return "orderHistory";
	}

	@RequestMapping("/orderHistory/detail")
	public String showOrderDetail(Model model, @RequestParam("idOrder") Integer id) {
		List<OrderDetail> list = odDao.findAllByOrder(oDao.getOne(id));
		model.addAttribute("orderDetail", list);
		return "orderHistory";
	}

	@RequestMapping("/orderHistory/accept")
	public String showOrderAccept(Model model, @RequestParam("idOrder") Integer id) {
		Order accept = oDao.getOne(id);
		accept.setTrangthai(true);
		oDao.save(accept);
		return "redirect:/orderHistory";
	}

	@RequestMapping("/payment/order")
	public String paymentOrder(Model model) {
		User u = ss.get("user");
		List<Cart> listCart = cDao.getAllByUser(u.getUsername());

		// Kiểm tra số lượng sản phẩm trong kho
		if (listCart != null && !listCart.isEmpty()) {
			// Kiểm tra từng sản phẩm trong giỏ hàng
			for (Cart cartItem : listCart) {
				Warehouse warehouse = wDao.findOneByProductAndSize(cartItem.getProduct().getId(), cartItem.getSize());
				if (warehouse == null || warehouse.getSoluongton() < cartItem.getSoluong()) {
					model.addAttribute("error_pay",
							"Số lượng sản phẩm " + cartItem.getProduct().getTensp() + " không đủ trong kho.");
					return "payment";
				}
			}

			// Tạo hóa đơn mới
			Order order = new Order();
			order.setUser(u); // Gán user cho hóa đơn
			order.setTonggiatri((Double) ss.get("cartG") + 30); // Cần cast về kiểu Double nếu cần

			// Tạo danh sách chi tiết hóa đơn từ giỏ hàng
			List<OrderDetail> orderDetails = new ArrayList<>();
			for (Cart cartItem : listCart) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setProduct(cartItem.getProduct());
				orderDetail.setSize(cartItem.getSize());
				orderDetail.setSoluong(cartItem.getSoluong());
				orderDetail.setGia(cartItem.getProduct().getGiasp() * cartItem.getSoluong());
				orderDetail.setOrder(order); // Gán đối tượng Order cho OrderDetail

				// Cập nhật số lượng tồn kho
				Warehouse warehouse = wDao.findOneByProductAndSize(cartItem.getProduct().getId(), cartItem.getSize());
				if (warehouse.getSoluongton() == cartItem.getSoluong()) {
					// Nếu số lượng tồn kho bằng số lượng trong giỏ hàng, xóa sản phẩm khỏi kho
					wDao.delete(warehouse);
				} else {
					// Giảm số lượng tồn kho
					warehouse.setSoluongton(warehouse.getSoluongton() - cartItem.getSoluong());
					wDao.save(warehouse); // Cập nhật kho
				}

				// Thêm chi tiết vào danh sách
				orderDetails.add(orderDetail);
				cDao.delete(cartItem);
			}

			// Gán danh sách chi tiết hóa đơn vào hóa đơn
			order.setOrderDetails(orderDetails);

			// Lưu hóa đơn vào cơ sở dữ liệu
			oDao.save(order); // Giả sử bạn có oDao để lưu hóa đơn

			// Xóa giỏ hàng của người dùng
			ss.remove("cart");
			return "redirect:/orderHistory";
		}

		model.addAttribute("error_pay", "List cart null");
		return "redirect:/payment";
	}

}
