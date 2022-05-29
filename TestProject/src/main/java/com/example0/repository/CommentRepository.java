package com.example0.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example0.model.Review;

public interface CommentRepository 
	extends JpaRepository<Review, Long>{
	
	//댓글추가
	@Modifying
	@Query(value="insert into Review(content, regdate, h_num, u_num) values(?1,now(),?2,?3)",
			nativeQuery = true)
	public void commentInsert(String content, Long h_num, Long u_num);
	
	//@Query("select sc from Review sc  where h_num=?1")
	//@Query("select sc from Review sc join fetch sc.hotel where sc.hotel.h_num=?1") 
	@Query(value ="select * from review where  h_num=?1" , nativeQuery = true) 
	public List<Review> findByhNum(Long h_num);
	
	//내 댓글
	@Query(value = "select * from review where u_num=:id", nativeQuery = true)
	public List<Review> myreply(@Param("id") Long id);
	//내 댓글카운트
	@Query(value = "select count(*) from review where u_num=:id", nativeQuery = true)
	public int myreplycount(@Param("id")Long id);
}
