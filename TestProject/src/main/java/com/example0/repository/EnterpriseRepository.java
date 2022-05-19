package com.example0.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example0.model.Enterprise;

public interface EnterpriseRepository 
		extends JpaRepository<Enterprise, Long>{

}
