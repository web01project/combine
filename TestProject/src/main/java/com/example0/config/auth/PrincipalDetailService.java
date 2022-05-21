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
	public UserDetails loadUserByUsername(String useremail) throws UsernameNotFoundException {
		System.out.println("============================");
		System.out.println("loadUserByUserEmail");
		System.out.println(useremail);
		User user = userRepository.findByUseremail(useremail);

		System.out.println(user);
		//유저일때 구분
		if(user == null) {
			throw new UsernameNotFoundException(useremail);
		}
		
		PrincipalDetails pmember = new PrincipalDetails(user);
		System.out.println("puser : " + user);
		System.out.println("============================");
		
		return pmember;
	}
}
