package com.example0.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.example0.model.Cart;
import com.example0.repository.CartRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CartService {
	private final CartRepository cartRepository;
	
	//내 카트담기
	@Transactional
	public Cart cartInsert(Cart cart) {
		return cartRepository.save(cart);
	}
	//내 카트 리스트
	public List<Cart> cartList(Long uid){
		return cartRepository.mycartlist(uid);
	}
	//내 카트 지우기
	@Transactional
	public void cartDelete(Long cart_num) {
		cartRepository.deleteById(cart_num);
	}
	//내 카트 카운트
	public Long count(Long id) {
		return cartRepository.cartCount(id);
	}
}
