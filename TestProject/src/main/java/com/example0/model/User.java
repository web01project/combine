package com.example0.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
@Entity
@Table
public class User {
	// 유저 기본키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long u_num;
	// 유저이름
	private String username;
	// 유저비밀번호
	private String password;
	// 유저이메일
	private String email;
	// 유저전화번호
	private String num;
	// 유저 나이
	private int age;
	// 유저:리뷰 1:다 연결
	@OneToMany(mappedBy = "review", fetch = FetchType.LAZY)
	@JoinColumn(name = "review")
	private List<Review> review;
	// 유저:회사 다:1 연결
	@ManyToOne
	@JoinColumn(name = "e_name")
	private Enterprise enterprise;
	//
}
