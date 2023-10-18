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
    
<!-- 예약확인 화면 시작 -->
    <label class="mbship_title">
        <p>RESERVATION CONFIRM</p>
        <ul>
          <li style="color: red;">※ 예약수정은 1회 변경 가능 합니다.</li>
        </ul>
      </label>
    <form  id="r" method="post" action="./changeReserve">
      <fieldset class="mbship_box">
        <h3>예약확인 <span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;">■ 표시는 필수 입력 항목입니다.</span></h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 아이디</li>
        <li>
        <input type="text" class="mbinput1" name="rid" readonly value="${reserve.getRid()}">
        </li>
        <li><em class="ck_font">■</em> 고객명</li>
        <li>
        <input type="text" class="mbinput2" name="rname" readonly value="${reserve.getRname()}">
        </li>
        <li><em class="ck_font">■</em> 예약일자</li>
        <li>
        <input type="date" class="mbinput1" name="rreservedate" value="${reserve.getRreservedate()}">
        </li>
        <li><em class="ck_font">■</em> 예약시간</li>
        <li>
        <select class="mbinput1" name="rtime" >
        <option>시간선택</option>    
        <option ${reserve.getRtime() =='09:00' ? 'selected' : ''}>09:00</option>        
        <option ${reserve.getRtime() =='10:00' ? 'selected' : ''}>10:00</option>
        <option ${reserve.getRtime() =='11:00' ? 'selected' : ''}>11:00</option>
        <option ${reserve.getRtime() =='14:00' ? 'selected' : ''}>14:00</option>
        <option ${reserve.getRtime() =='15:00' ? 'selected' : ''}>15:00</option>
        <option ${reserve.getRtime() =='16:00' ? 'selected' : ''}>16:00</option>
        <option ${reserve.getRtime() =='17:00' ? 'selected' : ''}>17:00</option>
        </select>
        </li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        <input type="text" class="mbinput2" readonly name="rtel" value="${reserve.getRtel()}">
        </li>
        <li><em class="ck_font">■</em> 인원수</li>
        <li>
        <label class="ck_label">
        <input type="radio" class="ck_label" name="rperson" value="1" ${reserve.getRperson()=='1' ? 'checked' : ''}> 1명
        </label>
        <label class="ck_label">
        <input type="radio" class="ck_label" name="rperson" value="2" ${reserve.getRperson()=='2' ? 'checked' : ''}> 2명
        </label>
        </li>
        </ol>
        </span>
        <span class="span_buttons">
        <c:if test="${reserve.getRchange()=='N'}">
        <button type="button" class="next_btn1_1" onclick="reserve()">예약수정</button>
        </c:if>
        </span>
      </fieldset>
    </form>
<!-- 예약확인 화면 종료>
</div>
  <!-- 카피라이터 시작 -->
	<%@include file="./indexCopy.jsp" %> 
 <!-- 카피라이터 종료 -->
</div>
    </div>
</body>
<script>
function reserve(){
	console.log(r.rreservedate.value)
	if(r.rreservedate.value==""){
		alert("예약일짜를 정확하게 입력해주세요.")
	}else if(r.rtime.value=="시간선택"){
		alert("예약시간을 정확하게 입력해주세요.")
	} else if(r.rperson.value==""){
		alert("예약인원을 정확하게 입력해주세요.")
	} else{
		if(confirm("예약수정은 1회만 변경이 가능합니다 변경하시겠습니까?")){
			r.submit();	
		}
	}
}
</script>
</html>
