package com.example0.repository;

import java.util.HashMap;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example0.model.Hotel;

public interface BoardRepository extends JpaRepository<Hotel, Long> {
	
	@Query("select count(*) from Hotel")
	public int getCount(HashMap<String, Object> map);
	
	
}
