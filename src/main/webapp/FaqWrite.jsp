<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=">
<link rel="stylesheet" href="./css/admin_css.css?v=">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<%@include file="./top.jsp" %>
<main class="page_main">
<section class="page_section">
<div class="listbody">
    <div class="protitle">FAQ 등록</div>
    <div class="procho">
    <form id="faq" action="./faqWrite" method="post">
       <section class="data_listsview">
       <ol>
       <li>질문 제목</li>
       <li><input type="text" class="notice_in in1" name="fquestion"></li>
       <li>글쓴이</li>
       <li><input type="text" name="fwriter" class="notice_in in2" value="${loginAdmin.getAname()}" readonly></li> <li style="height:520px;">질문 내용</li>
       <li style="height:520px; padding-top: 10px;">
       <textarea id="texts" name="fanswer" class="notice_in in3"></textarea>
       </li>      
       </ol>
       <span class="notice_btns">
       <input type="button" id="btn" value="FAQ 등록" class="meno_btn2"></span>
       </section>
       </form>
    </div>
</div> 
</section>
</main>
<script src="./ckeditor/ckeditor.js?v=1"></script>
<script>
document.querySelector("#btn").addEventListener("click",function(){
	faq.submit();
})
let texts = document.querySelector("#texts")
CKEDITOR.replace("texts")
CKEDITOR.config.resize_enabled = false;
</script>
<!-- FAQ 등록 끝 -->
<footer>
<%@include file="./footer.jsp" %>    
</footer>
</body>
</html>