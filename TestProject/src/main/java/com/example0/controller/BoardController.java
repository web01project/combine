package com.example0.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
//숙소관리 컨트롤러

import lombok.RequiredArgsConstructor;

@RequestMapping("/hotel/*") //hotel
@RequiredArgsConstructor
@Controller
public class BoardController {

	
	//호텔등록
	@GetMapping("hotelInsert")
	public String insert() {
		return "/hotel/hotelInsert";
	}
	//호텔리스트
}
