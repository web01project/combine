package com.example0.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example0.model.Hotel;
import com.example0.model.Review;
import com.example0.repository.BoardRepository;
import com.example0.repository.CommentRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CommentService {
	private final BoardRepository boardRepository;
	private final CommentRepository commentRepository;
	
	//호텔댓글리스트 
	public List<Review> list(Long review_num){
		return commentRepository.findByhNum(review_num);
	}
	//댓글쓰기
	@Transactional
	public void insert(Review review) {
		/*
		 * Hotel h = boardRepository .findById(review.getHotel().getH_num()).get();
		 */
			
//			commentRepository.commentInsert(
//			   review.getContent(),
//			   review.getHotel().getH_num(),
//			   review.getUser().getId()
//	     	);
		commentRepository.save(review);
		}
	//삭제
	@Transactional
	public void delete(Long num) {
		commentRepository.deleteById(num);
	}
	
	//내댓글 리스트
	public List<Review> myreply(Long n_num){
		return commentRepository.myreply(n_num);
	}
	
	
	//내 댓글 카운트
	public int myreplycount(Long n_num) {
		return commentRepository.myreplycount(n_num);
	}
	//페이징
	public Page<Review> findAll(Pageable pageable) {
		return commentRepository.findAll(pageable);
	}
}
