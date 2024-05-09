package com.web.vo;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Data
public class ReviewVO {
	private long board_no;
	private long prod_id;
	private String mem_id;
	private String rev_content;
	private String rev_score;
	private Date rev_date;
	private String rev_fileName;
	private String rev_originName;
	
	//삭제할 이미지 파일명 전달받아서 
	private String deleteName;
	private String deleteOriginName;
	//첨부되어서 올라오는 파일 input name이름과같게
	private MultipartFile imageFile;
}
