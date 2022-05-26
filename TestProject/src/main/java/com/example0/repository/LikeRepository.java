package com.example0.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example0.model.HotelLike;

public interface LikeRepository extends JpaRepository<HotelLike, Long> {
	 
	
}
