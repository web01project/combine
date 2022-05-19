package com.example0.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example0.model.Manager;

public interface ManagerRepository
		extends JpaRepository<Manager, Long>{
}
