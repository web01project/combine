package com.example0.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//숙소관리 컨트롤러
import org.springframework.web.bind.annotation.ResponseBody;

import com.example0.model.Hotel;
import com.example0.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/hotel/*") //hotel

@RequiredArgsConstructor
@Controller
public class BoardController {
@Autowired
private BoardService boardService;

	
	//호텔등록
	@GetMapping("hotelInsert")
	public String insert() {
		return "/hotel/hotelInsert";
	}
	@PostMapping("hotelInsert")
	public String insert(Hotel hotel,HttpSession session) {
		String uploadFolder = session.getServletContext().getRealPath("/")+"\\resources\\img";
		boardService.hotelInsert(hotel,uploadFolder);
		return "redirect:hotellist";
	}
	
	
	//호텔리스트 
	@GetMapping("hotellist")
	public String list(Model model,@RequestParam(name="field",defaultValue = "") String field) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("field", field);
		model.addAttribute("hotels",boardService.findAll());
		model.addAttribute("count",boardService.getCount(map));
		return "/hotel/hotellist";
	}   
	//숙소 상세보기
	@GetMapping("detail/{h_num}")
	public String detail(@PathVariable Long h_num,Model model) {
		model.addAttribute("hotel",boardService.findById(h_num));
		return "/hotel/hotelDetail";
	}
	
	
	//숙소수정
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody Hotel hotel) {
		boardService.update(hotel);
		return "success";
	}
	//숙소수정폼
	@GetMapping("update/{h_num}")
	 public String update(@PathVariable Long h_num, Model model) {
		model.addAttribute("hotel", boardService.findById(h_num));
		return "/hotel/hotelupdate";
	}
	//숙소상세보기
	@GetMapping("view/{h_num}")
	public String view(@PathVariable Long h_num, Model model) {
		model.addAttribute("hotel", boardService.findById(h_num) );
		return "/hotel/hotelview";
	}
	
}