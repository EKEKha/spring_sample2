<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상세</title>
<link rel="stylesheet" href="../resources/css/orderDetail.css" />

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


<div
      class="hero page-inner overlay"
      style="background-image: url('images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">주문상세</h1>
            
          </div>
        </div>
      </div>
    </div>



<div class="section" style="margin:0 auto;">
		
		<!-- 주문정보 -->
		<div class="container">
			<div style="margin: 30px;"><h5>주문정보</h5></div>
			<div class="row">
				<table style="width:80%; margin:0 auto;">
					<tr>
						<th>주문번호</th>
						<th>${order.order_id }</th>
					</tr>
					<tr>
						<th>주문일자</th>
						<th><fmt:formatDate value="${order.o_date}" pattern="yyyy-MM-dd"/></th>
					</tr>
					<tr>
						<th>주문자</th>
						<th>${login.mem_name}</th>

					</tr>
					<tr>
						<th>주문처리상태</th>
						<th>${order.o_status}</th>
					</tr>
				</table>
			</div>
		</div>

	
	<!-- 상품정보 -->	

		<div class="container">
			<div style="margin: 30px;"><h5>상품정보</h5></div>
			<div class="row">
				<table style="width: 80%; margin:0 auto;">	
					<tr>
						<th>상품명</th>
						<th>수량</th>				
					</tr>
					<c:forEach var="vo" items="${detail}"  varStatus="status">
					<tr>
						<th>${vo.prod_name}</th>
						<th>${vo.o_amount}ea</tj>
					</tr>
					</c:forEach>
					<tr>
						<th colspan="2">총금액:<fmt:formatNumber pattern="###,###,###원" value="${order.totalPrice}"/></th>
						
					</tr>
				</table>
			</div>
		</div>

	<!-- 배송정보 -->
	<div class="container">
			<div style="margin: 30px;"><h5>배송정보</h5></div>
			<div class="row">
				<table style="width: 80%; margin:0 auto;">
					<tr>
						<th>결제정보</th>
						<th>${order.o_name}</th>
					</tr>
					<tr>
						<th>전화번호</th>
						<th>${order.o_phone}</th>
					</tr>
					<tr>
						<th>배송주소</th>
						<th>${order.o_address1}<br>${order.o_address2}${order.o_address3}</th>

					</tr>
					
				</table>
			</div>
			
		</div>
		
	<!-- 결제정보 -->	
	
	<div class="container">
			<div style="margin: 30px;"><h5>결제정보</h5></div>
			<div class="row">
				<table style="width: 80%; margin:0 auto;">
					<tr>
						<th>결제정보</th>
						<th>
						<c:if test="${pay.pay_kind=='cash'}">
						무통장입금<br>
						입금자명:${pay.pay_name}<br>
						${pay.pay_bank }
						</c:if>
						
						<c:if test="${pay.pay_kind=='pay'}">
						카카오페이
						</c:if>
						</th>
						
						
					</tr>
					<tr>
						<th>최종금액</th>
						<th>${pay.realPrice}</th>
					</tr>
					<tr>
						<th>결제상태</th>
						<th>
						<c:if test="${pay.pay_status==0}">
						입금대기
						</c:if>
						
						<c:if test="${pay.pay_status==1}">
						입금완료
						</c:if>
							<c:if test="${pay.pay_status==2}">
						결제완료
						</c:if>
						
						</th>

					</tr>
					
				</table>
			</div>
	</div>
	
	
	
	
	</div>
		
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>