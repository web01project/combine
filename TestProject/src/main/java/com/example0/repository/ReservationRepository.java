package com.example0.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example0.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long>{
	
	// user 의 예약 리스트확인
	@Query(value = "select * from reservation where u_num=:id",
					nativeQuery = true)
	public List<Reservation> rservationUserid(@Param("id") Long id);
	
	@Query(value = "select * from reservation where h_num=:id order by check_in",
					nativeQuery = true)
	public List<Reservation> hnumReservation(@Param("id") Long id);
	
	@Query(value = "select * from reservation "
			+ "where h_num=:hnum "
			+ "and (check_out between :indate and :outdate "
			+ "or check_in between :indate and :outdate)",
			nativeQuery = true)//
	public List<Reservation> CheckDate
	(@Param("indate")Date inDate,
	@Param("outdate")Date outDate,
	@Param("hnum")Long hnum);
}
