package com.example0.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example0.model.Enterprise;
import com.example0.model.User;

public interface EnterpriseRepository 
		extends JpaRepository<Enterprise, String>{
//	Enterprise findByE_name(String e_name);
//	Enterprise findby
}
