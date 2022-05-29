package com.example0.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example0.config.auth.PrincipalDetails;
import com.example0.model.Hotel;
import com.example0.model.Reservation;
import com.example0.model.User;
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
	
	
	/*
	 * //호텔리스트
	 * 
	 * @GetMapping("hotellist") public String list(Model
	 * model,@RequestParam(name="field",defaultValue = "") String field) {
	 * HashMap<String,Object> map = new HashMap<String, Object>(); map.put("field",
	 * field); model.addAttribute("hotels",boardService.findAll());
	 * model.addAttribute("count",boardService.getCount(map)); return
	 * "/hotel/hotellist"; }
	 */
	//페이징 숙소 리스트
	@GetMapping("hotellist")
	public String list(Model model,
			@PageableDefault(size = 6 , direction = Direction.DESC) Pageable pageable,
			@RequestParam(required = false, defaultValue =  "")	String field, 
			@RequestParam(required = false, defaultValue =  "")	String field2,
			@RequestParam(required = false, defaultValue = "")	String word) {
		Page<Hotel> lists= boardService.findAll(field, field2,word,pageable);
		//카운트
		Long count = boardService.count(field,word);
		
		System.out.println(word);
		System.out.println(field);
		System.out.println(field2);
		model.addAttribute("count",count);
		model.addAttribute("hotels",lists);
		model.addAttribute("word", word);
		return "/hotel/hotellist";
	}
	
	//숙소 상세보기
	@GetMapping("detail/{h_num}")
	public String detail(@PathVariable Long h_num,Model model) {
		model.addAttribute("hotel",boardService.findById(h_num));
		return "/hotel/hotelDetail1";
	}

	/*
	 * @RequestMapping(value = "/read", method = RequestMethod.GET) public void
	 * read(@RequestParam("h_num") Long h_num, Model model, HttpServletRequest
	 * httpRequest) throws Exception {
	 * 
	 * Long u_num = 1L;
	 * 
	 * Likes likes = new Likes(); likes.setH_num(h_num); likes.setU_num(u_num); int
	 * boardlike = likesService.getBoardLike(h_num,u_num);
	 * 
	 * System.out.println("강:"+boardlike);
	 * 
	 * model.addAttribute("heart",1); }
	 */ 
	
	
	
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
	//숙소삭제
	@DeleteMapping("delete/{num}")
	@ResponseBody
		public String delete(@PathVariable Long num) {
		boardService.delete(num);
		return "success";
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