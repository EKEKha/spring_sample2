package com.web.user.review.service;

import com.web.vo.ReviewVO;
import com.webjjang.util.PageObject;

import java.util.List;

public interface ReviewService {

	public List<ReviewVO> list(PageObject pageObject)throws Exception;
	
	//view
		public ReviewVO view(long board_no) throws Exception;
		
		//imageChnage 처리
		public int imageChange(ReviewVO vo) throws Exception;
			
		//write처리
		public int write(ReviewVO vo) throws Exception;

		//update처리
		public int update(ReviewVO vo) throws Exception;

		//delete처리
		public int delete(long board_no) throws Exception;

}
