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
    
<!-- 로그인 화면 시작 -->
    <label class="mbship_title">
        <p>MEMBER-LOGIN</p>
        <ul>
          <li>로그인하시면, 회원 별 다양한 맞춤 서비스를 이용하실 수 있습니다.</li>
        </ul>
      </label>
      <fieldset class="mbship_box">
        <span class="agree_span">
        <ul class="mblogin">
            <li><img src="./img/mainlogin.png"></li>
            <li>
                <span>EXPERIENCE OF PRIDE <br> LOGIN</span>
                <span>
                    <ol class="login_ols">
                        <li><input type="text" class="login_input" id="loginId" name="loginId" placeholder="아이디를 입력하세요"></li>
                        <li><input type="password" class="login_input"  id="loginPw" name="loginPw" placeholder="패스워드를 입력하세요"></li>
                        <li><button type="button" class="login_btn1" id="loginTry">로그인</button></li>
                        <li><button type="button" class="login_btn2" onclick="location.href='./joinMember.jsp'">회원가입</button></li>
                        <li style="cursor: pointer;">아이디 찾기 / 비밀번호 찾기</li>
                    </ol>
                </span>
            </li>
        </ul>
        </span>
      </fieldset>
    
<!-- 로그인 화면 종료 -->
</div>
  <!-- 카피라이터 시작 -->
<%@include file="./indexCopy.jsp" %> 
 <!-- 카피라이터 종료 -->
</div>
    </div>
</body>
<script src="./js/login.js"></script>
</html>
