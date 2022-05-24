package com.example0.repository;

import java.awt.print.Pageable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example0.model.User;

public interface UserRepository 
			extends JpaRepository<User, Long>{
	User findByUseremail(String useremail);
	
	//쿼리 어드민제외 리스트
	@Query(value = "select * from user where role != 'ROLE_ADMIN' order by role",
					nativeQuery = true)
	public List<User> findAllUser();
	
//	Page<User>findByEmailContaining(String email, Pageable pageable);
	
	
	
	
	
}
