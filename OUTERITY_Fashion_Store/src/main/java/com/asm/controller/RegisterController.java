package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.UserDAO;
import com.asm.model.User;
import com.asm.service.CookieService;
import com.asm.service.ParamService;
import com.asm.service.SessionService;

@Controller
public class RegisterController {

	@Autowired
	SessionService ss;

	@Autowired
	CookieService ck;

	@Autowired
	ParamService ps;

	@Autowired
	UserDAO uDao;

	@GetMapping("/register")
	public String showRegisterPage() {
		return "register";
	}

	@PostMapping("/register")
	public String submitRegisterPage(Model model, @RequestParam("username") String username,
			@RequestParam("birthdate") String birthdate, @RequestParam("gender") String gender,
			@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("address") String address, @RequestParam("password") String password) {
		User u = new User();
		u.setUsername(username);
		u.setDiachi(address);
		u.setEmail(email);
		u.setGioitinh(gender.equals("male") ? false : true);
		u.setHinhanh("default.png");
		u.setHoten("Người dùng " + username);
		u.setMatkhau(password);
		u.setNgaysinh(ps.getDate("birthdate", "yyyy-MM-dd"));
		u.setQuyen(false);
		u.setSdt(phone);
		model.addAttribute("uRegister", u);
		if (uDao.findById(username).isPresent()) {
			model.addAttribute("message", "Username đã tồn tại");
			return "register";
		} else {
			uDao.save(u);
		}

		return "redirect:/login";
	}
}
