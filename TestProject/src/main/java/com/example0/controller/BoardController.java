package com.example0.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//숙소관리 컨트롤러
import org.springframework.web.bind.annotation.ResponseBody;

import com.example0.config.auth.PrincipalDetails;
import com.example0.model.Hotel;
import com.example0.model.Reservation;
import com.example0.repository.BoardRepository;
import com.example0.repository.ReservationRepository;
import com.example0.service.BoardService;
import com.example0.service.ReservationService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/hotel/*") //hotel

@RequiredArgsConstructor
@Controller
public class BoardController {
@Autowired
private BoardService boardService;
@Autowired
private BoardRepository boardRepository;
@Autowired
private ReservationService rservice;
@Autowired
private ReservationRepository reservationRepository;

	
	//호텔등록
	@GetMapping("hotelInsert")
	public String insert() {
		return "/hotel/hotelInsert";
	}
	@PostMapping("hotelInsert")
	public String insert(Hotel hotel,HttpSession session,
				@AuthenticationPrincipal PrincipalDetails principal) {
		String uploadFolder = session.getServletContext().getRealPath("/")+"\\resources\\img";
		hotel.setUser(principal.getUser());
		boardService.hotelInsert(hotel,uploadFolder);
		return "redirect:hotellist";
	}
	
	
	//호텔리스트 
	@GetMapping("hotellist")
	public String list(Model model,@RequestParam(name="field",defaultValue = "") String field) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("field", field);
		model.addAttribute("hotels",boardService.findAll());
		model.addAttribute("count",boardService.getCount(map));
		return "/hotel/hotellist";
	}   
	//숙소 상세보기
	@GetMapping("detail/{h_num}")
	public String detail(@PathVariable Long h_num,Model model) {
		model.addAttribute("hotel",boardService.findById(h_num));
		return "/hotel/hotelDetail1";
	}
	//좋아요 추가
	@PutMapping("like")
	@ResponseBody
	public String like(@RequestBody Hotel hotel) {
		boardService.like(hotel);
		return "success";
	}
	
	//좋아요 추가 임시
	@GetMapping("liketest/{h_num}")
	public String like(@PathVariable Long h_num) {
		boardService.liketest(h_num);
		return "/hotel/hotellist";
	}
	
	
	//숙소수정
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody Hotel hotel) {
		boardService.update(hotel);
		return "success";
	} 
	//숙소수정폼
	@GetMapping("update/{h_num}")
	 public String update(@PathVariable Long h_num, Model model) {
		model.addAttribute("hotel", boardService.findById(h_num));
		return "/hotel/hotelupdate";
	}
	//숙소상세보기
	@GetMapping("view/{h_num}")
	public String view(@PathVariable Long h_num, Model model) {
		model.addAttribute("hotel", boardService.findById(h_num) );
		return "/hotel/hotelview";
	}
	
	//숙소예약
	@PostMapping("reservation/{h_num}")
	@ResponseBody
	public String insert(@RequestBody Reservation reservation,
						@AuthenticationPrincipal PrincipalDetails principal,
						@PathVariable Long h_num) {
		Hotel hotel = boardRepository.findById(h_num).get();
		
		reservation.setHotel(hotel);
		reservation.setUser(principal.getUser());
		if(reservationRepository.CheckDate
				(reservation.getCheck_in(),
				reservation.getCheck_out(),
				hotel.getH_num()).isEmpty()) {
			rservice.reservationInsert(reservation);
			return "success";
		}
//		rservice.reservationInsert(reservation);
		return "fail";
	}
	
	//예약폼
	@GetMapping("reservationform/{h_num}")
	public String test(Model model, @PathVariable Long h_num) {
		System.out.println(h_num);
		model.addAttribute("reservation", rservice.reservationList(h_num));
		model.addAttribute("hotel", boardService.findById(h_num));
		return "/hotel/hotelReservation";
	}
}