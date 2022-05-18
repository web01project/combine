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
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long user_id;
	private String username;
	private String password;
	private String email;
	private String num;
	private int age;
	@OneToMany(mappedBy = "review", fetch = FetchType.LAZY)
	@JoinColumn(name = "review")
	private List<Review> review;
	
	@ManyToOne
	@JoinColumn(name = "entername")
	private Enterprise enterprise;
	
}
