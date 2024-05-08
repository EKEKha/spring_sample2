package com.web.vo;

import lombok.Data;

import java.util.Date;


@Data
public class CommonVO{

	private String del_yn;

	private String crt_id;

	private Date crt_dt;

	private String crt_ip_addr;

	private String upd_id;

	private Date upd_dt;

	private String upd_ip_addr;

}
