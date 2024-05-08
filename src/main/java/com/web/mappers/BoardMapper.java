package com.web.mappers;


import com.web.vo.BoardVO;
import com.webjjang.util.PageObject;

import java.util.List;

public interface BoardMapper {

	public List<BoardVO> list(PageObject pageObject) throws Exception;

	public int write(BoardVO boardVO) throws Exception;

	public int count(BoardVO boardVO) throws Exception;
}
