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

	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	@GetMapping("login")
	public String login() {
		return "/user/login";
	}
	@GetMapping("join")
	public String join() {
		return "/user/join";
	}
	@PostMapping("join")
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
	public String managerjoin(Manager manager) {
		mservice.managerjoin(manager);
		return "success";
	}
	
}