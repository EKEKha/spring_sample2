<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>

<link rel="stylesheet" href="../resources/css/join.css" />
</head>
<body>


<c:if test="${vo==null }">
	사용가능한 아이디입니다.
	
</c:if>
<c:if test="${vo!=null }">
	아이디가 존재합니다.다시 입력해주세요
</c:if>


</body>
</html>