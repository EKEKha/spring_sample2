<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA</title>

<style>

h4 {
	text-align: center; color:black; margin-top: 10px;}

</style>
</head>
<body>

<jsp:include page="../../header.jsp"></jsp:include>


<div
      class="hero page-inner overlay"
      style="background-image: url('images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">QNA</h1>
            
          </div>
        </div>
      </div>
    </div>
	
 <div class="section">
 	 <div class="container">
       

      	<div style="margin-bottom:30px;">
		<h4>질문</h4>
		</div>
		

	<div style="margin:0 auto; width:70%;">
	

			          
      <form action="/board/save.do" method="post" name="boardform">

        <input type="hidden" id="loginID" name="mem_id" value="${login.mem_id}">
        <input type="hidden" name="perPageNum" value="${param.perPageNum }">
         <table id="table-first" class="table table-bordered" >
         
                
            <tr>
                 <th id="td_left"><label for="ntt_sj">제목</label></th>
                 <td>
             <input name="ntt_sj" type="text"id="ntt_sj" required="required" size="67" class="form-control"/>
                  </td>
            </tr>
         
             <tr>
               <th id="td_left"><label for="ntt_cn">내용</label></th>
               <td><textarea id="ntt_cn" name="ntt_cn"
                cols="80" rows="10" required="required" class="form-control"style="font-size:12px;"></textarea>
                </td>
            </tr>
                
         </table>
       <div style="text-align:center; margin-top:40px;">
            <input type="submit"  style="background-color:#ccc;"class="btn btn-outline-dark" id="b1" value="등록"/>&nbsp;&nbsp;   <!-- 유효성 체크함수로 주소입력버튼을 클릭안하면 등록버튼 누를 수 없게 방지 -->
            <input type="reset" style="background-color:#ccc;" class="btn btn-outline-dark"  id="b1" value="취소" />
         </div>

		

		
	</form>
	</div>
	
	</div>
</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>