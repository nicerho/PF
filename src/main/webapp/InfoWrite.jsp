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
<!-- 세대정보 입력 시작 -->
<main class="page_main">
<section class="page_section">
<div class="listbody">
    <div class="protitle">환경설정 등록</div>
    <div class="procho">
    <form id="info" method="post" action="./infoWrite">
       <section class="data_listsview">
       <ol>
       <li>주거타입</li>
       <li><input type="text" class="notice_in in2" name="itype"> ※ 예) 74A 타입</li>
       <li>글쓴이</li>
       <li><input type="text" class="notice_in in2" name="iwriter" readonly value="${loginAdmin.getAname()}"></li> <li>주거전용</li>
       <li><input type="text" class="notice_in in2" name="ip1">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>주거공용</li>
       <li><input type="text" class="notice_in in2" name="ip2">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>기타공용</li>
       <li><input type="text" class="notice_in in2" name="ip3">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>계약면적</li>
       <li><input type="text" class="notice_in in2" name="ip4">㎡&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요</li>
       <li>이미지 URL</li>
       <li><input type="text" class="notice_in in1" name="iimagedir">&nbsp;&nbsp;&nbsp;예시) http://abc.co.kr/123.jpg</li> 
       <li>사용 유/무</li>
       <li><input type="radio" class="radio_txt" checked name="iuse" value="O">사용함 <input type="radio" class="radio_txt" name="iuse" value="X">사용안함</li>
       <li>출력순서</li>
       <li><input type="text" class="notice_in in2" name="iorder">&nbsp;&nbsp;&nbsp;※ 숫자만 입력하세요 단, 동일한 이름일 경우 데이터 등록된 순으로 출력 됩니다.</li>
       </ol>
       <span class="notice_btns">
       <input type="button" id="btn" value="주거타입 등록" class="meno_btn2"></span>
       </section>
       </form>
    </div>
</div> 
</section>
</main>
<!-- 세대정보 입력 끝 -->
<footer>
<%@include file="./footer.jsp" %>     
</footer>
</body>
<script>
document.querySelector("#btn").addEventListener("click", function() {
	info.submit();
})
</script>
</html>