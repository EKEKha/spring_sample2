package com.web.vo;

import lombok.Data;

@Data
public class MemberVO {

	 private String mem_id;
	 private String mem_pwd;
	 private String mem_name;
	 private String mem_email;
	 private String mem_call;
	 private String mem_postcode;
	 private String mem_address1;
	 private String mem_address2;
	 private int mem_grade;
	 private int mem_point;

}
