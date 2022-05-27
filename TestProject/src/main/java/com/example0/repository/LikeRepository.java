package com.example0.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example0.model.HotelLike;

public interface LikeRepository extends JpaRepository<HotelLike, Long> {
	//좋아요 테이블 추가
	@Modifying
	@Query(value="insert into hotel_like(hotellike_num, h_num, u_num) values(?1,?2,?3)",
			nativeQuery = true)
	public void createBoardLike(Long hotellike_num, Long h_num, Long u_num);
	//좋아요 테이블 삭제
	@Modifying
	@Query(value="delete from hotel_like where h_num = #{h_num} and u_num = #{u_num}",
			nativeQuery = true)
	public void deleteBoardLike(Long h_num, Long u_num);

	//호텔 테이블  총 like 갯수 증감
	@Modifying
	@Query(value="update hotel set h_like = (select count(*) from hotel_like where h_num = #{h_num}) where h_num = #{h_num}",
			nativeQuery = true)
	public void updateBoardLike(Long h_like, Long h_num, Long u_num);

	//좋아요 갯수 반환
	@Modifying
	@Query(value="select count(*) from hotel_like where where h_num = #{h_num} and u_num = #{u_num}",
			nativeQuery = true)
	public Long getBoardLike(Long h_num, Long u_num);

}