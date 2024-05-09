package com.web.mappers;

import com.web.vo.PaymentVO;

public interface PaymentMapper {
	
	int insert(PaymentVO payment)throws Exception;
	
	PaymentVO getPayment(String order_id)throws Exception;
}
