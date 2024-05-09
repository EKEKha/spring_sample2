package com.web.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class ProductVO {

	private long prod_id;
	private String prod_name;
	private String prod_kind;
	private int prod_price;
	private int prod_amount;
	private String prod_content;
	private String prod_image;
	private String prod_status;
	private Date prod_date;
	private String main_nb;
	
	private MultipartFile imageFile;//db에 없음
	private String deleteName;
	
}
