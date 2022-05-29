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
import com.example0.model.Cart;
import com.example0.model.Hotel;
import com.example0.model.Reservation;
import com.example0.model.User;
import com.example0.repository.BoardRepository;
import com.example0.repository.CartRepository;
import com.example0.repository.ReservationRepository;
import com.example0.service.BoardService;
import com.example0.service.CartService;
import com.example0.service.CommentService;
import com.example0.service.ReservationService;
import com.example0.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/*")
public class UserContorller {

	private final UserService uservice;
	private final ReservationService rservice;
	private final BoardService bservice;
	private final CommentService cservice;
	private final CartService cartservice;
	private final BoardRepository boardRepository;
	private final ReservationRepository reservationRepository;
	private final CartRepository cartRepository;
	
	//마이페이지
	@GetMapping("mypage/{id}")
	public String mypage(Model model,@PathVariable Long id) {
		//내예약 돈합계
		model.addAttribute("price", rservice.pricesum(id));
		//내예약 카운트
		model.addAttribute("count",rservice.count(id));
		//내 댓글 카운트
		model.addAttribute("replycnt", cservice.myreplycount(id));
		//내 장바구니 카운트
		model.addAttribute("cartcount", cartservice.count(id));
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
	
	//내 호텔 리스트
	@GetMapping("myhotel/{id}")
	public String myhotel(@PathVariable Long id, Model model) {
		model.addAttribute("myhotel", bservice.myhotel(id));
		return "user/myhotellist";
	}
	
	//내 댓글 리스트폼
	@GetMapping("myreply/{id}")
	public String replylist(@PathVariable Long id, Model model) {
		model.addAttribute("myreply", cservice.myreply(id));
		return "user/myreply";
	}
	
	//내가 찜한호텔폼
	@GetMapping("mylike/{id}")
	public String likelist(@PathVariable Long id, Model model) {
//		model.addAttribute("likes", );
		return "user/mylike";
	}
	
	//내장바구니 추가
	@PostMapping("cartin/{h_num}")
	@ResponseBody
	public String cartInsert(@RequestBody Cart cart,
								@AuthenticationPrincipal PrincipalDetails principal,
								@PathVariable Long h_num) {
		Hotel hotel = boardRepository.findById(h_num).get();
		cart.setHotel(hotel);
		cart.setUser(principal.getUser());
		
		cartservice.cartInsert(cart);
		return "success";
	}
	
	//내장바구니 폼에서 예약 ->장바구니에서삭제 
	//-> 예약중복확인 -> 예약에서추가
	@PostMapping("cartreservation/{cartnum}")
	@ResponseBody
	public String cartReservation(@PathVariable Long cartnum) {
		Cart cart = cartRepository.findById(cartnum).get();
		System.out.println(cart);
		
		//예약 테이블에 값 저장해두기		
		Reservation r = new Reservation();
		r.setCheck_in(cart.getCheck_in());
		r.setCheck_out(cart.getCheck_out());
		r.setHotel(cart.getHotel());
		r.setPeople(cart.getPeople());
		r.setUser(cart.getUser());
		System.out.println(r);

		//예약테이블 중복확인
		if(reservationRepository.CheckDate
				(cart.getCheck_in(),
				cart.getCheck_out(),
				cart.getHotel().getH_num()).isEmpty()) {
			//예약테이블 추가
			rservice.reservationInsert(r);
			//장바구니 삭제
			cartservice.cartDelete(cart.getCart_num());
			return "success";
		}
		return "fail";
	}
	
	//내장바구니 폼
	@GetMapping("mycart/{id}")
	public String cartList(@PathVariable Long id, Model model) {
		model.addAttribute("cart", cartservice.cartList(id));
		return "user/mycart";
	}
	
	//내장바구니 삭제
	@DeleteMapping("mycartdel/{cartnum}")
	@ResponseBody
	public Long cartDel(@PathVariable Long cartnum,
					@AuthenticationPrincipal PrincipalDetails principal) {
		cartservice.cartDelete(cartnum);
		return cartnum;
	}
}
