package com.example0.repository;


import java.util.HashMap;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example0.model.Hotel;

public interface BoardRepository extends JpaRepository<Hotel, Long> {

	@Query(value ="select * from hotel order by price" ,countQuery = "select count(*) from hotel", nativeQuery = true)
	public Page<Hotel>priceCategory(Pageable pageable);
	/*
	 * @Query("select count(*) from Hotel") public int getCount(HashMap<String,
	 * Object> map);
	 */
	//가격 검색 개수
	/*
	 * @Query(value = "select count(*) from hotel", nativeQuery=true) public Long
	 * cntTitleSearch();
	 */
	//위치기반 검색리스트
	Page<Hotel> findByLocation1Containing(String location1,Pageable pageable);

	
	@Query(value = "select count(*) from hotel where location1 like CONCAT('%', :word, '%') ", 
			  nativeQuery=true)
	public Long cntLocationSearch(@Param("word") String  word);
	
	@Query("select count(*) from Hotel")
	public int getCount(HashMap<String, Object> map);

	@Query(value = "select * from hotel where u_num=:id", nativeQuery = true)
	public List<Hotel> myHotel(@Param("id") Long id);

//>>>>>>> branch 'main' of https://github.com/web01project/combine.git
}

 