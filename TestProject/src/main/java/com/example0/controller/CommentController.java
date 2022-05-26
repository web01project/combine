package com.example0.controller;

import java.util.List;

import org.hibernate.annotations.NaturalId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@Autowired
	private BoardRepository boardRepository;
	
	@GetMapping("list/{h_num}")
	public List<Review> list(@PathVariable Long h_num){
		System.out.println(" h_num : "+h_num );
		List<Review> rlist = commentService.list(h_num);
		System.out.println("size : " + rlist.size());
		return rlist;
	}
	
	//댓글삭제
		@DeleteMapping("delete/{num}")
		public Long delete(@PathVariable Long review_num) {
			commentService.delete(review_num);
			return review_num;
		}
	
	//댓글추가
	@PreAuthorize("isAuthenticated()")
	@PostMapping("insert/{num}")
	public ResponseEntity<String> commentInsert(@PathVariable Long num,
				@RequestBody Review review,
				@AuthenticationPrincipal PrincipalDetails principal) {
			System.out.println("principal : " + principal);
			Hotel hotel = boardRepository.findById(num).get();

			review.setPoint(2.3f);
			review.setHotel(hotel);
			review.setUser(principal.getUser());//user
			commentService.insert(review);
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
	
}

