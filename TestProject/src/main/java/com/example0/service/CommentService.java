package com.example0.service;

import java.util.List;

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
	
	
	//댓글리스트 
	public List<Review> list(Long review_num){
		return commentRepository.findByhNum(review_num);
	}
	//댓글쓰기
	@Transactional
	public void insert(Review review) {
		/*
		 * Hotel h = boardRepository .findById(review.getHotel().getH_num()).get();
		 */
			
		/*
		 * commentRepository.commentInsert( review.getContent(),
		 * review.getHotel().getH_num(), review.getUser().getId() );
		 */
		commentRepository.save(review);
		}
	//삭제
	@Transactional
	public void delete(Long review_num) {
		commentRepository.deleteById(review_num);
		
	}
}
