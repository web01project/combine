package com.example0.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example0.repository.ManagerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerService {
	
	private final ManagerRepository managerRepository;
	private final BCryptPasswordEncoder encoder;
	
	//회원가입
	
}
