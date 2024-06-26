package com.web.user.board.service;

import com.web.mappers.BoardMapper;

import com.web.vo.BoardVO;
import com.webjjang.util.PageObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
	private BoardMapper mapper;


	@Override
	public List<BoardVO> list(PageObject pageObject) throws Exception {
		return mapper.list(pageObject);
	}

	@Override
	public int write(BoardVO boardVO) throws Exception {
		return mapper.write(boardVO);

	}

	@Override
	public int count(BoardVO boardVO) throws Exception {
		return 0;
	}
}
