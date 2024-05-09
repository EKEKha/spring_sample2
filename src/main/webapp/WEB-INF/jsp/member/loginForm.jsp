<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="Untree.co" />
 
    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap5" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="../resources/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="../resources/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="../resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="../resources/css/aos.css" />
    <link rel="stylesheet" href="../resources/css/style.css" />
 -->
<!-- 로그인폼 -->
	<link rel="stylesheet" href="../css/login.css" />

<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript">
function check(){

	
	//아이디 유효성 검사 - 정규화 공식 이용
	if( document.f.mem_id.value==false ){//if(document.f.id.value==false){
		alert("아이디를 입력하세요.");
		document.f.mem_id.focus();//커서를 깜박거림
		return false;
	}
	if( document.f.mem_pwd.value==false){//if(document.f.pwd.value==false){
		alert("비밀번호를 입력하세요.");
		document.f.mem_pwd.focus();//커서를 깜박거림
		return false;
	}
	document.f.submit();
		}
</script>
</head>
<body>

<body>
  <jsp:include page="../../header.jsp"></jsp:include>
  
   <div
      class="hero page-inner overlay"
      style="background-image: url('images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">로그인</h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
             
            </nav>
          </div>
        </div>
      </div>
    </div>
    
	<div class="myform">
    <div class="logo2">PLEASE LOGIN!
      <div><i class="fa fa-cloud-upload" aria-hidden="true"></i></div>
  </div>
    <form  action="login" method="post" name="f">
        <input class="abc" type="text" name="mem_id" placeholder= "ID" />
        <input class="abc" type="password" name="mem_pwd" placeholder="Password" />
        <button class="abcd" onclick="check(); return false;">LOGIN </button>
        <div> <a href="memberIdFindForm">ID찾기&nbsp;</a>
        	<a href="memberPwFindForm">PWD찾기&nbsp;</a>
        	<a href="joinForm">회원가입</a>
        </div>
        
        
        
    </form>
	</div>
  

<jsp:include page="../../footer.jsp"></jsp:include>

</body>
</html>
