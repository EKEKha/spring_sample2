package com.web.board.service;

import com.web.mappers.BoardMapper;

import com.web.vo.BoardVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
	private BoardMapper mapper;


	@Override
	public List<BoardVO> list(BoardVO boardVO) throws Exception {
		return mapper.list(boardVO);
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
