package com.example0.service;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example0.model.User;
import com.example0.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserRepository userRepository;
	private final BCryptPasswordEncoder encoder;
	
	//가입
	public void register(User user) {
		System.out.println(user);
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		
		userRepository.save(user);
	}
	//유저리스트
	public List<User> ulist(){
		return userRepository.findAllUser();
	}
	//유저삭제
	public void delete(Long id) {
		userRepository.deleteById(id);
	}
	
	//유저상세보기
	public User detail(Long id) {
		return userRepository.findById(id).get();
	}
}
