<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"
 isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>상품등록</title>

<script>

function CheckAddProduct(){
	
	
	if(p.prod_name.value==""){
		alert("상품명을 입력해주세요");
		return p.prod_name.focus();
	}
	if(p.prod_price.value==""){
		alert("상품가격을 입력해주세요");
		return p.prod_price.focus();
	}
	if(!(p.prod_kind.value=="racket"||p.prod_kind.value=="acc")){
		alert("상품분류를 선택해주세요");
		return;
	}
	
	if(p.prod_amount.value==""){
		alert("재고 수를 입력해주세요");
		return p.prod_amount.focus();
	}
	
		
	if(p.prod_content.value==""){
		alert("상품설명을 입력해주세요");
		return p.prod_content.focus();
	}
	
	p.submit();

	
}
</script>


<script>

function setDisplay(){
$('#imageChangeDiv').show();
	  
}
</script>
</head>


<body>
	<jsp:include page="../adminHeader.jsp"></jsp:include>
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    	

	 <main id="main" class="main">

<section class="section">
      <div class="row">
        
        
        
        
        
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">상품등록</h5>


              <!-- General Form Elements -->
              <form action="pdUpdate.do" method="post" name="p"  enctype="multipart/form-data" >
                <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">상품명</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="prod_name" value="${vo.prod_name }">
                  </div>
                </div>
                 <div class="row mb-3">
                  <label for="inputText" class="col-sm-2 col-form-label">상품가격</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="prod_price" value="${vo.prod_price }">
                  </div>
                </div>
                
                 <fieldset class="row mb-3">
                  <legend class="col-form-label col-sm-2 pt-0">상품분류</legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="prod_kind" id="gridRadios1" value="racket" ${vo.prod_kind=='racket'?'checked':'' } >
                      <label class="form-check-label" for="gridRadios1">
                  	      라켓
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="prod_kind" id="gridRadios2" value="acc" ${vo.prod_kind=='acc'?'checked':'' }>
                      <label class="form-check-label" for="gridRadios2">
                   	     acc
                      </label>
                    </div>
                    
                  </div>
                </fieldset>
               
                
               
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">재고수량</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="prod_amount" value="${vo.prod_amount }">
                  </div>
                </div>
                <div class="row mb-3">
                  <label for="inputNumber" class="col-sm-2 col-form-label">상품이미지</label>
                  <div class="row mb-3">
                   <img src="upload/product/s_${vo.prod_image}" alt="Image" class="img-fluid" />
                   </div>
                 
                    <div class="row mb-3">
                
                  <div class="col-sm-10">
                    <button  class="btn btn-primary" onclick="setDisplay(); return false;">이미지변경</button>
                     <input class="form-control"   name="deleteName" type="hidden" id="formFile" value="${vo.prod_image}">
                     <input class="form-control"   name="prod_id" type="hidden" id="formFile" value="${vo.prod_id}">
                    </div>
                   <div class="col-sm-10" id="imageChangeDiv" style="display:none;">
                   	
                      <input class="form-control" accept="image/*"  name="imageFile" type="file" id="formFile">
                    		
                  </div>
             
                  
                     
                  </div>
                </div>
               
             
                <div class="row mb-3">
                  <label for="inputPassword" class="col-sm-2 col-form-label">상품설명</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" name="prod_content">${vo.prod_content}</textarea>
                  </div>
                </div>
                <fieldset class="row mb-3">
                  <legend class="col-form-label col-sm-2 pt-0">판매상태</legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="prod_status" id="gridRadios1" value="n" ${vo.prod_status=='n'?'checked':'' }>
                      <label class="form-check-label" for="gridRadios1">
                  	      판매대기
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="prod_status" id="gridRadios2" value="y" ${vo.prod_status=='y'?'checked':'' }>
                      <label class="form-check-label" for="gridRadios2">
                   	     판매중
                      </label>
                    </div>
                    
                  </div>
                </fieldset>
               
                   <fieldset class="row mb-3">
                  <legend class="col-form-label col-sm-2 pt-0">메인진열</legend>
                  <div class="col-sm-10">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="main_nb" id="gridRadios1" value="y" ${vo.main_nb=='y'?'checked':'' } >
                      <label class="form-check-label" for="gridRadios1">
                  	      메인진열
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="main_nb" id="gridRadios2" value="n" ${vo.main_nb=='n'?'checked':'' }>
                      <label class="form-check-label" for="gridRadios2">
                   	     진열안함
                      </label>
                    </div>
                    
                  </div>
                </fieldset>
               

               
               

                <div class="row mb-3">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <button class="btn btn-primary" onclick="CheckAddProduct(); return false;">수정하기</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>

        </div>
</div>
</section>
</main>


</body>
</html>

