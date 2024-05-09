<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
</head>
<body>
<jsp:include page="../adminHeader.jsp"></jsp:include>
 <main id="main" class="main">

    <div class="pagetitle">
      <h1>상품목록</h1>
      <nav>
      
      </nav>
    </div><!-- End Page Title -->
    <section class="section">
      <div class="row">
       

       
 <table class="table table-bordered" style="width:900px;">
                <thead>
                  <tr>
                    <th scope="col">상품번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">상품종류</th>
                    <th scope="col">상품가격</th>
                    <th scope="col">재고수량</th>
                    <th scope="col">판매상태</th>
                    <th scope="col">메인진열</th>
                    <th scope="col">등록일</th>
                    <th scope="col">&nbsp;</th>
                  </tr>
                </thead>
                <tbody>
                
                <c:forEach var="vo" items="${list }">
                  <tr>
                    <th scope="row">${vo.prod_id}</th>
                    <td>${vo.prod_name}</td>
                    <td>${vo.prod_kind}</td>
                    <td>${vo.prod_price}</td>
                    <td>${vo.prod_amount}</td>
                 	  
                 	  <c:if test="${vo.prod_status eq 'y'}">
						<td>판매중</td>
						</c:if>
						<c:if test="${vo.prod_status eq 'n'}">
						<td>판매대기</td>
						</c:if>
                   	 	
                   	 	<c:if test="${vo.main_nb eq 'y'}">
							<td>메인진열</td>
						</c:if>
						<c:if test="${vo.main_nb eq 'n'}">
							<td>&nbsp;</td>
						</c:if>
                    
                    <td><fmt:formatDate value="${vo.prod_date}" pattern="yyyy-MM-dd"/> </td>
                    
                    <td>
                    
                   <button type="button" class="btn btn-primary" onclick="location.href='pdUpdate.do?prod_id=${vo.prod_id}'">수정</button>
                   <button type="button" class="btn btn-primary" onclick="location.href='pdDelete.do?prod_id=${vo.prod_id}&deleteName=${vo.prod_image}'">삭제</button>
                    </td>
                    
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