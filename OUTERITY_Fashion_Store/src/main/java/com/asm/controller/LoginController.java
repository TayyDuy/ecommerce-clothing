package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.UserDAO;
import com.asm.model.User;
import com.asm.service.CookieService;
import com.asm.service.SessionService;

@Controller
public class LoginController {

	@Autowired
	SessionService ss;
	
	@Autowired
	CookieService ck;

	@Autowired
	UserDAO uDao;

	@RequestMapping("/login")
	public String showLoginPage(Model model) {
		model.addAttribute("message", null);
		model.addAttribute("unCK", ck.getValue("username"));
		model.addAttribute("passCK", ck.getValue("password"));
		return "login";
	}

	@PostMapping("/login")
	public String handleLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("rememberMe") boolean remember, Model model) {
		try {
			User user = uDao.getOne(username);
			if (!user.getMatkhau().equals(password)) {
				model.addAttribute("message", "Password không đúng");
			} else {
				ss.set("user", user);
				if(remember) {
					ck.add("username", username, 6);
					ck.add("password", password, 6);
				} else {
					ck.remove("username");
					ck.remove("password");
					ck.add("username", username, 0);
					ck.add("password", password, 0);
				}
				if (user.getQuyen()) {
					return "admin_profile";
				} else {
					return "home";
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Username không tồn tại");
		}
		return "login";
	}
	
	@RequestMapping("/logout")
	public String Logout(Model model) {
		ss.remove("user");
		ck.remove("username");
		ck.remove("password");
		return "redirect:/login";
	}
}
