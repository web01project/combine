package com.example0.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.transaction.Transactional;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//@Tostring
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Transactional
@Table
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	//이름
	private String name;
	//이메일
	@Column(nullable = false)
	private String useremail;
	//비밀번호
	private String password;
	//나이
	private int age;
	//전화번호
	private String tel;
	//권한
	private String role;
	//사업자번호
	private String businessnum;
	//유저:리뷰 1:다 연결
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	@JsonIgnoreProperties("user")
	@JsonBackReference
	private List<Review> reviews;
	
}
