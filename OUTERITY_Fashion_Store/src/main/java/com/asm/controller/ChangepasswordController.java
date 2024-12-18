package com.asm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.UserDAO;
import com.asm.model.User;
import com.asm.service.SessionService;

@Controller
public class ChangepasswordController {

    @Autowired
    UserDAO uDao;

    @Autowired
    SessionService ss;

    // Hiển thị trang đổi mật khẩu
    @RequestMapping("/change-password")
    public String showChangePasswordPage(Model model) {
        model.addAttribute("message", null);
        return "changepassword"; // Sử dụng changepassword.jsp
    }

    // Xử lý yêu cầu đổi mật khẩu
    @PostMapping("/change-password")
    public String handleChangePassword(
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            Model model) {
        
        // Lấy thông tin người dùng hiện tại từ session
        User user = (User) ss.get("user");
        if (user == null) {
            model.addAttribute("message", "Bạn phải đăng nhập để thay đổi mật khẩu.");
            return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
        }

        // Kiểm tra mật khẩu cũ
        if (!user.getMatkhau().equals(oldPassword)) {
            model.addAttribute("message", "Mật khẩu cũ không đúng.");
            return "changepassword";
        }

        // Kiểm tra xác nhận mật khẩu mới
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("message", "Mật khẩu xác nhận không khớp.");
            return "changepassword";
        }

        // Cập nhật mật khẩu mới
        user.setMatkhau(newPassword);
        uDao.save(user); // Lưu thay đổi vào cơ sở dữ liệu
        ss.set("user", user); // Cập nhật lại session

        model.addAttribute("message", "Thay đổi mật khẩu thành công.");
        return "redirect:/profile"; // Chuyển hướng tới trang cá nhân hoặc trang thành công
    }
}
