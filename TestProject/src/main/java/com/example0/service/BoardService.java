package com.example0.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example0.model.Hotel;
import com.example0.repository.BoardRepository;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;
	//숙소등록
	public void hotelInsert(Hotel hotel,String uploadFolder) {
		UUID uuid = UUID.randomUUID();
		MultipartFile file = hotel.getUpload(); //실제 업로드할 파일(숙소 이미지)
		String uploadFileName="";
		if(!file.isEmpty()) { //파일이 선택된 경우 파일이름 설정
			uploadFileName = uuid.toString() +"_"+ file.getOriginalFilename();
			File saveFile = new File(uploadFolder,uploadFileName);
			try {
				file.transferTo(saveFile); //파일 업로드
				hotel.setFileimage(uploadFileName); //테이블에 저장될 파일이름
				
				boardRepository.save(hotel);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}//if
	}//hotelInsert
	//전체보기
	public List<Hotel> findAll(){
		return boardRepository.findAll();
	}
	//수정하기
	@Transactional
	public void update(Hotel hotel) {
		Hotel b = boardRepository.findById(hotel.getH_num()).get();
		b.setH_name(hotel.getH_name());
		b.setLocation1(hotel.getLocation1());
		b.setUpload(hotel.getUpload());
		b.setContent(hotel.getContent());
		b.setPrice(hotel.getPrice());
	}
	//상세보기
	@Transactional
	public Hotel findById(Long h_num) {
		Hotel hotel = boardRepository.findById(h_num).get();
		return hotel;
		
	}
}
