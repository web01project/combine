package com.example0.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example0.model.Hotel;

public interface BoardRepository extends JpaRepository<Hotel, Long> {
	
	@Query("select count(*) from Hotel")
	public int getCount(HashMap<String, Object> map);

	@Query(value = "select * from hotel where u_num=:id", nativeQuery = true)
	public List<Hotel> myHotel(@Param("id") Long id);
}

 