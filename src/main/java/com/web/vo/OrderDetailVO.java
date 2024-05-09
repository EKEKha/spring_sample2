package com.web.vo;



import lombok.Data;

@Data
public class OrderDetailVO {

	private long order_detailNum;
	private String order_id;
	private long prod_id;
	private int prod_price;
	private int o_amount;
	private String prod_name;
	

	
}
