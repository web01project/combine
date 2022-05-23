package com.example0.controller;


import javax.transaction.Transactional;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;


import com.example0.model.User;
import com.example0.repository.UserRepository;
import com.example0.service.UserService;
import com.example0.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

	private final UserService userService;
	private final UserRepository userRepository;

	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	//로그인 폼
	  @GetMapping("/login")
	  public String login() {
		  return "/user/login";
	  }
	  
	//로그인  error
	  @Transactional
	  @GetMapping("/login/error")
	  public String login(Model model) {
		  model.addAttribute("errorMsg",  "아이디 또는 비밀번호가 일치하지 않습니다.");
		  return "/user/login";
	  }
	  
	//user가입 폼
	@GetMapping("register")
	public String memberJoin() {
		return "/user/join";
	}
	
	//user생성
	@PostMapping("register")
	@ResponseBody
	public String register(@RequestBody User user) {
		//중복확인
		if(userRepository.findByUseremail(user.getUseremail())!=null) {
			return "fail";
		}
		userService.register(user);
		System.out.println(user);
		return "success";
	}
}