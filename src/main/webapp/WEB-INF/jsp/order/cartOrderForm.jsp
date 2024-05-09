<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서작성</title>
	 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/cart.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../resources/js/orderForm.js"></script>  

     <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
 function setDisplay(){
    if($('input:radio[id=aaa]').is(':checked')){
        $('#bankDiv').hide();
    }else{
        $('#bankDiv').show();
    }
}
</script>

</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>
	

<div class="hero page-inner overlay" style="background-image: url('images/hero_bg_1.jpg')">
      
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">주문서작성</h1>

          </div>
        </div>
      </div>
    </div>

	
	
     <div class="section section-properties">
		<div class="container">
			
			<div class="row">
				<div class="col-md-12">
					
				<div class="table-wrap" style="padding:40px;">
						<table class="table" style="width:50%; margin:0 auto;">
						  <thead class="thead-primary" >
						    <tr>
						    	<th>&nbsp;</th>
						    	<th>&nbsp;</th>
						    	<th>Product</th>
						      <th>Price</th>
						      <th>Quantity</th>
						      <th>&nbsp;</th>
						      <th>total</th>
						      <th>&nbsp;</th>
						    </tr>
						  </thead>
						 	 
						<c:forEach var="vo" items="${cartList}" varStatus="status">
						    <tr class="alert" role="alert">
						      
						    	<td>
						    		<label class="checkbox-wrap checkbox-primary">
										  <input type="checkbox" checked>
										  <span class="checkmark"></span>
										</label>
						    	</td>
						    	<td>
						    		<a href="prodcutDetail.do?prod_id=${vo.prod_id }">
						    		<div class="img" style="background-image: url(upload/product/s_${vo.prod_image});"></div>
						    		</a>
						    	</td>
						      <td>
						      	
						      		<span>${vo.prod_name}</span>
						      		
						      
						      </td>
						      <td><fmt:formatNumber pattern="###,###,###원" value="${vo.prod_price}"/></td>
						      <td class="quantity">
					        	<div class="input-group">
				             	<input type="text" name="quantity" class="quantity form-control input-number" value="${vo.o_amount}" min="1" max="100">
				        
				          	</div>
				          
				          </td>
				         
				         
				      
		 
				      <td><fmt:formatNumber pattern="###,###,###원" value="${vo.prod_price*vo.o_amount}"/></td>
				
						<td>
						      	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				            	<span aria-hidden="true"><i class="fa fa-close"></i></span>
				          	</button>
				        	</td>
				        		
				        	
						    </tr>
					</c:forEach>
					
						  </tbody>
						
						</table>
					</div>
					
					
					
					<div class="container" style="margin:30px;">
					<div class="row">
							<div class="col-md-6">
							     <h2 class="font-weight-bold heading text-primary mb-3 mb-md-0" >
			           			total:<span class="price"> <fmt:formatNumber
											pattern="###,###,###원" value="${sum}" />


									</span>
								</h2>
			           			    ${info}<br>     
			           			    
			        	  </div>
				          <div class="col-md-5 text-md-end">
				           		
				          			
				          </div>
					</div>
				</div>
				
			
			</div>
		</div>
		
	</div>

      <div class="container">
      <div class="col-lg-8" style="background-color:whitesmoke; padding:40px;">
        	<form method="post" name="od" id="payForm" class="colorlib-form" action="cartOrder.do">
							<div class="col-md-12">
							<div class="form-group">
							<h2>주문정보입력</h2>
							<br>
							</div>
							</div>
							
							<div class="row">
								<div class="col-md-12"></div>

								<div class="col-md-6">
									<div class="form-group">
										<label for="fname">받는분</label> <input type="text" id="fname"
											name="o_name" class="form-control"
											placeholder="이름">
									</div>
								</div>
								 <div class="col-6 mb-3">
									<div class="form-group">
										<label for="lname">전화번호</label> <input type="text" id="lname"
											name="o_phone" class="form-control" placeholder="'-없이'">
									</div>
								</div>

								 <div class="col-12 mb-3">
									<div class="form-group">
										<label for="companyname">이메일</label> <input type="text"
											id="companyname" name="o_email" class="form-control"
											placeholder="이메일">
									</div>
								</div>
							
								 <div class="col-12 mb-3">
									<div class="form-group">
										<label for="fname">주소</label>
										<button class="btn btn-primary" onclick="sample6_execDaumPostcode(); return false;" >우편번호찾기</button>
										
												
									</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group">

											<input type="text" id="o_address1" name="o_address1"
												class="form-control" placeholder="우편번호">

										</div>
									</div>
									
									
									<div class="col-md-6">
									<div class="form-group">
										<input type="text" id="o_address2" name="o_address2"
											class="form-control" placeholder="주소">
											</div>
									</div>
									
									<div class="col-12 mb-3">
									<div class="form-group">
										<input type="text" id="o_address3" name="o_address3"
											class="form-control" placeholder="상세주소">
									</div>
									</div>
								

									<div class="col-12 mb-3">
									<div class="form-group">
										<label for="companyname">배송요청사항</label> <input type="text"
											id="towncity" name="o_require" class="form-control"
											placeholder="요청사항">
									</div>
								</div>
								</div>
						
								
								
								
									<div class="row">
									<div class="col-md-12">
									<div class="form-group">
									<h2>포인트</h2>
									<br>
									</div>
								</div>
								<div class="row">
										<div class="form-group">
											<strong>구매금액:</strong> <span id="price"> ${sum}원&nbsp;</span>
											<strong>사용가능포인트:</strong> <span id="point">${login.mem_point}점</span>
										
										</div>
									
														
													
										<div class="col-md-6">	
										<div class="form-group">
											<strong>포인트 사용:</strong> 
												 <button onclick="addFunc(); return false;">사용</button>&nbsp;
												 <span><strong>실구매금액:<span id="sum">${sum}원</span>
										</strong></span>
											<input type="text"
												id="pointBox" style="text-align: center" value="0" name="pointBox"
												size="5" class="form-control input-number text-center" 
												/>
										
										
												
												</div>
											</div>
	
	
	
	
								
								</div>
								</div>
								<br>
								<!-- 포인트 끝 -->
								
								
								
								
							<div class="row">
								<div class="col-md-12">
					<div class="form-group">
		<h2>결제정보</h2>
		<br>
		<!-- <input type="radio" class="radio"  name="pay_kind" value="cash" onclick="div_show(this.value,'bankDiv')" />무통장입금
		<input type="radio" class="radio"  name="pay_kind" value="card" onclick="div_show(this.value,'bankDiv')" />카카오페이
		 -->
		<input type="radio" class="radio" id="bbb" name="pay_kind" value="cash" onclick="setDisplay()" />무통장입금
		<input type="radio" class="radio"  id="aaa" name="pay_kind" value="card" onclick="setDisplay()" />카카오페이
		
		
		<div id="bankDiv" style="display:none;">
			<div class="form-group">
			입금자명<input type="text" name="pay_name">
			</div>
			<div class="form-group">
			입금은행<select name="pay_bank">
				<option value=""></option>
				<option value="국민은행:101110101010">국민은행:101110101010</option>
				<option value="하나은행:101110101010">하나은행:101110101010</option>
				</select>
			
				</div>
				
		</div>
	
	
		</div>
								</div>
								</div>
								

	<input type="hidden" name="totalPrice" value="${sum}" /> 
	<input type="hidden" name="usePoint" value="0" /> 
	<input type="hidden" name="mem_id" value="${login.mem_id}"/>		
	<input type="hidden" name="mem_grade" value="${login.mem_grade}"/>	
	<input type="hidden" id="mem_name" value="${login.mem_name}"/>		
	<input type="hidden" id="mem_call" value="${login.mem_call}"/>		
	<input type="hidden" id="mem_email" value="${login.mem_email}"/>		
	
	
	<c:forEach var="vo" items="${cartList}" varStatus="status">
	<input type="hidden" name="prod_id" value="${vo.prod_id}" />
	<input type="hidden" name="prod_name" value="${vo.prod_name}" />
	<input type="hidden" name="totalPrice" value="${sum}" /> 
	<input type="hidden" name="prod_price" value="${vo.prod_price}" />
	<input type="hidden" name="o_amount" value="${vo.o_amount}" /> 
	</c:forEach>	
	
	<button class="btn btn-primary" onclick="CheckOrder(); return false;" >주문하기</button>
	<button class="btn btn-primary" onclick="form_reset(); return false;" >다시쓰기</button>
	</form>
	</div>
</div>
</div>
							
										
						



<jsp:include page="../footer.jsp"></jsp:include>



<script>
	//카드결제
    function iamport(){
    	
    	var total_price = document.getElementById("sum").innerHTML;
    	
    	var user_name = document.getElementById("mem_name").value;
    	var user_phone = document.getElementById("mem_call").value;
    	var user_email = document.getElementById("mem_email").value;
    	console.log(user_name);
    	const IMP = window.IMP;
		//가맹점 식별코드
		IMP.init('imp51301357');
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '상품' , //결제창에서 보여질 이름
		    amount :total_price, //실제 결제되는 가격
		    buyer_email : user_email,
		    buyer_name : user_name,
		    buyer_tel : user_phone,
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		  
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
				
			    //성공시 처리
		        $('#payForm').submit();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		         return false;
		    }
		    alert(msg);
		 
		});
	}
    </script>
	</body>
</html>

