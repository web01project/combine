package com.example0.config.auth;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example0.model.Manager;
import com.example0.model.User;
import com.example0.repository.ManagerRepository;
import com.example0.repository.UserRepository;



@Service
public class PrincipalDetailService implements UserDetailsService{
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ManagerRepository managerRepository;
	
	//로그인 구현
	@Override
	public UserDetails loadUserByUsername(String useremail) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername");
		User user = userRepository.findByUseremail(useremail);
//		Manager manager = managerRepository.findByManageremail(useremail);
		
		//유저일때 구분
		if(user == null) {
			throw new UsernameNotFoundException(useremail);
		}
		
		PrincipalDetails puser = new PrincipalDetails(user);
		System.out.println("puser : " + user);
		
		//매니저일때 구분
		
//		PrincipalDetails muser = new PrincipalDetails(manager);
//		System.out.println("muser : " + manager);
		
		return puser;
	}
}
