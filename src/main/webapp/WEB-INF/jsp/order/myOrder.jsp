<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의주문내역</title>
	 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/cart.css">
 
</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>
	

<div class="hero page-inner overlay" style="background-image: url('images/hero_bg_1.jpg')">
      
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">나의 주문내역</h1>

          </div>
        </div>
      </div>
    </div>

	
	
     <div class="section section-properties">
		<div class="container">
			
			<div class="row">
				<div class="col-md-12">
					<div style="margin:0 auto;">
					<span style="align:center;">최근 6개월이내</span>
					</div>
				<div class="table-wrap" style="padding:40px;">
					
						<table class="table" style="width:50%; margin:0 auto;">
						
						  <thead class="thead-primary" >
						    <tr>
						    	<th>주문날짜</th>
						    	<th colspan="2">주문번호</th>						    
						    	<th>총가격</th>
						      	<th>주문상태</th>
						      	<th>&nbsp;</th>
						    </tr>
						  </thead>
						 	
						 <c:forEach var="vo" items="${vo}" varStatus="status">
						    <tr class="alert" role="alert">						    
						    	<td>
						    		<fmt:formatDate value="${vo.o_date}" pattern="yyyy-MM-dd"/>
						    	</td>
						        <td colspan="2"><a href="orderDetail.do?order_id=${vo.order_id}" class="learn-more">${vo.order_id}</a></td>
						    	<td>
						    		 <fmt:formatNumber pattern="###,###,###원" value="${vo.totalPrice}"/>
						    	 </td>   
				      			 <td>${vo.o_status}</td>
								<td>
									 <c:if test="${vo.o_status !='주문취소' }">
						      		<button type="button" onclick="location.href='orderStatus.do?order_id=${vo.order_id}&o_status=1&mem_id=${login.mem_id }'">주문취소</button>
				        			</c:if>
				        		</td>
				        	</tr>	
				        </c:forEach>
			
						</table>
				</div>
					<div class="container" style="margin:30px;">
				
			          	<div class="row align-items-center py-5">
          	<div class="col-lg-3"></div>
     			 <div class="col-lg-6 text-center">
					<div class="custom-pagination">
						
						<%-- <!-- 페이지 이전 버튼 -->
						<c:choose>
							<c:when test="${pageObject.page<=1}">
								<li><i class="ion-ios-arrow-back"></i></li>
								<!-- 1보다 작으면 a태그걸지않는다. -->
							</c:when>
							<c:otherwise>
								<li><a
									href="productListView.po?page=${pageObject.page-1 }&prod_kind=${param.prod_kind}"><i
										class="ion-ios-arrow-back"></i></a></li>
							</c:otherwise>
						</c:choose> --%>
			
						<!-- 페이지번호 처리 -->
						<c:forEach var="i" begin="${pageObject.startPage }"
							end="${pageObject.endPage }" step="1">
							<c:choose>
								<c:when test="${pageObject.page==i}">
								 <a class="active">${i}</a>
			         
									<!-- a 태그 걸지 않고 active 상태  -->
								</c:when>
								
								<c:otherwise>
									<a href="myOrder.do?page=${i}&mem_id=${login.mem_id}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<%-- <!-- 페이지 다음 버튼 -->


						<c:choose>
							<c:when test="${pageObject.page==pageObject.endPage}">
								<i class="ion-ios-arrow-forward"></i>
								<!-- 현재페이지가 마지막페이지면 a태그걸지않는다. -->
							</c:when>
							<c:otherwise>
								<a href="productListView.po?page=${pageObject.page+1 }&prod_kind=${param.prod_kind}"><i
										class="ion-ios-arrow-forward"></i></a>
							</c:otherwise>
						</c:choose> --%>
				
					</div>
			
			
         
          </div>
        </div>
	</div>
	</div>
	<!--  -->
					</div>
				</div>
				
			
			</div>


	<script src="../resources/js/jquery.min.js"></script>
  <script src="../resourcesjs/popper.js"></script>
  <script src="../resourcesjs/bootstrap.min.js"></script>
  <script src="../resourcesjs/main.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>

