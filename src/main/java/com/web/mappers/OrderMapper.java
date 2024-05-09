package com.web.mappers;

import com.web.vo.OrderDetailVO;
import com.web.vo.OrderVO;
import com.webjjang.util.PageObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {


	public int orderInsert(OrderVO order)throws Exception;

	public int orderDetailInsert(List<OrderDetailVO> orderdetailList)throws Exception;
	
	public OrderVO memberTotalMoney(String mem_id)throws Exception;
	
	//주문리스트
	public List<OrderVO> myOrderList(@Param("pageObject")PageObject pageObject,@Param("mem_id")String mem_id)throws Exception;
	
	//주문리스트 페이지처리
	public long getTotalRow(@Param("pageObject")PageObject pageObject,@Param("mem_id")String mem_id) throws Exception;
	
	//////////주문번호에대한 주문상세
	public OrderVO getOrder(String order_id)throws Exception;

	public List<OrderDetailVO> getOrderDetail(String order_id)throws Exception;
	
	////////////

	//주문상태변경
	public int updateStatus(@Param("o_status")String o_status, @Param("order_id")String order_id)throws Exception;
	

	public List<OrderDetailVO> orderItemList(String mem_id)throws Exception;
	
	public long todayTotal()throws Exception;

}
