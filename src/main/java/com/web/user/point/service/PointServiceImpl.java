package com.web.user.point.service;

import com.web.mappers.PointMapper;
import com.web.vo.PointVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PointServiceImpl implements PointService {

	@Resource
	private PointMapper mapper;
	@Override
	public PointVO pointRate(int mem_grade) throws Exception {
		// TODO Auto-generated method stub
		return mapper.pointRate(mem_grade);
	}

}
