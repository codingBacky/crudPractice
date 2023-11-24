package com.backy.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

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
	private DataSource dataSource;
	
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
	@Test
	public void testInsertMember() {
		String sql = "insert into ezen VALUES(?,?,?,?,?)";
		
		for(int i=0; i<100; i++) {
			
			
			try(Connection con = dataSource.getConnection();
			PreparedStatement ps = con.prepareStatement(sql)){
				
				ps.setString(1, "김모양" + i);
				ps.setString(2, "010-2222-" + i);
				ps.setString(3, "우리집" + i);
				ps.setInt(4, i);
				ps.setString(5, "aaa" + i + "@naver.com");
				
				ps.executeUpdate();
				
				
				
			} catch (Exception e) {
				
			}
			
		}
	}
}
