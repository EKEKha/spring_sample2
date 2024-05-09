<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
	 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../resources/css/cart.css">
 
<script>

function removeAll(){
	
	if(confirm(" 장바구니를 비우시겠습니까? ")==true){
		location.href="cartRemoveAll.do"
	}else{
	return false;
	}
}


function checkQtyUp(prod_id, o_amount) {		
	location.href="cartListQtyUp.do?prod_id="+prod_id+"&o_amount="+o_amount;	
} 
 
//장바구니 항목 수량 감소 요청을 할 때 '현재 수량이 1이 아닐 경우만 수량 감소' 요청을 하게 처리하는 함수
function checkQtyDown(prod_id, o_amount){
	if(o_amount != 1){//현재 수량이 1이 아니면 (즉, 1보다 크면, 2이상이면)
		//장바구니 항목 수량 감소 요청을 함. ★이 때, m_id값이 한글이면 인코딩처리하여 한글파라미터로 전송 
		location.href="cartListQtyDown.do?prod_id="+prod_id;
	}
} 
</script>
</head>


<body>
	<jsp:include page="../header.jsp"></jsp:include>
	

<div class="hero page-inner overlay" style="background-image: url('images/hero_bg_1.jpg')">
      
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">장바구니</h1>

          </div>
        </div>
      </div>
    </div>

	
	
     <div class="section section-properties">
		<div class="container">
			
			<div class="row">
				<div class="col-md-12">
					
				<div class="table-wrap" style="padding:40px;">
						<table class="table" style="width:50%; margin:0 auto;">
						  <thead class="thead-primary" >
						    <tr>
						    	<th>&nbsp;</th>
						    	<th>&nbsp;</th>
						    	<th>Product</th>
						      <th>Price</th>
						      <th>Quantity</th>
						      <th>&nbsp;</th>
						      <th>total</th>
						      <th>&nbsp;</th>
						    </tr>
						  </thead>
						 	 
						 <c:forEach var="cart" items="${cartList}" varStatus="status">
						    <tr class="alert" role="alert">
						     
						    	<td>
						    		<label class="checkbox-wrap checkbox-primary">
										  <input type="checkbox" checked>
										  <span class="checkmark"></span>
										</label>
						    	</td>
						    	<td>
						    		<a href="prodcutDetail.do?prod_id=${cart.prod_id }">
						    		<div class="img" style="background-image: url(upload/product/s_${cart.prod_image});"></div>
						    		</a>
						    	</td>
						      <td>
						      	
						      		<span>${cart.prod_name}</span>
						      		
						      
						      </td>
						      <td><fmt:formatNumber pattern="###,###,###원" value="${cart.prod_price}"/></td>
						      <td class="quantity">
					        	<div class="input-group">
				             	<input type="text" name="quantity" class="quantity form-control input-number" value="${cart.o_amount}" min="1" max="100">
				        
				          	</div>
				          
				          </td>
				         
				         
				       <td>    
				          <div class="close2">
				           <a href="javascript:checkQtyUp('${cart.prod_id}', ${cart.o_amount})"	>		
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
 								 <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
 								 <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
								</svg>
							</a>
						</div>
						 <div class="close2">
						  <a href="javascript:checkQtyDown('${cart.prod_id}', ${cart.o_amount})">	
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square" viewBox="0 0 16 16">
  							<path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
 							 <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
							</svg>
						</a>
			          </div>
				     </td>
		 
				      <td><fmt:formatNumber pattern="###,###,###원" value="${cart.totalMoney}"/></td>
				
						<td>
						      	<button type="button" onclick="location.href='cartDelete.do?prod_id=${cart.prod_id}'" class="close" data-dismiss="alert" aria-label="Close">
				            	<span aria-hidden="true"><i class="fa fa-close"></i></span>
				          	</button>
				        	</td>
				        		</tr>
				        	</c:forEach>
						   
					
						  </tbody>
						
						</table>
					</div>
					<div class="container" style="margin:30px;">
					  <div class="row mb-5 align-items-center">
							<div class="col-md-6">
			           		<h2 class="font-weight-bold heading text-primary mb-3 mb-md-0">
			         			  Total:<fmt:formatNumber pattern="###,###,###원" value="${total}"/>
			           		</h2>
			          </div>
			          <div class="col-md-5 text-md-end">
			           		
			          			<a onclick="removeAll();" class="learn-more" style="color:#00204a;">장바구니비우기</a>
								<a href="cartOrderform.do?total=${total}" class="learn-more">전체주문</a>
			          </div>
					</div>
				</div>
				
			
			</div>
		</div>
		
	</div>
</div>


	<script src="../resources/js/jquery.min.js"></script>
  <script src="../resourcesjs/popper.js"></script>
  <script src="../resourcesjs/bootstrap.min.js"></script>
  <script src="../resourcesjs/main.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
	</body>
</html>

