package com.web.mappers;

import com.web.vo.ReviewVO;
import com.webjjang.util.PageObject;

import java.util.List;

public interface ReviewMapper {

	//list
	public List<ReviewVO> list(PageObject pageObject)throws Exception;
	
	//+++전체데이터갯수(imageService에서 추가 페이지처리를위한)
	public long getTotalRow(PageObject pageObject) throws Exception;
	
	
	//view
	public ReviewVO view(long board_no) throws Exception;
	//write처리
	public int write(ReviewVO vo) throws Exception;

	
	//imageChnage 처리
	public int imageChange(ReviewVO vo) throws Exception;
	
	//update처리
	public int update(ReviewVO vo) throws Exception;

	//delete처리
	public int delete(long board_no) throws Exception;
	
}
