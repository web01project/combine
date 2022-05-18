package com.example0.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "manager")
public class Manager {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int mnum;
	@Column(nullable = false)
	//이름
	private String m_name;
	//전화번호
	private String m_call;
	//회사명
	private String m_cname;
	//이메일
	private String m_email;
	//비밀번호
	private String m_pwd;
	//나이
	private int m_age;
	//회사이름
	private String cname;
}
