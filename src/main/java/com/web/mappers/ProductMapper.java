package com.web.mappers;

import com.web.vo.OrderDetailVO;
import com.web.vo.ProductVO;
import com.webjjang.util.PageObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
	
	//list
	public List<ProductVO> list(@Param("pageObject")PageObject pageObject,@Param("prod_kind")String prod_kind) throws Exception;
	
	//전체데이터 갯수구하기
	public long getTotalRow(@Param("pageObject")PageObject pageObject,@Param("prod_kind")String prod_kind) throws Exception;
	
	//가격순 list
	public List<ProductVO> reList(@Param("pageObject")PageObject pageObject, @Param("prod_kind")String prod_kind,@Param("line") String line) throws Exception;
	
	//상품보기
	public ProductVO view(long prod_id) throws Exception;

	//재고수량 감소
	public int updateQty(List<OrderDetailVO> orderdetailList);
	
	//메인화면
	public  List<ProductVO> mainList()throws Exception;
	
	//상품등록
	public int write(ProductVO vo)throws Exception;
	
	//관리자 상품리스트
	public List<ProductVO>  adminList(PageObject pageObject) throws Exception;
	public long getTotalRowList(PageObject pageObject) throws Exception;
	
	//상품수정
	public int update(ProductVO vo)throws Exception;
	
	//상품삭제
	public int delete(long prod_id)throws Exception;
	
	
	/*
	 * //list public List<ImageVO> list(PageObject pageObject)throws Exception;
	 * 
	 * //view public ImageVO view(long no) throws Exception;
	 * 
	 * //imageChnage 처리 public int imageChange(ImageVO vo) throws Exception;
	 * 
	 * //write처리 public int write(ImageVO vo) throws Exception;
	 * 
	 * //update처리 public int update(ImageVO vo) throws Exception;
	 * 
	 * //delete처리 public int delete(long no) throws Exception;
	 */
}
