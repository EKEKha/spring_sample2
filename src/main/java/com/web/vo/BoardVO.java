package com.web.vo;

import lombok.Data;

import java.util.Date;

@Data
public class BoardVO extends CommonVO{
	private long nttId;
	private String nttSj;
	private String nttCn;
	private String nttNo;
	private long parentNo;
	private String noticeYn;
	private String AtchFileId;
	private String tempCol1;
	private String tempCol2;


}
