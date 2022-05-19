package com.example0.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example0.model.Hotel;

public interface BoardRepository extends JpaRepository<Hotel, Long> {

}
