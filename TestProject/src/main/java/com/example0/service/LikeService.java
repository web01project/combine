package com.example0.service;

import org.springframework.stereotype.Service;

import com.example0.model.HotelLike;
import com.example0.repository.LikeRepository;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class LikeService {

	private final LikeRepository likeRepository;
	 
	public void insertHotelLike(HotelLike h_like) {
		likeRepository.save(h_like);
		likeRepository.updateBoardLike(h_like.getHotellike_num(),h_like.getHotel().getH_num(),h_like.getUser().getId());
		//likeRepository.createBoardLike(h_like.getHotellike_num(),h_like.getHotel().getH_num(),h_like.getUser().getId());

	}
	public void deleteHotelLike(HotelLike h_like) {
		likeRepository.deleteById(h_like.getUser().getId());
		likeRepository.updateBoardLike(h_like.getHotellike_num(),h_like.getHotel().getH_num(),h_like.getUser().getId());
		//likeRepository.deleteBoardLike(h_like.getHotel().getH_num(),h_like.getUser().getId());
	}
	public Long getBoardLike(HotelLike h_like) {
		return likeRepository.getBoardLike(h_like.getHotel().getH_num(),h_like.getUser().getId());
	}
}
