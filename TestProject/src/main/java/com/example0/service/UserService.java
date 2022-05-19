package com.example0.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example0.model.User;
import com.example0.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	//유저 회원 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder encoder;
	//회원 가입
	public void userjoin(User user) {
		 String rawPassword = user.getU_password();
		  String encPassword = encoder.encode(rawPassword);
		  user.setU_password(encPassword);
		  userRepository.save(user);
	}
	
	//리스트
	public List<User> list(){
		return userRepository.findAll();
	}
}
