<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <p>MEMBER-SHIP</p>
        <ul>
          <li>01. 약관동의</li>
          <li><img src="./img/step_on.png" /></li>
          <li>02. 정보입력</li>
          <li><img src="./img/step_off.png" /></li>
          <li>03. 가입완료</li>
        </ul>
      </label>
      <fieldset class="mbship_box">
        <h3>약관동의</h3>
        <span class="agree_span">
        <label class="mbship_text">
          <input type="checkbox" id="all_agree" onclick="allagree(this.checked)" /> 의 모든 약관을 확인하고 전체 동의 합니다.
          (전체동의, 선택항목도 포함됩니다.)
        </label>
        <label class="mbship_text">
            <input type="checkbox" id="c1" onclick="clicked()"><font color="red"> (필수)</font>이용약관
        </label>
        <div class="agree_text" id="agree1" ></div>
        <label class="mbship_text">
            <input type="checkbox" id="c2" onclick="clicked()"><font color="red"> (필수)</font> 개인정보 수집 및 이용
        </label>
        <div class="agree_text" id="agree2" ></div>
        </span>
        <button type="button" class="next_btn">다음단계</button>
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
var agree=function(f){
	
	var http = new XMLHttpRequest();

	http.open("GET",f,false); //true면 비동기 false면 동기
	//open(메소드,url,async,user,password)
	http.send();
	return http.response;
	}
document.getElementById("agree1").innerHTML=agree("./agree/agree1.txt");
document.getElementById("agree2").innerHTML=agree("./agree/agree2.txt");

function allagree(e) {
	var w = 1;
	while (w <= 2) {
		document.getElementById("c" + w).checked = e;
		w++
	}
}
function clicked(){
	var all = document.getElementById("all_agree") //전체 선택 오브젝트
	var w = 1;
	var check = true; // 체크유무 핸들링
	do { //해당 아이디별로 체크가 해제되었을 경우
		if (document.getElementById("c" + w).checked == false) {
			check = false;
		}
		w++
	} while (w <= 2)
	if (check == false) { // 하나라도 체크가 안되었을 경우 전체 체크 해제
		all.checked = false;
	} else { //모두 체크 되었을 경우 전체선택 활성화
		all.checked = true
	}
	//total.innerText
}
</script>
</html>
