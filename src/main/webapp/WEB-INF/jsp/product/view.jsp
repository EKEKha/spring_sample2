<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품보기</title>

<script>


function btnFunc(){
	let o_amount=document.getElementById("o_amount").value;
	let prod_id=document.getElementById("prod_id").value;
	let prod_amount=document.getElementById("prod_amount").value;
	let prod_price=document.getElementById("prod_price").value;
	let totalMoney=o_amount * prod_price
	
	if(confirm("장바구니에 담으시겠습니까?")==true){
		location.href="cartAdd.do?o_amount="+o_amount
						+"&prod_id="+prod_id
						+"&prod_amount="+prod_amount
						+"&prod_name=${vo.prod_name}"
						+"&prod_price=${vo.prod_price}"
						+"&prod_image=${vo.prod_image}"
						+"&totalMoney="+totalMoney; 
						
	}else{
		return false;
	}
}

</script>

<script type="text/javascript">
// 변경된 값을 저장
var  prod_price;
var o_amount;
var prod_amount;

// init 초기값을 지정할 수 있다.
function init () {
prod_price = document.order.prod_price.value;
o_amount = document.order.o_amount.value;
document.order.total_price.value = prod_price;
change();
}


function add () {
o_amount = document.order.o_amount;
total_price= document.order.total_price;
o_amount.value ++ ;
total_price.value = parseInt(o_amount.value) *prod_price+"원";

}


function del () {
o_amount = document.order.o_amount;
total_price = document.order.total_price;


// 에러 처리 : 음수 값

if (o_amount.value > 1) {

  o_amount.value -- ;
  total_price.value = parseInt(o_amount.value) * parseInt(prod_price)+"원";
}

}


function change () {

o_amount = document.order.o_amount;
total_price = document.order.total_price;

if (o_amount.value < 0) {

  o_amount.value = 0;

}

total_price.value = parseInt(o_amount.value) * parseInt(prod_price);

} 



</script>


</head>
<body onload="init();">
<jsp:include page="../header.jsp"></jsp:include>


<div
      class="hero page-inner overlay"
      style="background-image: url('images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">Racket</h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="/">HOME</a></li>
                <li class="breadcrumb-item"><a href="product/list.do?prod_kind=acc">ACC</a></li>
              </ol>
            </nav>
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
              <div class="img-property-slide">
                  <img src="upload/product/s_${vo.prod_image}" alt="Image" class="img-fluid" />
         
              </div>
            </div>
          </div>
 
        <div class="col-lg-4">
            <h2 class="heading text-primary">${vo.prod_name }</h2>
          
            
            
            <p class="text-black-50">
             	${vo.prod_content}
             	${vo.prod_content}            
             	
             	
            </p>

       <div class="d-block agent-box p-5">
      	 <div class="box-feature">
           
           <form action="productOrderform.do" name="order" method="post">
            	 <div class="text">
		              		 <h3 class="mb-0">￦${vo.prod_price}원</h3>
		               <div class="meta mb-3"></div>
				
						<div class="input-group mb-4">
							<input type="button" style="width: 40px; height: 40px;"class="quantity-left-minus btn" value="-" onclick="del();"data-type="minus" data-field="">
							<input type="text" id="o_amount" name="o_amount" value="1" min="1" style="text-align:center; width: 40px; height: 40px;" class="form-control input-number" onchange="change();"> 
							<input type="button" style=" width: 40px; height: 40px;" class="quantity-right-plus btn" value="+" onclick="add();"data-type="plus" data-field="">
						</div>
		
						<div class="input-group mb-4">
							<input class="form-control input-number"  style="text-align:center; width: 50px; height: 40px;" type="text" id="total_price" name="total_price" readonly />
						</div>
		
						<div class="row">
			
							<div class="text-center" >
			
								<input type="button" class="btn btn-primary btn-addtocart" value="장바구니" onclick="btnFunc();" />
								 <input type="submit" name="" class="btn btn-primary btn-addtocart" value="구매하기" />
			
							</div>
						</div>
		
						<input type="hidden" id="prod_id" name="prod_id" value="${vo.prod_id}" /> 
						<input type="hidden" name="prod_name" value="${vo.prod_name}" /> 
						<input type="hidden" id="prod_price" name="prod_price" value="${vo.prod_price}" /> 
						<input type="hidden" id="prod_amount" name="prod_amount" value="${vo.prod_amount}" /> 
						<input type="hidden" name="prod_image" value="${vo.prod_image}" />

					</div>
			</form>
		</div>			
       </div>
            
            
      </div>
     </div>
   
					

   
	</div>
</div>





















<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>