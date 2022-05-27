package com.example0.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example0.model.HotelLike;
import com.example0.repository.LikeRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class LikeService {

	private final LikeRepository likeRepository;

	@Transactional
	public void insertHotelLike(HotelLike h_like) {
		likeRepository.save(h_like);
		likeRepository.updateBoardLike(h_like.getHotel().getH_like(), h_like.getHotel().getH_num(),
				h_like.getUser().getId());
		// likeRepository.updateBoardLike(h_like.getHotellike_num(),h_like.getHotel().getH_num(),h_like.getUser().getId());

		// likeRepository.createBoardLike(h_like.getHotellike_num(),h_like.getHotel().getH_num(),h_like.getUser().getId());

	}
 
	@Transactional
	public void deleteHotelLike(HotelLike h_like) {
		// likeRepository.deleteById(h_like.getUser().getId());
		likeRepository.deleteBoardLike(h_like.getHotel().getH_num(), h_like.getUser().getId());
		likeRepository.updateBoardLike(h_like.getHotel().getH_like(), h_like.getHotel().getH_num(),
				h_like.getUser().getId());

	}

	@Transactional
	public Long get_BoardLike(HotelLike h_like) {
		return likeRepository.get_BoardLike(h_like.getHotel().getH_num(), h_like.getUser().getId());
	}
}
