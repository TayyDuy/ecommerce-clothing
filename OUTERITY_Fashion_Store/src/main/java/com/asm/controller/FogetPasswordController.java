package com.asm.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.UserDAO;
import com.asm.mail.MailerService;
import com.asm.model.MailInfor;
import com.asm.model.User;

@Controller
public class FogetPasswordController {

	@Autowired
	MailerService mailerService;

	@Autowired
	UserDAO uDao;

	@GetMapping("/forgetpassword")
	public String showForgetPasswordPage() {
		return "forgetpassword"; // Tương ứng với file forgetpassword.jsp
	}

	@PostMapping("/forgetpassword")
	public String submitForgetPasswordPage(Model model, @RequestParam("username") String username) {
		try {
			Optional<User> u1 = uDao.findById(username);
			if (!u1.isPresent()) {
				model.addAttribute("message", "Username không tồn tại");
			} else {
				User u = uDao.getOne(username);
				MailInfor mailInfor = new MailInfor(u.getEmail(), "Mật khẩu của bạn", u.getMatkhau());
				mailerService.send(mailInfor);
				model.addAttribute("message", "Mật khẩu của bạn đã được gửi đến tài khoản gmail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Lỗi khi gửi email: " + e.getMessage());
		}
		return "forgetpassword";
	}
}
