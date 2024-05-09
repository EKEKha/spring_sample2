package com.web.user.member.service;

import com.web.vo.MemberVO;
import com.webjjang.util.PageObject;

import java.util.List;

public interface MemberService {
	
	public MemberVO login(MemberVO vo) throws Exception;

	public MemberVO idCheck(String mem_id) throws Exception;

	public int join(MemberVO vo)throws Exception;

	public MemberVO findId(MemberVO vo) throws Exception;

	public int updateMem(MemberVO vo)throws Exception;

	public int updatePwd(MemberVO vo)throws Exception;

	public int deleteMem(String mem_id)throws Exception;

	public List<MemberVO> userList(PageObject pageObject)throws Exception;

	public int minusPoint(String mem_id, int usePoint)throws Exception;

	public MemberVO findPw(MemberVO vo)throws Exception;

	public int plusPoint(String mem_id, int addPoint)throws Exception;

	public int updateGrade(String mem_id, int i)throws Exception;
	
	
	
}
