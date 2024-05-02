<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-04-29
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>안녕하세요 환영합니다.</title>

    <script>
        function fnSave(){
            document.bbsForm.submit();
        }
    </script>
</head>
<body>

    <h2>게시판 글 작성</h2>
    <form id="bbsForm" name="bbsForm" method="post" action="boardWrite.do">
        <label>제목</label>
        <input type="text" name="NTT_SJ">

        <label>내용</label>
        <textarea name="NTT_CN"></textarea>
        <button type="button" onclick="fnSave();">등록</button>

    </form>

</body>
</html>
