package com.example0.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "reservation")
public class Reservation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	//주문번호
	private String or_num;
	//회원번호
	@ManyToOne
	@JoinColumn(name = "user_id")
	private String user_id;
	//숙소번호
	@ManyToOne
	@JoinColumn(name = "")
	private String room_num;
	//인원
	private int people;
	//체크인시간
	private String check_in;
	//체크아웃시간
	private String check_out;

}
