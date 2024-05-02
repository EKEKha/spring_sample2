package com.web.mappers;


import com.web.vo.BoardVO;

import java.util.List;

public interface BoardMapper {

	public List<BoardVO> list(BoardVO boardVO) throws Exception;

	public int write(BoardVO boardVO) throws Exception;

	public int count(BoardVO boardVO) throws Exception;
}
