package com.backy.service;

import java.util.List;

import com.backy.domain.MemberVO;

public interface BoardService {
	
	public List<MemberVO> getAll();
	
	public MemberVO getOne(String email);
	
	public void update(MemberVO vo);
	
	public int insert(MemberVO vo);
	
	public int delete(String email);
}
