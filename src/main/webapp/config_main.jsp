<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<span id="webhtml">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=${date}">
<link rel="stylesheet" href="./css/admin_css.css?v=${date}">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>관리자 페이지</title>
</head>
<body>
<%@include file="./top.jsp" %>  
<!-- 관리자 리스트 시작 -->
<main class="page_main">
<section class="page_section">
<%@include file="./ConfigSection.jsp" %>  
<!-- 관리자 리스트 끝 -->    
</section>
</main>
<footer>
<%@include file="./footer.jsp" %>  
</footer>
</body>

</html>	
</span>