package com.web.user.payment.service;

import com.web.mappers.PaymentMapper;
import com.web.vo.PaymentVO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Resource
	private PaymentMapper mapper;
	
	@Override
	public int insert(PaymentVO payment) throws Exception {
		// TODO Auto-generated method stub
		return mapper.insert(payment);
	}

	@Override
	public PaymentVO getPayment(String order_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getPayment(order_id);
	}

}
