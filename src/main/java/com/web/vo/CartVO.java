package com.web.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class CartVO implements Serializable {
	
	private long prod_id;
	private String prod_name; //상품명
	private int o_amount; //수량
	private int prod_price; //가격
	private String prod_image; //상품이미지
	private int totalMoney;
	private String encoding_prod_name;

	
	public void setTotalMoney(int price,int qty) {
		
		this.totalMoney=price*qty;
		
			
	}
}
