package com.example0.service;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.example0.model.Reservation;
import com.example0.repository.ReservationRepository;
import com.example0.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationService {
	
	private final ReservationRepository reservationRepository;
	
	//예약리스트(유저)//
	public List<Reservation> rlist(Long id){
		return reservationRepository.rservationUserid(id);
	}
	
	//예약리스트 전체
	public List<Reservation> reservationList(Long h_num){
		return reservationRepository.hnumReservation(h_num);
	}
	
	//예약
	public Reservation reservationInsert(Reservation reservation) {
		return reservationRepository.save(reservation);
	}
	//내 예약 돈 합계
	public String pricesum(Long id) {
		return reservationRepository.pricesum(id);
	}
	//내 예약 카운트
	public Long count(Long id) {
		return reservationRepository.resercount(id);
	}
	
	
}
