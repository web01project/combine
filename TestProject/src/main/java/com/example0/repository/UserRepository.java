package com.example0.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example0.model.User;

public interface UserRepository 
			extends JpaRepository<User, Long>{
	User findByUseremail(String useremail);
	
}
