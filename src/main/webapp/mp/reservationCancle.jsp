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
    
<link rel="stylesheet" type="text/css" href="./css/top.css?v=2">
    
<!-- 추가된 css -->
<link rel="stylesheet" type="text/css" href="./css/new_member.css?v=26">
<!-- 추가된 css -->
</head>

<body>
<!-- wrap -->
<div id="wrap">
<%@include file="./indexTop.jsp" %>  

<div id="container">
<div id="index">
    
<div class="sub_title">
<section class="sub_image">
<span>
최적의 입주환경을 준비하는 입주 전 서비스<br>
두근두근 설레는 마음, 레미안 입주를 앞둔 고객님을 위한 사전방문 예약 입니다.</span>
</section>    
</div>    
    
<!-- 예약취소 화면 시작 -->
    <label class="mbship_title">
        <p>RESERVATION CANCEL</p>
        <ul>
          <li style="color: red;">※ 예약취소시 해당 데이터는 복구 되지 않습니다.</li>
        </ul>
      </label>
    <form id="r" method="post" action="./reserveDelete">
      <fieldset class="mbship_box">
        <h3>예약확인</h3>
        <span class="agree_span">
       
        <input type="hidden" name="rid" value="${reserve.getRid()}">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 아이디</li>
        <li>${reserve.getRid()}</li>
        <li><em class="ck_font">■</em> 고객명</li>
        <li>${reserve.getRname()}</li>
        <li><em class="ck_font">■</em> 예약일자</li>
        <li>${reserve.getRreservedate()}</li>
        <li><em class="ck_font">■</em> 예약시간</li>
        <li>${reserve.getRtime()}</li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        ${reserve.getRtel()}
        </li>
        <li><em class="ck_font">■</em> 인원수</li>
        <li>
        <label class="ck_label">${reserve.getRperson()}명</label>
        </li>
        </ol>
       
        </span>
        <span class="span_buttons">
        <button type="button" id="btn" class="next_btn1_1">예약취소</button>
        </span>
      </fieldset>
    </form>
<!-- 예약취소 화면 종료>
</div>
  <!-- 카피라이터 시작 -->
<%@include file="./indexCopy.jsp" %> 
 <!-- 카피라이터 종료 -->
</div>
    </div>
</body>
<script src="./js/reserveCancel.js">

</script>
</html>
