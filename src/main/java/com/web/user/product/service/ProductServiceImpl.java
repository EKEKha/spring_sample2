package com.web.user.product.service;

import com.web.mappers.ProductMapper;
import com.web.vo.OrderDetailVO;
import com.web.vo.ProductVO;
import com.webjjang.util.PageObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

	@Resource
	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> list(PageObject pageObject,String prod_kind) throws Exception {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject,prod_kind));
		return mapper.list(pageObject,prod_kind);
	}

	@Override
	public List<ProductVO> reList(PageObject pageObject, String prod_kind, String line) throws Exception {
		
		pageObject.setTotalRow(mapper.getTotalRow(pageObject,prod_kind));
		
		return mapper.reList(pageObject, prod_kind, line);
	}

	@Override
	public ProductVO view(long prod_id) throws Exception {
		
		return mapper.view(prod_id);
	}

	@Override
	public int updateQty(List<OrderDetailVO> orderdetailList)throws Exception {
		// TODO Auto-generated method stub
		return mapper.updateQty(orderdetailList);
	}

	@Override
	public List<ProductVO> mainList()throws Exception {
		// TODO Auto-generated method stub
		return mapper.mainList();
	}

	@Override
	public int write(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public List<ProductVO> adminList(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getTotalRowList(pageObject));
		return mapper.adminList(pageObject);
	}

	@Override
	public int update(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int delete(long prod_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.delete(prod_id);
	}

}
