package com.backy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.backy.domain.Criteria;
import com.backy.domain.MemberVO;
import com.backy.domain.PageDTO;
import com.backy.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri,Model model) {
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.total()));
	}
	@GetMapping({"/get","/modify"})
	public void get(String email, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("member", service.getOne(email));
	}
	@PostMapping("/modify")
	public void modify(MemberVO vo) {
		service.update(vo);
	}
	@PostMapping("/remove")
	public String remove(String email) {
		System.out.println(email);
		service.delete(email);
		return "redirect:/member/list";
	}
	@GetMapping("/register")
	public void register() {
	}
	@PostMapping("/register")
	public void registerInsert(MemberVO vo) {
		service.insert(vo);
	}
	
	
	
	
}
