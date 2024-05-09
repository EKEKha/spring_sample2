package com.web.user.product;


import com.web.user.product.service.ProductService;
import com.web.util.FileUpload;
import com.web.vo.ProductVO;
import com.webjjang.util.PageObject;
import com.webjjang.util.file.FileUtil;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@Log4j
public class ProductController {

	@Autowired
	private ProductService productServiceImpl;
	
	//상품리스트
	@GetMapping("/productList.do")
	public String productList(String prod_kind,PageObject pageObject,Model model)throws Exception{
		log.info("상품게시판 리스트");
		
		
//		if(pageObject.getPerPageNum()==10) pageObject.setPerPageNum(9); //기본셋팅이 10... 9개로 바꿔진다.
//		if(pageObject.getPerGroupPageNum()==10) pageObject.setPerGroupPageNum(5); //기본셋팅이 10... 9개로 바꿔진다.
//
//		model.addAttribute("list", productServiceImpl.list(pageObject,prod_kind));
//		model.addAttribute("pageObject", pageObject);
//	
		
		return "product/list";
	}
	
	//상품가격순조회
	@GetMapping("/pricelist.do")
	public String priceList(String line,PageObject pageObject,Model model,String prod_kind)throws Exception {
		if(pageObject.getPerPageNum()==10) pageObject.setPerPageNum(9); //기본셋팅이 10... 9개로 바꿔진다.
		if(pageObject.getPerGroupPageNum()==10) pageObject.setPerGroupPageNum(5); //기본셋팅이 10... 9개로 바꿔진다.
		
		model.addAttribute("list", productServiceImpl.reList(pageObject,prod_kind,line));
		model.addAttribute("pageObject", pageObject);
		
		return "product/list";
	}
	
	//상품상세보기
	@GetMapping("/prodcutDetail.do")
	public String productView(long prod_id,Model model)throws Exception {
	
		ProductVO vo=productServiceImpl.view(prod_id);
		model.addAttribute("vo",vo );
		
		
		return "product/view";
	}
	
	//상품등록하기 폼
	@GetMapping("/productWrite.do")
	public String productWriteForm()throws Exception{
		
		return "product/write";
	}
	
	//상품등록하기 처리
	@PostMapping("/productWrite2.do")
	public String productWrite(ProductVO vo,HttpServletRequest request)throws Exception{
		log.info("상품등록:"+vo);
		vo.setProd_image(FileUpload.uploadPost(vo.getImageFile(), "/upload/product",request));
		Thread.sleep(2000); 
		productServiceImpl.write(vo);
		
		return "redirect:productWrite.do";
	}
	
	//관리자-상품목록
	@GetMapping("/adminProductList.do")
	public String productList(PageObject pageObject,Model model)throws Exception{
		log.info("상품 리스트-관리자");
		
		
		if(pageObject.getPerGroupPageNum()==10) pageObject.setPerGroupPageNum(5); //기본셋팅이 10...
		
		model.addAttribute("list", productServiceImpl.adminList(pageObject));
		model.addAttribute("pageObject", pageObject);
	
		
		return "admin/productList";
	}
	
	//관리자 -상품수정폼
	@GetMapping("/pdUpdate.do")
	public String pdUpdateForm(long prod_id,Model model) throws Exception{
		
		model.addAttribute("vo",productServiceImpl.view(prod_id));
		return "product/update";
	}
	
	//상품수정
	@PostMapping("/pdUpdate.do")
	public String pdUpdate(ProductVO vo,HttpServletRequest request)throws Exception{
		log.info(vo);
		String updateFile=FileUpload.uploadPost(vo.getImageFile(), "/upload/product",request);
		if(updateFile.equals("")) {
			
			vo.setProd_image(vo.getDeleteName());
			log.info("이미지 수정안할경우!"+vo);
		}else {
			vo.setProd_image(updateFile);
			Thread.sleep(2000); 
			 //기존파일삭제
			log.info("이미지 수정할경우!"+vo);
			 FileUtil.remove(FileUtil.getRealPath("/upload/product", vo.getDeleteName(), request));
			 FileUtil.remove(FileUtil.getRealPath("/upload/product", "s_"+vo.getDeleteName(), request));
		}
		
		log.info(vo);
		productServiceImpl.update(vo);
		Thread.sleep(2000);
		return "redirect:/adminProductList.do";
	}
	
	@GetMapping("/pdDelete.do")
	public String pdDelete(long prod_id,String deleteName,HttpServletRequest request)throws Exception{
		
		productServiceImpl.delete(prod_id);
		
		FileUtil.remove(FileUtil.getRealPath("/upload/product", deleteName, request));
		FileUtil.remove(FileUtil.getRealPath("/upload/product", "s_"+deleteName, request));
		return "redirect:/adminProductList.do";
	}
	
}
