package com.example0.controller;

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

import com.example0.model.Reservation;
import com.example0.model.User;
import com.example0.repository.ReservationRepository;
import com.example0.service.ReservationService;
import com.example0.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/*")
public class UserContorller {

	private final UserService uservice;
	private final ReservationService rservice;
	private final ReservationRepository reservationRepository;
	
	//마이페이지
	@GetMapping("mypage")
	public String mypage() {
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
	
	//테스트
	@GetMapping("test")
	public String test(Model model) {
		model.addAttribute("reservation", rservice.reservationList());
		return "/reservation_test/test_reservation";
	}
	
	//예약
	@PostMapping("reservation")
	@ResponseBody
	public String insert(@RequestBody Reservation reservation) {
		if(reservationRepository.findByCheckDate().isEmpty()) {
			rservice.reservationInsert(reservation);
			return "success";
		}
		return "fail";
	}
}
