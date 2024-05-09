<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/miniForm.css" />
<script>

	function check(){
		const regIdPass = /^[a-zA-Z0-9]{8,12}$/;

		if (!document.j.mem_pwd.value.trim()) {//if(document.f.u_password.value==false){
			alert("비밀번호를 입력하세요.");
			document.j.mem_pwd.focus();//커서를 깜박거림
			return false;
		} else if (!regIdPass.test(document.j.mem_pwd.value.trim())) {
			alert("비밀번호는 8~12자의 영어 대소문자와 숫자로만 입력가능합니다.");
			return document.j.mem_pwd.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
		}else
		 document.j.submit();
	}
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
            <h1 class="heading" data-aos="fade-up">비밀번호변경</h1>

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
		      <h4>비밀번호 변경</h4>
		    </div>
		
		    <!-- idFind Form -->
		    <form action="changePwd" name="j" method="post">
		    	<input type="password" name="mem_pwd" placeholder="비밀번호 입력">
		    	<input type="hidden" name="mem_id" value="${sessionScope.mem_id}">
		  	  <input type="submit" class="fadeIn second" value="비밀번호 변경" onclick="check();return false;">
		    
		    </form>
		
		    <!-- Remind Passowrd -->
	      
		  </div>
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>

</html>