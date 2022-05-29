package com.example0.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example0.model.Likes;
import com.example0.repository.LikeRepository;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class LikesService {

	private final LikeRepository likeRepository;
	@Transactional
	public void insertHotelLike(Long h_num,Long u_num) {
		likeRepository.createBoardLike(h_num, u_num);
		likeRepository.updateBoardLike(u_num);
		//likeRepository.createBoardLike(h_like.getHotellike_num(),h_like.getHotel().getH_num(),h_like.getUser().getId());
 
	}
	@Transactional
	public void deleteHotelLike(Long h_num,Long u_num) {
		likeRepository.deleteBoardLike(h_num,u_num);
		likeRepository.updateBoardLike(h_num);
		//likeRepository.deleteBoardLike(h_like.getHotel().getH_num(),h_like.getUser().getId());
	}
	
	 @Transactional public int getBoardLike(Long h_num,Long u_num) { return
	  likeRepository.getBoardLike(h_num,u_num);
	 }
	
}
