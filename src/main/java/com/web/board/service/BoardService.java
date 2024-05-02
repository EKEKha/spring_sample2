package com.web.board.service;


import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface BoardService {
	
//	//리스트
	public List<?> list(Map param) throws Exception;


	public int write(Map param)throws Exception;
//
//	/*
//	 * mapper에만전체데이터 갯수 public long getTotalRow(PageObject pageObject) throws Exception;
//	 */
//
//	//질문하기 글
//	public int question(QnaVO vo) throws Exception;
//
//	//질문답변보기
//	public QnaVO view(long no,int inc) throws Exception;
//
//	//질문답변처리
//	public int answer(QnaVO vo) throws Exception;
//
//	//수정하기
//	public int update(QnaVO vo) throws Exception;
//
//	//삭제하기
//	public int delete(long no) throws Exception;
}
