package com.asm.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.asm.dao.CategoryDAO;
import com.asm.dao.ProductDAO;
import com.asm.model.Category;
import com.asm.service.SessionService;

@Controller
public class ProductsController {

	@Autowired
	ProductDAO pDao;

	@Autowired
	CategoryDAO cDao;

	@Autowired
	SessionService ss;

	@RequestMapping("/products")
	public String showProductsPage(Model model, @RequestParam("p") Optional<Integer> p) {
		PageRequest page = PageRequest.of(p.orElse(0), 8);
		model.addAttribute("products", pDao.findAll(page));

		model.addAttribute("categories", cDao.findAll());
		return "products";
	}

	@RequestMapping("/products/filter")
	public String filter(Model model, @RequestParam("category") Optional<String> cate,
			@RequestParam("price") Optional<Integer> max, @RequestParam("p") Optional<Integer> p,
			@RequestParam("sort") Optional<String> sort) {

		PageRequest page = PageRequest.of(p.orElse(0), 8);

		// Xử lý sắp xếp dựa trên giá trị của tham số sort
		if (sort.isEmpty()) {
			model.addAttribute("products", pDao.findByCate(cate.orElse("%"), 0, max.orElse(1000), page));
		} else {
			if (sort.get().equals("desc")) {
				model.addAttribute("products",
						pDao.findByCateOrderByPriceDesc(cate.orElse("%"), 0, max.orElse(1000), page));
			} else {
				model.addAttribute("products",
						pDao.findByCateOrderByPriceAsc(cate.orElse("%"), 0, max.orElse(1000), page));
			}
		}

		model.addAttribute("categories", cDao.findAll());
		return "products";
	}

	@PostMapping("/products/search")
	public String search(Model model, @RequestParam("keyword") String keyword, @RequestParam("p") Optional<Integer> p) {

		PageRequest page = PageRequest.of(p.orElse(0), 8);
		model.addAttribute("products", pDao.searchByName("%" + keyword + "%", page));
		model.addAttribute("categories", cDao.findAll());
		return "products";
	}

}
