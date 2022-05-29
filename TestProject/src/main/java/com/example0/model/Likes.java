package com.example0.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.boot.context.properties.bind.DefaultValue;
 
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter @Setter
@AllArgsConstructor @NoArgsConstructor
@Entity

public class Likes {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long hotellike_num;
	
	// 유저번호

	private Long u_num;
	
	// 유저번호 
	
	private Long h_num;

}
