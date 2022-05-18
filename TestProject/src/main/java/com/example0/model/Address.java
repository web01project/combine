package com.example0.model;

import javax.persistence.Embeddable;

@Embeddable
public class Address {
	// 우편번호
	private String zipcode;
	// 주소
	private String address1;
	// 상세주소
	private String address2;
}
