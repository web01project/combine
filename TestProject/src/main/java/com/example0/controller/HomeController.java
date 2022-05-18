package com.example0.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	
	@GetMapping("/")
	public String home() {
		return "/user/login";
	}
	@GetMapping("login")
	public String login() {
		return "/user/login";
	}
	@GetMapping("join")
	public String join() {
		return "/user/join";
	}
	
	
}
