<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../../header.jsp"></jsp:include>



<div
      class="hero page-inner overlay"
      style="background-image: url('images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">Racket</h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="/Home">HOME</a></li>
                <li class="breadcrumb-item"><a href="product/list.do?prod_kind=acc">ACC</a></li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>
	
	
	
	 <div class="section">
	 <div class="container">
       
       
            
              	<a href="">상품등록(임시)</a>
            
          
    
	
	
	
	<!-- 상품리스트 시작 -->
    <div class="section section-properties">
      <div class="container">
 
 <!-- 가격순정렬시작 -->
        <div class="row align-items-center py-5">
          <div class="col-lg-3">

			<a href="pricelist.do?line=1&prod_kind=${param.prod_kind}"> 
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sort-numeric-up-alt" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M11.36 7.098c-1.137 0-1.708-.657-1.762-1.278h1.004c.058.223.343.45.773.45.824 0 1.164-.829 1.133-1.856h-.059c-.148.39-.57.742-1.261.742-.91 0-1.72-.613-1.72-1.758 0-1.148.848-1.836 1.973-1.836 1.09 0 2.063.637 2.063 2.688 0 1.867-.723 2.848-2.145 2.848zm.062-2.735c.504 0 .933-.336.933-.972 0-.633-.398-1.008-.94-1.008-.52 0-.927.375-.927 1 0 .64.418.98.934.98z" />
					  <path d="M12.438 8.668V14H11.39V9.684h-.051l-1.211.859v-.969l1.262-.906h1.046zM4.5 13.5a.5.5 0 0 1-1 0V3.707L2.354 4.854a.5.5 0 1 1-.708-.708l2-1.999.007-.007a.498.498 0 0 1 .7.006l2 2a.5.5 0 1 1-.707.708L4.5 3.707V13.5z" />
				</svg> 낮은가격순&nbsp;
			</a> 

			<a href="pricelist.do?line=0&prod_kind=${param.prod_kind}">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-sort-numeric-down-alt" viewBox="0 0 16 16">
 				 <path fill-rule="evenodd" d="M11.36 7.098c-1.137 0-1.708-.657-1.762-1.278h1.004c.058.223.343.45.773.45.824 0 1.164-.829 1.133-1.856h-.059c-.148.39-.57.742-1.261.742-.91 0-1.72-.613-1.72-1.758 0-1.148.848-1.836 1.973-1.836 1.09 0 2.063.637 2.063 2.688 0 1.867-.723 2.848-2.145 2.848zm.062-2.735c.504 0 .933-.336.933-.972 0-.633-.398-1.008-.94-1.008-.52 0-.927.375-.927 1 0 .64.418.98.934.98z"/>
 				<path d="M12.438 8.668V14H11.39V9.684h-.051l-1.211.859v-.969l1.262-.906h1.046zM4.5 2.5a.5.5 0 0 0-1 0v9.793l-1.146-1.147a.5.5 0 0 0-.708.708l2 1.999.007.007a.497.497 0 0 0 .7-.006l2-2a.5.5 0 0 0-.707-.708L4.5 12.293V2.5z"/>
				</svg> 높은가격순
			</a>

			</div>
	   </div>
 <!-- 가격순정렬끝 -->     
      
      
      
      
      
       
       
       
       
       
        <div class="row">
	
				
	<!-- 아이템시작 -->
	<c:forEach var="vo"  items="${list}" >
 	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <div class="property-item mb-30">
              <a href="prodcutDetail.do?prod_id=${vo.prod_id }" class="img">
                <img src="upload/product/s_${vo.prod_image}" alt="Image" class="img-fluid" />
              </a>

              <div class="property-content">
                <div class="price mb-2">
                <span><fmt:formatNumber pattern="￦###,###,###원" value="${vo.prod_price}" /></span>
                </div>
               <div>
                  <span class="d-block mb-2 text-black-50"
                    ></span
                  >
                  <span class="city d-block mb-3">${vo.prod_name}</span>

                  <div class="specs d-flex mb-4">
                    <span class="d-block d-flex align-items-center me-3">
                      
                      <span class="caption">장바구니</span>
                    </span>
                    <span class="d-block d-flex align-items-center">
                     
                      <span class="caption">${vo.prod_name}</span>
                    </span>
                  </div>

                  <a
                    href="prodcutDetail.do?prod_id=${vo.prod_id }"
                    class="btn btn-primary py-2 px-3"
                    >See details</a
                  >
                </div>
              </div>
            </div>
            <!-- .item -->
      
          </div>
     </c:forEach>	







	<!--  -->
		</div>
		
	<!-- 페이지 -->	
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
									<a href="product/list.do?page=${i}&prod_kind=${param.prod_kind}">${i}</a>
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





















<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>