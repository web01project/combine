package com.example0.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.boot.context.properties.bind.DefaultValue;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
//@Tostring
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table
public class Review {
	// 리뷰 기본키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long review_num;
	// 리뷰 내용
	private String content;
	// 리뷰 작성일
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date regdate;
	// 점수
	private float point;
	// 리뷰:유저 다:1 연결
	@ManyToOne
	@JoinColumn(name = "u_num")
	private User user;
	// 리뷰:호텔 다:1 연결
	@ManyToOne
	@JoinColumn(name = "h_num")
	private Hotel hotel;
	// 업로드 파일
	@Transient //객체에서 빼기
	private MultipartFile upload;
	// 파일이름
	private String fileimage;
}
