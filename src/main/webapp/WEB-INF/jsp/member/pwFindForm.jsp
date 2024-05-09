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
		    <!-- Tabs Titles -->
		
		    <!-- Icon -->
		    <div class="fadeIn first">
		      <h4>비밀번호 찾기</h4>
		    </div>
		
		    <!-- idFind Form -->
		    <form action="memberpwFInd" method="post">
		    <input type="text" name="mem_id" placeholder="아이디">
			 <input type="text" id="email" class="fadeIn second" name="mem_email" placeholder="이메일 ex)aaa@naver.com" required="required">
		      <input type="submit" class="fadeIn second" value="비밀번호찾기">
		    
		    </form>
		
		    <!-- Remind Passowrd -->
	        <div id="formFooter">
	           <a class="underlineHover" href="memberPwFindForm">아이디 찾기</a>
	           <a class="underlineHover" href="login">로그인</a>
	           <a class="underlineHover" href="joinForm">회원가입</a>
	        </div>
		
		  </div>
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>

</html>