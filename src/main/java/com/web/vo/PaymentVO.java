package com.web.vo;

import lombok.Data;

import java.util.Date;

@Data
public class PaymentVO {

	private long r_no;
	private int pay_status; //0: 입금대기 1: 입금완료 2:결제완료(카드)
	private String order_id;
	private String pay_kind;
	private String pay_bank; //입금은행
	private String pay_name; 
	private Date pay_date;
	private int realPrice;
	
}
