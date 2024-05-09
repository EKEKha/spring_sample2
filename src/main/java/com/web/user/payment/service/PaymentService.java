package com.web.user.payment.service;

import com.web.vo.PaymentVO;

public interface PaymentService {

	int insert(PaymentVO payment)throws Exception;

	PaymentVO getPayment(String order_id)throws Exception;

}
