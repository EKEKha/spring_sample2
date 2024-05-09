<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품보기</title>




</head>
<body >
<jsp:include page="../header.jsp"></jsp:include>


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
	
	
	
	
    <div class="section">
      <div class="container">
        <div class="row justify-content-between">
         
	<!-- 상품이미지 -->
	 <div class="col-lg-7">
            <div class="img-property-slide-wrap">
              <div class="img-property-slide" style="border:2px; solid;'">
               
					<c:if test="${vo.rev_fileName!=null}">
				   <img src="upload/review/s_${vo.rev_fileName }" alt="Image" class="img-fluid" />
					</c:if>
	
					<c:if test="${vo.rev_fileName==null}">
					   <img src="../resources/images/noImage.png" alt="Image" class="img-fluid" />
					</c:if>
              </div>
            </div>
          </div>
 
        <div class="col-lg-4">
            <h4 class="heading text-primary">
				<a>해당 상품구매 ${pd.prod_name}</a>
			</h4>
          
            
            
            <p class="text-black-50">
             	${vo.rev_content}
             	${vo.rev_content}            
             	
             	
            </p>

      
            
            
      </div>
     </div>
   
						<div class="wrapper">
					<p >작성일:<fmt:formatDate value="${vo.rev_date}" pattern="yyyy-MM-dd"/> 작성자: ${vo.mem_id}</p>
				
					<!--후기상세페이지는 목록을 타고 들어와야하므로... -->
					
					 <a href="reviewList.do?board_no=${vo.board_no}" class="learn-more">목록</a>
					 <a href="reviewList.do?board_no=${vo.board_no}" class="learn-more">상품보기</a>
					
					<!-- 로그인한 사람과 글작성자가 같을시 나오는 버튼  -->
					<c:if test="${(vo.mem_id==sessionScope.login.mem_id) or (sessionScope.login.mem_grade == '2')}"><!-- update같은경우 글작성view를 가져오고 한번더 처리, 삭제는 바로처리 -->
						<a href="reviewUpdateForm.do?board_no=${vo.board_no}&page=${param.page}&perPageNum=${param.perPageNum}&key=${param.key}&word=${param.word}&"  class="learn-more" >수정</a>
						<a href="reviewDelete.do?board_no=${vo.board_no}&rev_fileName=${vo.rev_fileName}" class="learn-more" >삭제</a>
						
						
					</c:if>
					</div>

   
	</div>
</div>





















<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>