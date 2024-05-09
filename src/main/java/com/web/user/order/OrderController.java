package com.web.user.order;


import com.web.user.member.service.MemberService;
import com.web.user.order.service.OrderService;
import com.web.user.payment.service.PaymentService;
import com.web.user.point.service.PointService;
import com.web.user.product.service.ProductService;
import com.web.vo.*;
import com.webjjang.util.PageObject;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@Log4j
public class OrderController {

	@Autowired
	private OrderService orderServiceImpl;
	
	@Autowired
	private ProductService productServiceImpl;
	
	@Autowired
	private MemberService memberServiceImpl;
	
	@Autowired
	private PointService pointServiceImpl;

	@Autowired
	private PaymentService paymentServiceImpl;
	
	//주문서 폼요청
	@PostMapping("/productOrderform.do")
	public String orderFrom(ProductVO vo,Model model,int o_amount,HttpServletResponse response) throws Exception {
		
		if(o_amount>vo.getProd_amount()) {
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('재고가 부족합니다. 판매자에게 문의해주세요')");
			out.println("history.back();");
			out.println("</script>");
			out.flush();
			
		
		}else {
		int sum= vo.getProd_price()*o_amount;
		String info="";
		if (sum<70000) {
			info="상품구매금액:"+sum+"원 +배송비:2500원";
			sum+=2500;}
		else {
			info="상품구매금액:"+sum+"원 +배송비:0원";
			}
		model.addAttribute("vo", vo);
		model.addAttribute("sum", sum);
		model.addAttribute("info", info);
		
		}
		return"order/orderForm";
	}
	
	//주문하기
	@PostMapping("/ProductOrder.do")
	public String order(String mem_id,int mem_grade,OrderVO order,OrderDetailVO orderDetail,PaymentVO payment,HttpSession session) throws Exception{
		log.info("주문하기처리");
		log.info(order);
	//주문번호 생성:  날짜+ 랜덤6자리수
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	String ym=year+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
	String ymd=ym+new DecimalFormat("00").format(cal.get(Calendar.DATE));
	String subNum="";
	
	for(int i=1;i<=6;i++) {
		subNum+=(int)(Math.random()*10);
	}
	
	String order_id=ymd+"-"+subNum;
		
	
	/**order_id**/
	 order.setOrder_id(order_id);
	 orderDetail.setOrder_id(order_id);
	 payment.setOrder_id(order_id);
	 payment.setRealPrice(order.getTotalPrice()-order.getUsePoint());
	 
	 List <OrderDetailVO> orderdetailList=new ArrayList<OrderDetailVO>();
	 orderdetailList.add(orderDetail);

		log.info(order);
		log.info(orderDetail);
		log.info(orderdetailList);
		log.info(payment);
		
		  //주문정보입력
		  orderServiceImpl.orderInsert(order);
		  orderServiceImpl.orderDetailInsert(orderdetailList);
		 
		  //결제정보 입력
		  paymentServiceImpl.insert(payment);
		  
		  //재고수량감소
		  productServiceImpl.updateQty(orderdetailList);
		  
		  //사용포인트 차감
		  if(order.getUsePoint()!=0) {
			  memberServiceImpl.minusPoint(mem_id,order.getUsePoint());
		  }
		  
		  //구매금액 적립(순서: 포인트테이블에서 등급에대한 비율을가져온다)
		  PointVO pointVO=pointServiceImpl.pointRate(mem_grade);
		  log.info(pointVO);
//		  순서2 얻은 포인트율에 구매금액과 계산하여 적립될 포인트를 얻음
		  int addPoint=(int)(order.getTotalPrice()*pointVO.getPoint_rate()/100.0);
//		  순서3 포인트 조정
		  log.info("포인트 적립");
		  memberServiceImpl.plusPoint(mem_id,addPoint);
		  
		  
		  //등급조정
		  //회원의 총구매금액의 정보를 얻어와서 
		  OrderVO vo2=orderServiceImpl.memberTotalMoney(mem_id);
		  log.info(vo2);
		  if(vo2.getTotalPrice()>pointVO.getUp_grade()&&pointVO.getMem_grade()==1) {//point 테이블에 있는 금액보다 회원구매금액이 크면 등급조정
			 
			  memberServiceImpl.updateGrade(mem_id,0);//등급조정
			  //등급바뀌면 다시 세션조정,.. 아니면 위에서 세션으로 
			  //추후에 위에서 세션으로 받아온 mem_grade를 db에 접근해서 얻어오면 이부분은 지워도 되지않을까???
		  }
		  
		  session.setAttribute("login", memberServiceImpl.idCheck(mem_id)); //포인트랑...다시 조정해야하니까?
		  log.info(vo2.getTotalPrice());
		  
		  
		
		return "redirect:myOrder.do?mem_id="+mem_id;
		
	}
	
	
	//나의 주문내역보기
	@GetMapping("/myOrder.do")
	public String myOrderPage(Model model,String mem_id,PageObject pageObject)throws Exception {
		if(pageObject.getPerPageNum()==10) pageObject.setPerPageNum(6); //기본셋팅이 10... 9개로 바꿔진다.
		if(pageObject.getPerGroupPageNum()==10) pageObject.setPerGroupPageNum(5); //기본셋팅이 10... 9개로 바꿔진다.
		
		model.addAttribute("vo", orderServiceImpl.myOrderList(pageObject,mem_id));
		model.addAttribute("pageObject", pageObject);
		return "order/myOrder";
		
	}
	
	//주문내역 상세보기
	@GetMapping("/orderDetail.do")
	public String OrderDetailView(Model model,String order_id) throws Exception{
		
		model.addAttribute("order", orderServiceImpl.getOrder(order_id));
		model.addAttribute("detail", orderServiceImpl.getOrderDetail(order_id));
		
		model.addAttribute("pay", paymentServiceImpl.getPayment(order_id));
		log.info(paymentServiceImpl.getPayment(order_id));
		return "order/orderDetail";
	}
	
	//주문상태변경
	@GetMapping("/orderStatus.do")
	public String orderStatus(OrderVO vo) throws Exception {
		
		orderServiceImpl.updateStatus(vo.getO_status(),vo.getOrder_id());
		
		return "redirect:/myOrder.do?mem_id="+vo.getMem_id();
	}
	
}