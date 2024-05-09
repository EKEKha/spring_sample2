package com.web.user.order.service;

import com.web.mappers.OrderMapper;
import com.web.vo.OrderDetailVO;
import com.web.vo.OrderVO;
import com.webjjang.util.PageObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

	@Resource
	private OrderMapper mapper;

	@Override
	public int orderInsert(OrderVO order) throws Exception {
		
		return mapper.orderInsert(order);
	}

	@Override
	public int orderDetailInsert(List<OrderDetailVO> orderdetailList) throws Exception {
		// TODO Auto-generated method stub
		return mapper.orderDetailInsert(orderdetailList);
	}

	@Override
	public OrderVO memberTotalMoney(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.memberTotalMoney(mem_id);
	}

	@Override
	public List<OrderVO> myOrderList(PageObject pageObject,String mem_id) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRow(pageObject,mem_id));
		return mapper.myOrderList(pageObject,mem_id);
	}

	@Override
	public OrderVO getOrder(String order_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getOrder(order_id);
	}

	@Override
	public List<OrderDetailVO> getOrderDetail(String order_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getOrderDetail(order_id);
	}

	@Override

	public int updateStatus(String o_status, String order_id)throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateStatus(o_status,order_id);
	}

	@Override
	public List<OrderDetailVO> orderItemList(String mem_id) throws Exception {
		// TODO Auto-generated method stub
		
		return mapper.orderItemList(mem_id);
	}

	@Override
	public long todayTotal() throws Exception {
		// TODO Auto-generated method stub
		return mapper.todayTotal();
	}

	
	


}
