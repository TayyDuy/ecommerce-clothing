package com.asm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.ProductDAO;
import com.asm.dao.WarehouseDAO;
import com.asm.model.Product;
import com.asm.model.User;
import com.asm.service.CookieService;
import com.asm.service.ParamService;
import com.asm.service.SessionService;

@Controller
public class ProductDetailController {
    
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
	
	@RequestMapping("/productdetail")
	public String showProductdetailPage(Model model, @RequestParam("id") String id) {
		User u = ss.get("user");
		if (u == null) {
			return "/login";
		}
		Product pDetail = pDao.getOne(id);
		List<String> size = wDao.findSizesByProductId(id);
		model.addAttribute("listSize", size);
		ss.set("pDetail", pDetail);
	    return "productdetail";
	}

}
