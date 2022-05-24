package com.example0.service;

import java.util.List;

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
		return reservationRepository.findByUserid(id);
	}
}
