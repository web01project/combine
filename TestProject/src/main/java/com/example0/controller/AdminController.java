package com.example0.controller;

import org.aspectj.weaver.NameMangler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example0.repository.UserRepository;
import com.example0.service.EnterpriseService;
import com.example0.service.ManagerService;
import com.example0.service.UserService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/ad/*")
@RequiredArgsConstructor
@Controller
public class AdminController {
	
	private final UserService uservice;
	private final ManagerService mservice;
	
	@RequestMapping("userList")
	public String userlist(Model model) {
		model.addAttribute("users",uservice.list());
		return "redirect:/admin/userList";
	}
	public String managerlist(Model model) {
		model.addAttribute("managers",mservice.list());
		return "redirect:/admin/managerList";//
	}
}
