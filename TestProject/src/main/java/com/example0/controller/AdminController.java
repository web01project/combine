package com.example0.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example0.service.UserService;
import lombok.RequiredArgsConstructor;

@RequestMapping("/ad/*")
@RequiredArgsConstructor
@Controller
public class AdminController {
	
	private final UserService uservice;
	
	//유저리스트
	@GetMapping("userList")
	public String userlist(Model model) {
		model.addAttribute("users",uservice.ulist());
		return "admin/userList";
	}
	
	//유저삭제
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		uservice.delete(id);
		return "success";
	}
}
