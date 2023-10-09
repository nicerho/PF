<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=1">
<link rel="stylesheet" href="./css/admin_css.css?v=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="./css/notice.css?v=1">
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<%@include file="./top.jsp" %>
<!-- 공지사항 등록 시작 -->
<main class="page_main">
<section class="page_section">
<div class="listbody">
    <div class="protitle">공지사항 등록</div>
    <div class="procho">
       <section class="data_listsview">
       <ol>
       <li>공지제목</li>
       <li><input type="text" class="notice_in in1" name="ctitle" readonly value="${notice.getCtitle()}"></li>
       <li>글쓴이</li>
       <li><input type="text" class="notice_in in2" readonly name="cwriter" value="${notice.getCwriter()}"></li> <li style="height:520px;">내용</li>
       <li style="height:520px; padding-top: 10px;">
       <textarea class="notice_in in3" name="csection"  >${notice.getCsection()}</textarea>
       </li>        
       </ol>
       <span class="notice_btns">
       <input type="button" id="btn" value="목록으로" class="meno_btn2" onclick="location.href='../noticeConfig'"></span>
       </section>
    </div>
</div> 
</section>
</main>
<footer>
<%@include file="./footer.jsp" %> 
</footer>
</body>
</html>