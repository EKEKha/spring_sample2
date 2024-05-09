package com.web.mappers;

import com.web.vo.MemberVO;
import com.webjjang.util.PageObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberMapper {
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	//아이디 중복체크+내정보보기
	public MemberVO idCheck(String mem_id) throws Exception;
	
	//회원가입
	public int join(MemberVO vo)throws Exception;
	
	//아이디찾기
	public MemberVO findId(MemberVO vo) throws Exception;
	
	//비밀번호찾기위한 멤버정보
	public MemberVO findPw(MemberVO vo)throws Exception;
	
	//회원정보수정
	public int updateMem(MemberVO vo)throws Exception;
	
	//비밀번호 수정
	public int updatePwd(MemberVO vo)throws Exception;
	
	//회원탈퇴
	public int deleteMem(String mem_id)throws Exception;
	
	//회원리스트
	public List<MemberVO> userList(PageObject pageObject);
	
	//회원리스트 페이지처리
	public long getTotalRow(PageObject pageobject);
	
	//사용포인트 차감
	public int minusPoint(@Param("mem_id")String mem_id, @Param("usePoint")int usePoint)throws Exception;
	
	
	//구매적립금 증가
	public int plusPoint(@Param("mem_id")String mem_id, @Param("addPoint")int addPoint)throws Exception;
	
	//등급변경
	public int updateGrade(@Param("mem_id")String mem_id,@Param("mem_grade")int i)throws Exception;
}