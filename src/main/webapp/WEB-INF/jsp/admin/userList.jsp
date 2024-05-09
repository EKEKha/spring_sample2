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
      <h1>회원목록</h1>
      <nav>
      
      </nav>
    </div><!-- End Page Title -->
    <section class="section">
      <div class="row">
       

       
 <table class="table table-bordered" >
                <thead>
                  <tr>
                    <th scope="col">아이디</th>
                    <th scope="col">이름</th>
                    <th scope="col">등급</th>
                    <th scope="col">휴대전화</th>
                    <th scope="col">주소</th>
                    <th scope="col">이메일</th>
                    <th scope="col">포인트</th>
                   
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="vo">
                  <tr>
                    <th scope="row">${vo.mem_id }</th>
                    <td>${vo.mem_name }</td>
                    
                    
                    <c:if test="${vo.mem_grade==0}">
						<td>VIP</td>
					</c:if>
					<c:if test="${vo.mem_grade==1}">
						<td>일반회원</td>
					</c:if>
					<c:if test="${vo.mem_grade==2}">
						<td>관리자</td>
					</c:if>
                  
                    <td>${vo.mem_call }</td>
                    <td>${vo.mem_address1}${mem_address2}</td>
                    <td>${vo.mem_email }</td>
                    <td>${vo.mem_point }</td>
                   
                    
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


</section>
</main>

</body>
</html>