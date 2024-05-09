package com.web.vo;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class OrderVO {
	private String order_id;
	private String mem_id;
	private String o_name;
	private String o_phone;
	private String o_email;
	private String o_address1;
	private String o_address2;
	private String o_address3;
	private Date o_date;
	private String o_status;
	private int totalPrice;
	private int usePoint;
	private String o_require;
	
	private MemberVO memberVO;
	
	 List<OrderDetailVO> orderDetailList;
}
	
