package com.example0.model;

import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "hotel")
public class Hotel {
	// 숙소번호
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long h_num;
	// 숙소이름
	private String h_name;
	// 숙소주소
	@Embedded
	private Address h_address;
	// 숙소번호
	private String h_tel;
	// 숙소 등급
	@Enumerated(EnumType.STRING)
	private Grade grade;
	// 숙소 찜
	private Long h_like;
	// 숙소금액
	private int price;
	// 숙소 리뷰
	@OneToMany(mappedBy = "hotel", fetch = FetchType.LAZY)
	private List<Review> reviews;
//	// 업주번호
//	@ManyToOne
//	@JoinColumn(name = "mnum")
//	private Manager manager;
	// 업로드 파일
	@Transient //객체에서 빼기
	private MultipartFile upload;
	// 파일이름
	private String fileimage;
	//숙소 위치(임시)
	private String location;
	//숙소 설명(임시)
	private String content;
}
