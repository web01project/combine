package com.example0.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

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
}

 