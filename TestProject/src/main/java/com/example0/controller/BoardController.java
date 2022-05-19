package com.example0.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//숙소관리 컨트롤러

import com.example0.model.Hotel;
import com.example0.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/hotel/*") //hotel
@RequiredArgsConstructor
@Controller
public class BoardController {
@Autowired
private BoardService boardService;

	
	//호텔등록
	@GetMapping("hotelInsert")
	public String insert() {
		return "/hotel/hotelInsert";
	}
	@PostMapping("hotelInsert")
	public String insert(Hotel hotel,HttpSession session) {
		String uploadFolder = session.getServletContext().getRealPath("/")+"\\resources\\img";
		boardService.hotelInsert(hotel,uploadFolder);
		return "redirect:hotellist";
	}
	
	
	//호텔리스트
	@GetMapping("hotellist")
	public String list(Model model) {
		model.addAttribute("hotels",boardService.findAll());
		return "/hotel/hotellist";
	}
}
