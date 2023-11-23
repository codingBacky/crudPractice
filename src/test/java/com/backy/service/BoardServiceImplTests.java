package com.backy.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.backy.domain.MemberVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceImplTests {

	@Autowired
	private BoardService service;
	
	@Test
	public void testGetList() {
		service.getAll().forEach(board -> log.info(board));
	}
	@Test
	public void testGetOne() {
		service.getOne("choi@naver.com");
	}
	@Test
	public void testUpdate() {
		MemberVO vo = MemberVO.builder()
				.name("테스트")
				.phone("01088888888")
				.age(10)
				.email("choi@naver.com")
				.build();
		
		service.update(vo);
	}
	@Test
	public void testInsert() {
		MemberVO vo = MemberVO.builder()
			.name("테스트이름22")
			.phone("01044455552")
			.age(10)
			.email("테스트2@naver.com")
			.build();
		service.insert(vo);
	}
	@Test
	public void testDelete() {
		service.delete("choi@naver.com");
	}
}
