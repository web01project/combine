package com.example0.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.boot.context.properties.bind.DefaultValue;
 
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter @Setter
@AllArgsConstructor @NoArgsConstructor
@Entity

public class HotelLike {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long hotellike_num;
	
	// 유저번호
	@ManyToOne
	@JoinColumn(name = "u_num")
	private User user;
	
	// 유저번호
	@ManyToOne
	@JoinColumn(name = "h_num")
	private Hotel hotel;
		
}
