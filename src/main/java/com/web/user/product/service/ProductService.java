package com.web.user.product.service;


import com.web.vo.OrderDetailVO;
import com.web.vo.ProductVO;
import com.webjjang.util.PageObject;

import java.util.List;


public interface ProductService {

	
	public List<ProductVO> list(PageObject pageObject,String prod_kind) throws Exception;

	public List<ProductVO> reList(PageObject pageObject, String prod_kind, String line) throws Exception;

	public ProductVO view(long prod_id) throws Exception;

	public int updateQty(List<OrderDetailVO> orderdetailList)throws Exception;

	public  List<ProductVO> mainList()throws Exception;

	public int write(ProductVO vo)throws Exception;

	public List<ProductVO>  adminList(PageObject pageObject) throws Exception;

	public int update(ProductVO vo)throws Exception;

	public int delete(long prod_id)throws Exception;


	
	
	

	
	/*
	 * @Override public List<ImageVO> list(PageObject pageObject) throws Exception {
	 * // TODO Auto-generated method stub
	 * pageObject.setTotalRow(mapper.getTotalRow(pageObject)); return
	 * mapper.list(pageObject); }
	 * 
	 * @Override public ImageVO view(long no) throws Exception { // TODO
	 * Auto-generated method stub return mapper.view(no); }
	 * 
	 * @Override public int imageChange(ImageVO vo) throws Exception { // TODO
	 * Auto-generated method stub return mapper.imageChange(vo); }
	 * 
	 * @Override public int write(ImageVO vo) throws Exception { // TODO
	 * Auto-generated method stub return mapper.write(vo); }
	 * 
	 * @Override public int update(ImageVO vo) throws Exception { // TODO
	 * Auto-generated method stub return mapper.update(vo); }
	 * 
	 * @Override public int delete(long no) throws Exception { // TODO
	 * Auto-generated method stub return mapper.delete(no); }
	 */

}
