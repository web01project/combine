package com.example0.controller;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example0.config.auth.PrincipalDetails;
import com.example0.model.Hotel;
import com.example0.model.Review;
import com.example0.model.User;
import com.example0.repository.BoardRepository;
import com.example0.service.CommentService;

@RestController
@RequestMapping("/reply/*")
public class CommentController {
	@Autowired
	private CommentService commentService;
	//댓글리스트
	@Autowired
	private BoardRepository boardRepository;
	
	 @GetMapping("list/{h_num}") 
	 public List<Review> list(@PathVariable Long h_num){ 
		System.out.println("h_num  :  "+h_num ); 
	 List<Review> rlist =
	 commentService.list(h_num); 
	 System.out.println("size : " + rlist.size());
	 return rlist; }
	 
	//댓글삭제
	@DeleteMapping("delete/{num}")
	public Long delete(@PathVariable Long num) {
		commentService.delete(num);
		return num;
	}
	//댓글추가
	
	@PostMapping("insert/{num}")
	public ResponseEntity<String> commentInsert(@PathVariable Long num,
				@RequestBody Review review,
				@AuthenticationPrincipal PrincipalDetails principal) {
			System.out.println("principal : " + principal);
			Hotel h = boardRepository.findById(num).get();
			review.setHotel(h);
			review.setUser(principal.getUser());//user
			
			commentService.insert(review);
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
		
		 //게시글 전체보기(페이징 , 검색)
		  
			/*
			 * @GetMapping("list") public String list(Model model,
			 * 
			 * @PageableDefault(size = 5, sort ="num", direction = Direction.DESC) Pageable
			 * pageable) { Page<Review> rlists = commentService.findAll(pageable);
			 * model.addAttribute("reviews",rlists);
			 * model.addAttribute("count",myreplycount); return "/hotel/hotellist"; }
			 */
		 
}

