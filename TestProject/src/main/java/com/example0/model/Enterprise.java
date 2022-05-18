package com.example0.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@AllArgsConstructor
public class Enterprise {
	@Id
	// 회사이름
	private String e_name;
	// 관리자 아이디
	private String e_id;
	// 관리자 비밀번호
	private String e_password;
	// 사업자번호

}
