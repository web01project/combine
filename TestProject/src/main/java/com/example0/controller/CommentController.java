package com.example0.controller;

import java.util.List;

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
import com.example0.service.CommentService;

@RestController
@RequestMapping("/reply/*")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
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
	
	@PostMapping("insert/{num}")
	public ResponseEntity<String> commentInsert(@PathVariable Long num,
				@RequestBody Review review,
				@AuthenticationPrincipal PrincipalDetails principal) {
			System.out.println("principal : " + principal);
			
			Hotel h = new Hotel();
			h.setH_num(num);
			review.setPoint(2.3f);
			review.setHotel(h);
			
			/*
			 * User user = new User(); user.setId(1L); user.setUsername("11");
			 */
			
			//System.out.println("princopal.getUser():"+principal.getUser());
			review.setUser(principal.getUser());//user
			review.setPoint(10);
			//comment.setUser(p.getUser());
			commentService.insert(review);
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
	
}

