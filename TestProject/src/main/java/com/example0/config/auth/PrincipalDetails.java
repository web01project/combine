package com.example0.config.auth;

import java.util.ArrayList;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example0.model.Manager;
import com.example0.model.User;

import lombok.Getter;
//CustomUser
@Getter
public class PrincipalDetails implements UserDetails{

	private User user;
//	private Manager manager;
	
	public PrincipalDetails(User user) {
		this.user = user;
	}
//	public PrincipalDetails(Manager manager) {
//		this.manager = manager;
//	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
		collect.add(()->{
			return user.getRole();
		});
		return collect; 
	}
	
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getU_password();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getUseremail();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
