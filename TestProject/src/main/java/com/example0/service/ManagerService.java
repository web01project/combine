package com.example0.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example0.model.Enterprise;
import com.example0.model.Manager;
import com.example0.repository.EnterpriseRepository;
import com.example0.repository.ManagerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagerService {
	
	private final ManagerRepository managerRepository;
	private final EnterpriseRepository enterpriseRepository;
	private final BCryptPasswordEncoder encoder;
	private Enterprise enterprise;
	
	//회원가입
	public void managerjoin(Manager manager) {
		System.out.println(manager);
//		enterpriseRepository.findById(null);//
		
		String rawPassword = manager.getM_password();
		String encPassword = encoder.encode(rawPassword);
		manager.setM_password(encPassword);
		
		managerRepository.save(manager);
	}
}
