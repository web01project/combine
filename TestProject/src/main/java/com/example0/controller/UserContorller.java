package com.example0.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example0.config.auth.PrincipalDetails;
import com.example0.model.Hotel;
import com.example0.model.Reservation;
import com.example0.model.User;
import com.example0.repository.BoardRepository;
import com.example0.repository.ReservationRepository;
import com.example0.service.BoardService;
import com.example0.service.ReservationService;
import com.example0.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/*")
public class UserContorller {

	private final UserService uservice;
	private final ReservationService rservice;
	private final BoardRepository boardRepository;
	private final ReservationRepository reservationRepository;
	
	//마이페이지
	@GetMapping("mypage/{id}")
	public String mypage(Model model,@PathVariable Long id) {
		//내예약 돈합계
		model.addAttribute("price", rservice.pricesum(id));
		//내예약 카운트
		model.addAttribute("count",rservice.count(id));
		return "user/mypage";
	}
	
	//상세보기
	@GetMapping("view/{id}")
	public String view(Model model, @PathVariable Long id) {
		model.addAttribute("user",uservice.detail(id));
		return "user/view";
	}
	
	//수정
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody User user) {
		uservice.update(user);
		return "success";
	}
	
	//삭제
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public String delete(@PathVariable Long id) {
		uservice.delete(id);
		return "success";
	}
	
	//내 예약목록보기
	@GetMapping("reserlist/{id}")
	public String reserlist(@PathVariable Long id, Model model) {
		model.addAttribute("reservations", rservice.rlist(id));
		return "user/myreservation";
	}
	
//	//내장바구니 추가
//	@PostMapping("cartin")
//	@ResponseBody
//	public String cart(@RequestBody HotelCart hotelcart) {
//		cservice.insertcart(hotelcart);
//		return "success";
//	}
//	
//	//내장바구니 폼
//	@GetMapping("cartlist/{id}")
//	public String cartlist(Model model, @PathVariable Long id) {
//		model.addAttribute("cart", cservice.cartlist(id));
//		return "redirect:/user/mycart";
//	}
}
