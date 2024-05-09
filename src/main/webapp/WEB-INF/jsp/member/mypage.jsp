<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/join.css" />
<script>
	setTimeout(function() {
		window.scrollTo(0, 800);
	}, 2);
</script>
<script>


function joinCheck() {
	//아이디와 비밀번호 값 데이터 정규화 공식
	const regIdPass = /^[a-zA-Z0-9]{8,12}$/;

	//이름 정규화 공식
	const regName = /^[가-힣a-zA-Z]{2,}$/;

	//이메일 정규화 공식
	const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	//휴대번호 정규화 공식
	const regCall = /^\d{3}\d{3,4}\d{4}$/;

	//이름 유효성 검사 - 정규화 공식 이용
	if (!document.j.mem_name.value.trim()) {//if(document.f.u_name.value==false){
		alert("이름을 입력하세요.");
		document.j.mem_name.focus();//이름 필드에 커서를 둠
		return false;
	} else if (!regName.test(document.j.mem_name.value.trim())) {//이름에 특수문자가 들어간 경우
		alert("이름이 잘못 입력되었습니다.(영어 대소문자와 한글만 입력가능합니다.)");
		return document.j.mem_name.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	} else
	
	
	//이메일 유효성 검사 - 정규화 공식 이용
	if (!document.j.mem_email.value.trim()) {//if(document.f.u_email.value==false){
		alert("이메일을 입력하세요.");
		document.j.mem_email.focus();//커서를 깜박거림
		return false;
	} else if (!regEmail.test(document.j.mem_email.value.trim())) {
		alert("이메일 형식이 올바르지 않습니다.");
		return document.j.mem_email.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	} else

	//휴대번호 유효성 검사 - 정규화 공식 이용
	if (!document.j.mem_call.value.trim()) {//if(document.f.u_call.value==false){
		alert("휴대폰번호를 입력하세요.");
		document.j.mem_call.focus();//커서를 깜박거림
		return false;
	} else if (!regCall.test(document.j.mem_call.value.trim())) {
		alert("휴대폰번호가 잘못 입력되었습니다. 숫자로만 입력해주세요.");
		return document.j.mem_call.select();//입력한 부분에 블록 설정되어 바로 수정가능한 상태로 만듦
	} else

	if (document.j.mem_postcode.value.trim() == '') {
		alert("우편번호를 입력하세요.");
		document.j.mem_postcode.focus();//커서를 깜박거림
		return false;
	}

	if (document.j.mem_address1.value.trim() == '') {
		alert("주소를 입력하세요.");
		document.j.mem_address1.focus();//커서를 깜박거림
		return false;
	}

	if (document.j.mem_address2.value.trim() == '') {
		alert("상세주소를 입력하세요.");
		document.j.mem_address2.focus();//커서를 깜박거림
		return false;
	}

	

	document.j.submit();
	}


function reCheck(){
	confirm("정말 탈퇴하시겠습니까?");
	}
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
            <h1 class="heading" data-aos="fade-up">Mypage</h1>

      
          </div>
        </div>
      </div>
    </div>
    
    
 
 <!-- 회원가입폼 -->
	<div class="section section-contact m-md-5 px-md-5">
		<div class="wrapper fadeInDown">
		  <div id="formContent">
		    <!-- Tabs Titles -->
		
		    <!-- Icon -->
		    <div class="fadeIn first">
		      <h4>&nbsp;</h4>
		    </div>
		
		    <!-- Login Form -->
		    <form action="updateMember" method="post" name="j">
		     <div class="fadeIn first">
			      <h4>${my.mem_id }님의 정보</h4>
		
					<c:if test="${my.mem_grade==0}">
						<td>VIP</td>
					</c:if>
					<c:if test="${my.mem_grade==1}">
						<td>일반회원</td>
					</c:if>
					<c:if test="${my.mem_grade==2}">
						<td>관리자</td>
					</c:if>
	
					(${my.mem_point }포인트)
		    </div>
		      <div class="title">이름  </div>
		      <input type="text" id="name" class="fadeIn second" name="mem_name" placeholder="이름을 입력해주세요" value="${my.mem_name }">
		      <input type="hidden" name="mem_id"  value="${my.mem_id }">
		    
		    
		
		         
		     
		   
		    <!--   <div class="title">비밀번호</div>
		      <input type="password" id="password" class="fadeIn third" name="mem_pwd" placeholder="변경할 비밀번호를 입력해주세요">
		      -->
		      <div class="title">연락처</div>
		      <input type="text" id="tel" class="fadeIn third" name="mem_call" placeholder="연락처를 입력해주세요" value="${my.mem_call}"> <br>
		 
			  <div class="title">이메일</div>
			  <input type="text" id="email" class="fadeIn third" name="mem_email" placeholder="이메일을 입력해주세요" value="${my.mem_email}"> <br>
			  
			  <!-- 주소 api  -->
			  <div class="title">주소</div>
			    <input type="text" id="sample4_postcode" placeholder="우편번호" name="mem_postcode" value="${my.mem_postcode}" >
				<input type="button" id="sample4_postcode_button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
				<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="mem_address1" value="${my.mem_address1}">
				<!-- <input type="text" id="sample4_jibunAddress" placeholder="지번주소"> -->
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="mem_address2" value="${my.mem_address2}">
				
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//도로명 주소 표기 방식에 대한 법령에 따라 내려오는 데이터를 조합해 올바른 주소를 구성하는 방법
window.onload = function(){
    document.getElementById("sample4_postcode_button").addEventListener("click", function(){ //주소 입력칸 클릭 시
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택 시 입력값 세팅
                document.getElementById("sample4_postcode").value = data.zonecode; //우편번호 넣기
                document.getElementById("sample4_roadAddress").value = data.address; //주소 넣기
                document.querySelector("input[name=mem_address2]").focus(); //상세 주소 포커싱
            }
        }).open();
    });
}

</script>
			   <input type="submit" class="fadeIn fourth" value="수정하기" onclick="joinCheck(); return false;">
		    <div id="formFooter">
		    
		
		      <a class="underlineHover" href="changePwd">비밀번호변경</a>
		      <a class="underlineHover" href="deleteMember?mem_id=${my.mem_id}" onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>

		      
		      </div>
		    </form>
		</div>
		 
 </div>
 </div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>

</html>