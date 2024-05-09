package com.web.user.review.service;

import com.web.mappers.ReviewMapper;
import com.web.vo.ReviewVO;
import com.webjjang.util.PageObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Resource
	private ReviewMapper mapper;

	@Override
	public List<ReviewVO> list(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public ReviewVO view(long board_no) throws Exception {
		
		return mapper.view(board_no);
	}
	
	@Override
	public int write(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int imageChange(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public int update(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long board_no) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(board_no);
	}
}
