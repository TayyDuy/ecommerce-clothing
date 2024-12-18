package com.asm.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.asm.dao.UserDAO;
import com.asm.model.User;
import com.asm.service.CookieService;
import com.asm.service.ParamService;
import com.asm.service.SessionService;

import jakarta.servlet.ServletContext;

@Controller
public class UserController {

	@Autowired
	SessionService ss;

	@Autowired
	CookieService ck;

	@Autowired
	ParamService ps;

	@Autowired
	UserDAO uDao;

	@RequestMapping("/profile")
	public String profileUser(Model model) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		return "profile";
	}

	@RequestMapping("/profile/update")
	public String profileUpdate(Model model, @RequestParam("fullname") String fullname,
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
		return "redirect:/profile";
	}

}
