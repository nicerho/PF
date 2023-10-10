<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_css.css?v=22">
<link rel="stylesheet" href="./css/page_default.css?v=33">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<title>관리자 페이지</title>
</head>
<body>
<%@include file="./top.jsp" %>
<main>
<section>
<%@include file="./AdminSection.jsp" %>
</section>
</main>
<footer>
<%@include file="./footer.jsp" %>
</footer>
<script src="./js/menus.js?v=1"></script>
</body>
</html>