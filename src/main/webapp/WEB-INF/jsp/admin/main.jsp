<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
<jsp:include page="../adminHeader.jsp"></jsp:include>
 <main id="main" class="main">

    <div class="pagetitle">
      <h1>주문</h1>
      <nav>
      
      </nav>
    </div><!-- End Page Title -->
   
    <section class="section dashboard">
      <div class="row">
       
       
       
       <!-- 신규주문건수 -->
       <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">


                <div class="card-body">
                  <h5 class="card-title">주문 <span>| Today</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>${pageObject.totalRow}건</h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div>



		<!-- 이달매출 -->
		<div class="col-xxl-4 col-md-6">
              <div class="card info-card revenue-card">

               
                <div class="card-body">
                  <h5 class="card-title">매출 <span>| Today</span></h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-dollar"></i>
                    </div>
                    <div class="ps-3">
                      <h6><fmt:formatNumber pattern="###,###,###원" value="${total}"/></h6>
                     

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->


    <div class="pagetitle">
      <h1>신규주문</h1>
      <nav>
      
      </nav>
    </div>
   
   <div class="card" >
   <div class="card-body">
           
              <h5 class="card-title">&nbsp;</h5>
           
            </div>
   <table class="table table-bordered" style="width:80%">
                <thead>
                  <tr>
                    <th scope="col">주문번호</th>
                    <th scope="col">회원아이디</th>
                    <th scope="col">총주문금액</th>
                    <th scope="col">포인트사용</th>
                    <th scope="col">주문날짜</th>
                    <th scope="col">주문상태</th>
     
               
                  
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="vo" items="${list }">
                  <tr>
                    <th scope="row">
					<a href="">
					${vo.order_id}
                    </a>
                    </th>
                    <td>${vo.mem_id}</td>
                    <td>${vo.totalPrice}</td>
                    <td>${vo.usePoint}</td>
                     <td><fmt:formatDate value="${vo.o_date}" pattern="yyyy-MM-dd"/> </td>
                    <td>${vo.o_status}</td>
                 
                  
                    
                   
                    
                  </tr>
                 </c:forEach> 
                </tbody>
              </table>
   </div>
   

<div class="col-lg-6">

         
    
           <nav aria-label="...">
                <ul class="pagination">
                  
                  

                <c:choose>
					<c:when test="${pageObject.page<=1}">
						<li class="page-item disabled">
                  			  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Prev</a>
                		</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
                   			 <a class="page-link" href="adminProductList.do?page=${pageObject.page-1 }">Prev</a>
                 		</li>
					</c:otherwise>
				</c:choose> 
                  
                  
                  
                  	<!-- 페이지번호 처리 -->
					<c:forEach var="i" begin="${pageObject.startPage }" end="${pageObject.endPage }" step="1">
						<c:choose>
							<c:when test="${pageObject.page==i}">
								<li class="page-item active" aria-current="page">
                  					 <a class="page-link" >${i}</a>
                  				</li>			
							</c:when>
							<c:otherwise>
								 <li class="page-item">
								 	<a class="page-link" href="adminProductList.do?page=${i}">${i}</a>
								 </li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						
                

     
                  <c:choose>
					 <c:when test="${pageObject.page==pageObject.endPage}">
							<li class="page-item disabled">
                			    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a>
                			</li>
					</c:when>
					<c:otherwise>						
              			    <li class="page-item">
                   				 <a class="page-link" href="adminProductList.do?page=${pageObject.page+1 }">PNextrev</a>
              			   </li>			
					</c:otherwise>   
				</c:choose> 
                  


                
                </ul>
              </nav>


        </div>
   </div>
   
   
   
   


</section>
</main>

</body>
</html>