<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"
 isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<!DOCTYPE HTML>
<html>
	<head>
	<title>Tennis shop</title>
   
<style>
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:3px;
    width:75%;
    height:75%;
    margin:3%;
    
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 1.1em;
    color: transparent;
     text-shadow: 0 0 0 #553f3f;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
.button {
    display: flex;
    justify-content: center;
}
label {
    cursor: pointer;
    font-size: 1em;
}

/* 못생긴 기존 input 숨기기 */
#imageFile {
    visibility: hidden;
}
.image-upload {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.button {
    display: flex;
    justify-content: center;
    background-color:#F6F6F6;
    width:70%;
    margin:0 auto;
   
}

label {
    cursor: pointer;
    font-size: 1em;
    
}



.fileContainer {
    display: flex;
    justify-content: center;
    align-items: center;
}

.fileInput {
    display: flex;
    align-items: center;
    border-bottom: solid 2px black;
    width: 60%;
    height: 30px;
}

#fileName {
    margin-left: 5px;
}

.buttonContainer {
    width: 15%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-left: 10px;
    background-color: black;
    color: white;
    border-radius: 30px;
    padding: 10px;
    font-size: 0.8em;

    cursor: pointer;
}

.image-show {
    z-index: -1;
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    width: 100%;
    height: 100%;
}

.img {
    position: absolute;
}

.wrapper{

 display: flex;
  justify-content: center;
  align-items: center;
 
}
</style>

<script type="text/javascript">
var submit = document.getElementById('submitButton');
submit.onclick = showImage;     //Submit 버튼 클릭시 이미지 보여주기

function showImage() {
    var newImage = document.getElementById('image-show').lastElementChild;
    newImage.style.visibility = "visible";
    
    document.getElementById('image-upload').style.visibility = 'hidden';

    document.getElementById('fileName').textContent = null;     //기존 파일 이름 지우기
}


function loadFile(input) {
    var file = input.files[0];

    var name = document.getElementById('fileName');
    name.textContent = file.name;
   document.myform.rev_originName.value=name.innerHTML.trim();

    var newImage = document.createElement("img");
    newImage.setAttribute("class", 'img');

    newImage.src = URL.createObjectURL(file);   

    newImage.style.width = "70%";
    newImage.style.height = "70%";
    newImage.style.visibility = "hidden";   //버튼을 누르기 전까지는 이미지 숨기기
    newImage.style.objectFit = "contain";

    var container = document.getElementById('image-show');
    container.appendChild(newImage);
}
</script>

<script>
function checkReview(){
	if(myform.prod_id.value==""){
		alert("리뷰작성할 구매상품을 선택하세요");
		return;

		}

	if(myform.rev_content.value==""){
		alert("상품평 내용을 입력해 주세요");
		return myform.rev_content.focus();
	}
	
	
	if(
          (myform.rev_score[0].checked == false)&&(myform.rev_score[1].checked == false)
          &&(myform.rev_score[2].checked == false)&&(myform.rev_score[3].checked == false)
          &&(myform.rev_score[4].checked == false)
         ){
           alert("별점을 선택해주세요.");
           return;
       }
	

	
	myform.submit();
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
            <h1 class="heading" data-aos="fade-up">Review</h1>

      
          </div>
        </div>
      </div>
    </div>
	
	
	
	
	
    <div class="section">
      <div class="container">
        <div class="row justify-content-between">
         
	
	
	
	<form class="mb-3" name="myform" id="myform" method="post" action="reviewWrite.do"  enctype="multipart/form-data">	
			
			<div class="colorlib-loader"></div>
				<div id="page">
				
				<div class="colorlib-product">
					<div class="container">
						<div class="row">
						
						
							<div class="col-sm-8 offset-sm-2 text-center colorlib-heading">
								<h2>&nbsp;</h2>
							
						
							     <select name="prod_id" id="prod_id" style="width: 100px; height:30px;" >
							     <option value=""></option>
							     <c:if test="${order!=null}">
           						<c:forEach var="vo" items="${order}" varStatus="status" >
           						<option value="${vo.prod_id }">${vo.prod_name }</option>
           						</c:forEach>
           						
             					    	 
            					 
            					   </c:if>
							
          						  </select> 
          						
							
							<input type="submit" value="등록" onclick="checkReview(); return false;">
							<input type="reset" value="취소" onclick="location.href='rev_boardList.do'">
							<input type="hidden" name="mem_id" value="${sessionScope.login.mem_id }"/>
						
						
						
						
			
					
						
				<div class="wrapper">			
					<fieldset>
					<span class="text-bold">별점을 선택해주세요</span>
					<input type="radio" name="rev_score" value="5" id="rate1"><label
						for="rate1">★</label>
					<input type="radio" name="rev_score" value="4" id="rate2"><label
						for="rate2">★</label>
					<input type="radio" name="rev_score" value="3" id="rate3"><label
						for="rate3">★</label>
					<input type="radio" name="rev_score" value="2" id="rate4"><label
						for="rate4">★</label>
					<input type="radio" name="rev_score" value="1" id="rate5"><label
						for="rate5">★</label>
					</fieldset>
				</div>			
				
							</div>
							
							</div>
							
							
				<div class="button" >
			        <label for="imageFile">
			            👉 CLICK 사진을 함께 등록해주세요! 
			        </label>
			    </div>
		 
			
		      <input type="file" id="imageFile" name="imageFile" accept="image/*" onchange="loadFile(this)">
		      <input type="hidden" id="rev_originName" name="rev_originName" value=""/>
	            <div class="fileContainer">
	                <div class="fileInput">	
	                    <p>FILE NAME: </p>
	                    <p id="fileName"></p>
	                </div>
	               
	            </div>
	       
        
       	
  		 
			
			
			
				<div class="wrapper">
				
				<fieldset>
				<div>
					<textarea class="col-auto form-control" name="rev_content"  id="reviewContents" placeholder="상품평을 입력 해 주세요"
					cols="40" rows="15"></textarea>
				</div>
				</fieldset>
				</div>
			
					</div>
				</div>
								
											
			</div>	
		</form>


		</div>
	</div>
</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>

