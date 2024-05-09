<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰게시판</title>
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
            <h1 class="heading" data-aos="fade-up">Review</h1>
            
          </div>
        </div>
      </div>
    </div>
	
	
	
	    <div class="section section bg-light">
	 <div class="container">
       
       
            
	
	<!-- 상품리스트 시작 -->
    <div class="section section-properties">
<%--      <div class="container">--%>
<%-- --%>
<%--      --%>
<%--      	<div style="margin-bottom:20px;">--%>
<%--      --%>
<%--            	<a href="reviewWriteForm.do?mem_id=${login.mem_id}" class="learn-more">글쓰기</a>--%>
<%--      --%>
<%--       </div>--%>
<%--       --%>
<%--       --%>
<%--       --%>
<%--       --%>
<%--        <div class="row">--%>
<%--	--%>
<%--				--%>
<%--	<!-- 아이템시작 -->--%>
<%--	<c:forEach var="vo"  items="${list}" >--%>
<%-- 	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">--%>
<%--            <div class="property-item mb-30">--%>
<%--            --%>
<%--	              <a href="reviewDetail.do?board_no=${vo.board_no }&prod_id=${vo.prod_id}" class="img">--%>
<%--	              --%>
<%--	              --%>
<%--					<c:if test="${vo.rev_fileName!=null}">--%>
<%--				   <img src="upload/review/s_${vo.rev_fileName }" alt="Image" class="img-fluid" />--%>
<%--					</c:if>--%>
<%--	--%>
<%--					<c:if test="${vo.rev_fileName==null}">--%>
<%--					   <img src="../resources/images/noImage.png" alt="Image" class="img-fluid" />--%>
<%--					</c:if>--%>
<%--					--%>
<%--	--%>
<%--	              </a>--%>
<%--              --%>
<%--          `--%>

<%--              <div class="property-content">--%>
<%--               --%>
<%--               <div>--%>
<%--                 --%>
<%--                  <span class="city d-block mb-3">${vo.rev_content}</span>--%>

<%--                  <div class="specs d-flex mb-4">--%>
<%--                    <span class="d-block d-flex align-items-center me-3">--%>
<%--                      --%>
<%--                      <span class="caption"><fmt:formatDate value="${vo.rev_date}" pattern="yyyy-MM-dd"/></span>--%>
<%--                    </span>--%>
<%--                    <span class="d-block d-flex align-items-center">--%>
<%--                     --%>
<%--                      <span class="caption">${vo.mem_id}</span>--%>
<%--                    </span>--%>
<%--                  </div>--%>
<%-- 				--%>
<%-- 				<div class="rate">--%>
<%--					<c:if test="${vo.rev_score == 5}">--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--					</c:if>--%>
<%--					<c:if test="${vo.rev_score == 4}">--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--					</c:if>--%>
<%--					<c:if test="${vo.rev_score == 3}">--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--	--%>
<%--					</c:if>--%>
<%--					<c:if test="${vo.rev_score == 2}">--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--						--%>
<%--					</c:if>--%>
<%--						<c:if test="${vo.rev_score == 1}">--%>
<%--						<span class="icon-star text-warning"></span>--%>
<%--					</c:if>--%>
<%--                </div>--%>
<%--                --%>
<%--                <div style="margin-top:10px;">--%>
<%--                	  <a--%>
<%--                    href="reviewDetail.do?board_no=${vo.board_no}&prod_id=${vo.prod_id}"--%>
<%--                    class="learn-more"--%>
<%--                    >후기 상세보기</a>--%>
<%--               	 </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--            <!-- .item -->--%>
<%--      --%>
<%--          </div>--%>
<%--     </c:forEach>	--%>







<%--	<!--  -->--%>
<%--		</div>--%>
<%--		--%>
<%--	<!-- 페이지 -->	--%>
<%--		<div class="row align-items-center py-5">--%>
<%--          	<div class="col-lg-3"></div>--%>
<%--     			 <div class="col-lg-6 text-center">--%>
<%--					<div class="custom-pagination">--%>
<%--						--%>
<%--						&lt;%&ndash; <!-- 페이지 이전 버튼 -->--%>
<%--						<c:choose>--%>
<%--							<c:when test="${pageObject.page<=1}">--%>
<%--								<li><i class="ion-ios-arrow-back"></i></li>--%>
<%--								<!-- 1보다 작으면 a태그걸지않는다. -->--%>
<%--							</c:when>--%>
<%--							<c:otherwise>--%>
<%--								<li><a--%>
<%--									href="productListView.po?page=${pageObject.page-1 }&prod_kind=${param.prod_kind}"><i--%>
<%--										class="ion-ios-arrow-back"></i></a></li>--%>
<%--							</c:otherwise>--%>
<%--						</c:choose> &ndash;%&gt;--%>
<%--			--%>
<%--						<!-- 페이지번호 처리 -->--%>
<%--						<c:forEach var="i" begin="${pageObject.startPage }"--%>
<%--							end="${pageObject.endPage }" step="1">--%>
<%--							<c:choose>--%>
<%--								<c:when test="${pageObject.page==i}">--%>
<%--								 <a class="active">${i}</a>--%>
<%--			         --%>
<%--									<!-- a 태그 걸지 않고 active 상태  -->--%>
<%--								</c:when>--%>
<%--								--%>
<%--								<c:otherwise>--%>
<%--									<a href="reviewList.do?page=${i}">${i}</a>--%>
<%--								</c:otherwise>--%>
<%--							</c:choose>--%>
<%--						</c:forEach>--%>
<%--						--%>
<%--						&lt;%&ndash; <!-- 페이지 다음 버튼 -->--%>


<%--						<c:choose>--%>
<%--							<c:when test="${pageObject.page==pageObject.endPage}">--%>
<%--								<i class="ion-ios-arrow-forward"></i>--%>
<%--								<!-- 현재페이지가 마지막페이지면 a태그걸지않는다. -->--%>
<%--							</c:when>--%>
<%--							<c:otherwise>--%>
<%--								<a href="productListView.po?page=${pageObject.page+1 }&prod_kind=${param.prod_kind}"><i--%>
<%--										class="ion-ios-arrow-forward"></i></a>--%>
<%--							</c:otherwise>--%>
<%--						</c:choose> &ndash;%&gt;--%>
<%--				--%>
<%--					</div>--%>
<%--			--%>
<%--			--%>
<%--         --%>
<%--          </div>--%>
<%--        </div>--%>
<%--	</div>--%>
	</div>
	<!--  -->
</div>
</div>





















<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>