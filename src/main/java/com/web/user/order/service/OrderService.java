package com.web.user.order.service;


import com.web.vo.OrderDetailVO;
import com.web.vo.OrderVO;
import com.webjjang.util.PageObject;

import java.util.List;


public interface OrderService {

	



	public int orderInsert(OrderVO order)throws Exception;

	public int orderDetailInsert(List<OrderDetailVO> OrderDetailVO)throws Exception;

	public OrderVO memberTotalMoney(String mem_id)throws Exception;

	public List<OrderVO> myOrderList(PageObject pageObject, String mem_id)throws Exception;
	

	public OrderVO getOrder(String order_id)throws Exception;

	public List<OrderDetailVO> getOrderDetail(String order_id)throws Exception;

	public int updateStatus(String o_status, String order_id)throws Exception;

	public List<OrderDetailVO> orderItemList(String mem_id) throws Exception;

	public long todayTotal()throws Exception;

	
	
	

}
