package com.web.user.board.service;


import com.web.vo.BoardVO;
import com.webjjang.util.PageObject;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface BoardService {
	
//	//리스트
	public List<BoardVO> list(PageObject pageObject) throws Exception;


	public int write(BoardVO boardVO)throws Exception;

	public int count(BoardVO boardVO)throws Exception;
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
