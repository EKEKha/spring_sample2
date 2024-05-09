<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/miniForm.css" />
<script>
	setTimeout(function() {
		window.scrollTo(0, 800);
	}, 2);
</script>

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
            <h1 class="heading" data-aos="fade-up">아이디찾기</h1>

          </div>
        </div>
      </div>
    </div>
    
    
 
	
	<div class="section section-contact m-md-5 px-md-5">
		<div class="wrapper fadeInDown">
		  <div id="formContent">
		
		    <div class="fadeIn first">
		      <h4>고객님의 아이디는 </h4>
		    </div>
		
		    <form>
				<h5>${find.mem_id}입니다.</h5>
		    </form>
		
		    <div id="formFooter">
		      <a class="underlineHover" href="login">로그인</a>
		      <a class="underlineHover" href="memberPwFindForm">비밀번호 찾기</a>
		    </div>
		
		  </div>
		</div>
	</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>

</html>