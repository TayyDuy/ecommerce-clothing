package com.asm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
	@GetMapping("/")
	public String showHomePage() {
	    return "home";
	}
	
	@GetMapping("/home")
	public String showHomePage0() {
	    return "home";
	}

	@GetMapping("/contact")
	public String showHomePage1() {
	    return "home";
	}
	
	@GetMapping("/introduce")
	public String showHomePage2() {
	    return "home";
	}
}
