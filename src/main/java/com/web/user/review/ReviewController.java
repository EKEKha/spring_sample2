package com.web.user.review;



import com.web.user.order.service.OrderService;
import com.web.user.product.service.ProductService;
import com.web.user.review.service.ReviewService;
import com.web.util.FileUpload;
import com.web.vo.ReviewVO;
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
public class ReviewController {

	@Autowired
	private ReviewService reviewServiceImpl;

	@Autowired
	private ProductService productServiceImpl;

	@Autowired
	private OrderService orderServiceImpl;


	//리뷰리스트
	@GetMapping("/review/list.do")
	String revList(PageObject pageObject,Model model)throws Exception {
		log.info("이미지게시판리스트");
//
//		if(pageObject.getPerPageNum()==10) pageObject.setPerPageNum(6); //기본셋팅이 10... 9개로 바꿔진다.
//		if(pageObject.getPerGroupPageNum()==10) pageObject.setPerGroupPageNum(5); //기본셋팅이 10... 9개로 바꿔진다.
//
//		model.addAttribute("list", reviewServiceImpl.list(pageObject));
//		model.addAttribute("pageObject", pageObject);


		return"review/list";
	}

	//리뷰글보기
	 @GetMapping("/reviewDetail.do")
	 String revView(long board_no,long prod_id,Model model) throws Exception{

		 log.info("후기상세보기");
		 model.addAttribute("vo", reviewServiceImpl.view(board_no));
		 model.addAttribute("pd", productServiceImpl.view(prod_id));
		 log.info(productServiceImpl.view(board_no));
		 return"review/view";

	 }

	 //리뷰 글쓰기 폼
	 @GetMapping("/reviewWriteForm.do")
	 String writeForm(Model model,String mem_id)throws Exception{

		 //구매목록




		 model.addAttribute("order",orderServiceImpl.orderItemList(mem_id));

		 return "review/write";
	 }

	 //리뷰글쓰기 처리
	 @PostMapping("/reviewWrite.do")
	 String revWrite(ReviewVO vo,HttpServletRequest request)throws Exception{
		log.info("리뷰게시판등록"+vo);

		/*
		 * vo.setRev_fileName(FileUtil.upload("/upload/review", vo.getImageFile(),
		 * request));
		 */

		vo.setRev_fileName(FileUpload.uploadPost(vo.getImageFile(), "/upload/review",request));


		//이미지가 업로드 되는 시간을 벌어서 기다리는 처리를 한다.
		Thread.sleep(2000); //try-catch 해야하는데 위에 throws exception하니까 생략가능

		reviewServiceImpl.write(vo);


		log.info(vo);
		 return "redirect:reviewList.do";
	 }




	 //리뷰글수정폼불러오기
	 @GetMapping("/reviewUpdateForm.do")
	 String updateForm(long board_no,Model model)throws Exception{

		 log.info("리뷰게시판 수정품");

		 ReviewVO vo=reviewServiceImpl.view(board_no);

		 model.addAttribute("vo",vo );
			/*
			 * //섬네일 생성 (섬네일 파일 이름은 중간에 "s_"로 시작하도록) String thumbnailSaveName = uploadPath +
			 * File.separator + folderPath + File.separator + "s_" + fileName; File
			 * thumbnailFile = new File(thumbnailSaveName);
			 *
			 * Thumbnailator.createThumbnail(savePath.toFile(), thumbnailFile,100,100);
			 * Thumbnailator.creat
			 */

		 return "review/update";
	 }

	 //리뷰글수정
	 @PostMapping("/reviewUpdate.do")
	 String revUpdate(ReviewVO vo,HttpServletRequest request)throws Exception{

		 log.info(vo);
		 String updateFile=FileUpload.uploadPost(vo.getImageFile(), "/upload/reivew",request);
		 if(updateFile.equals("")){
			 vo.setRev_fileName(vo.getDeleteName());
			 vo.setRev_originName(vo.getDeleteOriginName());
			 log.info("이미지 수정안할경우!"+vo);
		 }else {

			 vo.setRev_fileName(updateFile);

			 //기존파일삭제
			 Thread.sleep(1000);

			 FileUtil.remove(FileUtil.getRealPath("/upload/reivew", vo.getDeleteName(), request));
			 FileUtil.remove(FileUtil.getRealPath("/upload/reivew", "s_"+vo.getDeleteName(), request));
			 log.info("이미지 수정할경우!"+vo);
		 }

		 log.info(vo);
			reviewServiceImpl.update(vo);
			 Thread.sleep(1000);

			 return "redirect:reviewList.do";
	 }


	 //리뷰글삭제
	 @GetMapping("/reviewDelete.do")
	 String revDelete(long board_no,String rev_fileName,HttpServletRequest request)throws Exception{


		 //파일삭제먼저
		 log.info(rev_fileName);

		 if(rev_fileName!=null){

			 Thread.sleep(1000);

			 FileUtil.remove(FileUtil.getRealPath("/upload/reivew", rev_fileName, request));
			 FileUtil.remove(FileUtil.getRealPath("/upload/reivew", "s_"+rev_fileName, request));
			}



		 reviewServiceImpl.delete(board_no);

		 return "redirect:/reviewList.do";
	 }

	/*
	 *
	 *
	 *
	 * @Getmapping("reviewList.do") String revList() {
	 *
	 * return""; }
	 *
	 * @Getmapping("reviewList.do") String revList() {
	 *
	 * return""; }
	 *
	 * @Getmapping("reviewList.do") String revList() {
	 *
	 * return""; }
	 *
	 * @Getmapping("reviewList.do") String revList() {
	 *
	 * return""; }
	 */

}
