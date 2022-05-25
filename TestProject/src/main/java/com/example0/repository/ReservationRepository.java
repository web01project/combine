package com.example0.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example0.model.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Long>{
	
	// user 의 예약 
	@Query(value = "select * from reservation where u_num=id",
					nativeQuery = true)
	public List<Reservation> findByUserid(@Param("id") Long id);
	
//	@Query(value = "select * from reservation "
//			+ "where check_in between indate and outdate "
//			+ "and chcek_out between indate and outdate "
//			+ "and h_num=hid")//
//	public List<Reservation> findByCheckDate
//	(@Param("indate")Date indate, 
//	@Param("outdate")Date outdate, 
//	@Param("hid")Long hid);
}
