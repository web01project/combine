package com.example0.config.auth;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example0.model.User;
import com.example0.repository.UserRepository;



@Service
public class PrincipalDetailService implements UserDetailsService{
	@Autowired
	private UserRepository userRepository;
	
	//로그인 구현
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername");
		User user = userRepository.findByUsername(username);
		
//		if(user == null) return null;
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
		PrincipalDetails puser = new PrincipalDetails(user);
		System.out.println("puser : " + user);
		return puser;
	}
	
}
