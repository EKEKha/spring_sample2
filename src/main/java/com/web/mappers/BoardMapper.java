package com.web.mappers;


import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface BoardMapper {

	public List<?> list(Map param) throws Exception;


	public int write(Map param) throws Exception;
}
