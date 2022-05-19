package com.example0.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example0.model.Enterprise;
import com.example0.model.Manager;
import com.example0.repository.ManagerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerService {
	
	private final ManagerRepository managerRepository;
	private final BCryptPasswordEncoder encoder;
	
	//회원가입
	public void managerjoin(Manager manager) {
		System.out.println(manager);
//		Enterprise enterprise;
//		manager.setEnterprise(enterprise);
		String rawPassword = manager.getM_password();
		String encPassword = encoder.encode(rawPassword);
		manager.setM_password(encPassword);
		
		managerRepository.save(manager);
	}
}
