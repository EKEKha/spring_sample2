package com.web.board.service;

import com.web.mappers.BoardMapper;

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
	public List<?> list(Map param) throws Exception {
		return mapper.list(param);
	}

	@Override
	public int write(Map param) throws Exception {
		return mapper.write(param);

	}
}
