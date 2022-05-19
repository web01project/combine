package com.example0.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example0.model.Manager;
import com.example0.model.User;
import com.example0.service.ManagerService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final ManagerService mservice;
	private final UserService uservice;
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	@GetMapping("login")
	public String login() {
		return "/user/login";
	}
	@GetMapping("userjoin")
	public String join() {
		return "/user/userjoin";
	}
	@PostMapping("userjoin")
	@ResponseBody
	public String join(@RequestBody User user) {
		
		
		return "success";
	}
	//manager가입 폼
	@GetMapping("managerjoin")
	public String managerjoin() {
		return "/user/managerjoin";
	}
	//manager가입
	@PostMapping("managerjoin")
	@ResponseBody
	public String managerjoin(@RequestBody Manager manager) {
		mservice.managerjoin(manager);
		return "success";
	}
	
}