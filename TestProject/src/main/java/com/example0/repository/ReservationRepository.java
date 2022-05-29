package com.example0.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example0.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long>{
	 
	// user 의 예약 리스트확인
	@Query(value = "select * from reservation r join hotel h"
			+ " where r.h_num = h.h_num and r.u_num=:id order by r.check_in desc",
					nativeQuery = true)
	public List<Reservation> rservationUserid(@Param("id") Long id);
	
	//호텔 예약리스트 
	@Query(value = "select * from reservation where h_num=:id order by check_in desc",
					nativeQuery = true)
	public List<Reservation> hnumReservation(@Param("id") Long id);
	
	//호텔 예약 확인
	@Query(value = "select * from reservation "
			+ "where h_num=:hnum "
			+ "and (check_out between :indate and :outdate "
			+ "or check_in between :indate and :outdate)",
			nativeQuery = true)//
	public List<Reservation> CheckDate
	(@Param("indate")Date inDate,
	@Param("outdate")Date outDate,
	@Param("hnum")Long hnum);
	
	//유저의 예약 금액합산
	@Query(value = "select sum(h.price) "
			+ "from reservation r join hotel h "
			+ "where r.h_num = h.h_num and r.u_num = :id",
			nativeQuery = true)
	public String pricesum(@Param("id")Long id);
	
	//유저의 예약 카운트
	@Query(value = "select count(*) "
			+ "from reservation "
			+ "where u_num=:id", nativeQuery = true)
	public Long resercount(@Param("id")Long id);
}
