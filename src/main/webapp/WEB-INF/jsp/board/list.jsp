<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <ntt_sj>QNA</ntt_sj>

  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">




  <style type="text/css">
    .dataRow:hover{
      background:#eee;
      cursor:pointer;
    }

  </style>
  <script type="text/javascript">
    $(function(){
      $(".dataRow").click(function(){
        var ntt_id=$(this).find(".ntt_id").text();
        location= "qnaView.do?ntt_id="+ntt_id+"&inc=1"
                +"&page=${pageObject.page}"
                +"&perPageNum=${pageObject.perPageNum}"
                +"&key=${pageObject.key}"
                +"&word=${pageObject.word}"
      });


    });
  </script>



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

      <a href="/board/write.do?perPageNum=${pageObject.perPageNum }" class="learn-more">글쓰기</a>

    </div>


    <div class="row">

      <table class="table" >
        <tr >
          <th>번호</th>
          <th style="width:50%;">제목</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>조회수</th>
        </tr>

        <c:forEach items="${list}"  var="vo">

          <tr class="dataRow">
            <td class="ntt_id">${vo.ntt_id}</td>
            <td style="width:50%; ">


<%--              <c:if test="${vo.cnt>0 }">--%>
<%--                <span class="badge">${vo.cnt }</span>--%>
<%--              </c:if>--%>
<%--              <c:choose>--%>
<%--                <c:when test="${vo.levNo!=0}">--%>
<%--                  <c:forEach var="select" begin="0" end="${vo.levNo*2}">&nbsp;</c:forEach> &lt;%&ndash;답글 깊이만큼 답글 : 표시 &ndash;%&gt;--%>
<%--                  ▶RE: </c:when>--%>
<%--                <c:otherwise></c:otherwise> &lt;%&ndash;그게아니면  ▶ &ndash;%&gt;--%>
<%--              </c:choose>--%>
              <a href="qnaList.do?ntt_id=${vo.ntt_id}&page=${pageObject.page}">
                  ${vo.ntt_sj}<%--내용을 클릭하면 boardDetail.bo?로 board_num과 nowPage get방식으로 전달 --%>
              </a>


            </td>
            <td></td>
            <td><fmt:formatDate value="${vo.crt_dt }" pattern="yyyy-MM-dd"/></td>
            <td></td>
          </tr>

        </c:forEach>

      </table>
    </div>


    <div class="row align-items-center py-5">
      <div class="col-lg-3"></div>
      <div class="col-lg-6 text-center">
        <div  style="padding:20px;">

          <!-- 페이지 이전 버튼 -->
          <c:choose>
            <c:when test="${pageObject.page<=1}">
              [이전]
              <!-- 1보다 작으면 a태그걸지않는다. -->
            </c:when>
            <c:otherwise>
              <a
                      href="qnaList.do?page=${pageObject.page-1 }">
                [이전]</a>
            </c:otherwise>
          </c:choose>

          <!-- 페이지번호 처리 -->
          <c:forEach var="i" begin="${pageObject.startPage }"
                     end="${pageObject.endPage }" step="1">
            <c:choose>
              <c:when test="${pageObject.page==i}">
                [${i}]
                <!-- a 태그 걸지 않고 active 상태  -->
              </c:when>

              <c:otherwise>
                <a href="qnaList.do?page=${i}">${i}</a>
              </c:otherwise>
            </c:choose>
          </c:forEach>

          <!-- 페이지 다음 버튼 -->


          <c:choose>
            <c:when test="${pageObject.page==pageObject.endPage}">
              [다음]
              <!-- 현재페이지가 마지막페이지면 a태그걸지않는다. -->
            </c:when>
            <c:otherwise>
              <a href="qnaList.do?page=${pageObject.page+1 }">
                [다음]
              </a>
            </c:otherwise>
          </c:choose>

        </div>



      </div>
    </div>













  </div>
</div>
<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>