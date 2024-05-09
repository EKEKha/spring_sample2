package com.web.user.member.service;

import com.web.mappers.MemberMapper;
import com.web.vo.MemberVO;
import com.webjjang.util.PageObject;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.login(vo);
	}

	@Override
	public MemberVO idCheck(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.idCheck(mem_id);
	}

	@Override
	public int join(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.join(vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.findId(vo);
	}

	@Override
	public int updateMem(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateMem(vo);
	}

	@Override
	public int updatePwd(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updatePwd(vo);
	}

	@Override
	public int deleteMem(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.deleteMem(mem_id);
	}

	@Override
	public List<MemberVO> userList(PageObject pageObject) {

		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.userList(pageObject);
	}

	@Override
	public int minusPoint(String mem_id, int usePoint) throws Exception {
		// TODO Auto-generated method stub
		return mapper.minusPoint(mem_id, usePoint);
	}

	@Override
	public MemberVO findPw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.findPw(vo);
	}

	@Override
	public int plusPoint(String mem_id, int addPoint) throws Exception {
		// TODO Auto-generated method stub
		return mapper.plusPoint(mem_id, addPoint);
	}

	@Override
	public int updateGrade(String mem_id, int i) throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateGrade(mem_id, i);
	}
	
	

	

}
