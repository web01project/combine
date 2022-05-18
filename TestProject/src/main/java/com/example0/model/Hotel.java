package com.example0.model;

import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name = "hotel")
public class Hotel {
	//숙소번호
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long h_num;
	//숙소이름
	private String h_name;
	//숙소주소
	@Embedded
	private Address h_address;
	//숙소번호
	private String h_tel;
	//숙소 등급
	@Enumerated(EnumType.STRING)
	private Grade grade;
	//숙소 찜
	private	long like;
	//숙소금액
	private int price;
	//숙소 리뷰
	@OneToMany(mappedBy ="hotel" )
	private List<Review> reviews;
	
	//업주번호 
	
}
