<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<meta property="og:type" content="website">
<meta property="og:title" content="인천검단 레미안">
<title>인천검단 레미안</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/normalize.css">
<link rel="stylesheet" type="text/css" href="css/slick.css">
<link rel="stylesheet" type="text/css" href="css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/cal-style.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" href="./dadmin/css/sweetalert.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
    
<link rel="stylesheet" type="text/css" href="./css/top.css?v=1">
    
<!-- 추가된 css -->
<link rel="stylesheet" type="text/css" href="./css/new_member.css?v=1">
<!-- 추가된 css -->
</head>

<body>
<!-- wrap -->
<div id="wrap">
<%@include file="./indexTop.jsp" %>

<div id="container">
<div id="index">
    
<!-- 서브 화면 시작 -->
    <label class="mbship_title">
        <p>FAQ</p>
        <ul>
          <li>RAEMIAN 자주묻는 질문</li>
        </ul>
      </label>
      <fieldset class="faq_box" id="faqSpan">
      <c:forEach items="${faqs}" var="f">
        <ul class="node">
        <li>질문</li>       
        <li>${f.getFquestion()}</li>
        </ul>
		<ol style="display: none;">        
        <li>
       ${f.getFanswer()}
        </li>
        </ol>
        </c:forEach>
      </fieldset>
    
<!-- 서브 화면 종료 -->
</div>
  <!-- 카피라이터 시작 -->
<%@include file="./indexCopy.jsp" %> 
 <!-- 카피라이터 종료 -->
</div>
    </div>
</body>
<script>
document.querySelector("#faqSpan").addEventListener("click", function(z) {
	console.log(z.target)
	var n = document.querySelectorAll("#faqSpan > .node ");
	this.node = [].indexOf.call(n, z.srcElement.parentNode); //li 자식노드에서 부모노드를 찾아 확인작업
	this.ea = document.querySelectorAll("#faqSpan > ol ").length; //답변에 대한 갯수
	var w = 0;
	while(w<this.ea){
		document.querySelectorAll("#faqSpan > ol ")[w].style["display"] = "none"; // 해당 모든 답변을 숨김
		w++
	}
	document.querySelectorAll("#faqSpan > ol ")[this.node].style["display"] = "flex";	//클릭된 질문에 대한 답변만 출력
	console.log(this.ea)
})
</script>
</html>
