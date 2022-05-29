package com.example0.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example0.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Long>{
	//장바구니 목록
	@Query(value = "select * from cart where u_num=:id order by check_in desc",nativeQuery = true)
	public List<Cart> mycartlist(@Param("id") Long id);
	
	//장바구니 카운트
	@Query(value = "select count(*) from cart where u_num=:id",
			nativeQuery = true)
	public Long cartCount(@Param("id") Long id);
}
