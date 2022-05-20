package com.example0.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "manager")
public class Manager {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long mnum;
	@Column(nullable = false)
	// 이름
	private String m_name;
	// 전화번호
	private String m_tel;
	// 이메일
	private String manageremail;
	// 비밀번호
	private String m_password;
	//사업자번호
	private String m_businessnum;
	// 나이
	private int m_age;
	// 회사이름
	@ManyToOne
	@JoinColumn(name = "e_name")
	private Enterprise enterprise;
	// 호텔
	@OneToMany(mappedBy = "manager")
	private List<Hotel> hotels;
	//권한
	private String role;
}
