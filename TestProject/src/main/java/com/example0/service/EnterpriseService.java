package com.example0.service;

import java.lang.reflect.Member;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example0.model.User;
import com.example0.repository.EnterpriseRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EnterpriseService {

	private final EnterpriseRepository enterpriseRepository;
	
	//회원리스트
	public List<Object> memberList() {
		return null;
	}
}
