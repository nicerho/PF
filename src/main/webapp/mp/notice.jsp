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
        <p>NOTICE</p>
        <ul>
          <li>RAEMIAN 새로운 소식을 확인하세요</li>
        </ul>
      </label>
      <fieldset class="mbship_box">
        <ul>
        <li>번호</li>  
        <li>제목</li>  
        <li>조회수</li>     
        <li>글쓴이</li>  
        <li>등록일</li>      
        </ul>
        <c:forEach items="${notices}" var="notice">
        <ul>
        <li>${notice.getCno()}</li>  
        <li style="text-align: left;">${notice.getCtitle()}</li>  
        <li>${notice.getCclicked()}</li>     
        <li>${notice.getCwriter()}</li>  
        <li>${notice.getCdate()}</li>      
        </ul>  
        </c:forEach>
        <span class="pages">
    <c:choose>
       <c:when test="${currentPage > 1}">
        <a href="./notice?pageNumber=${currentPage - 1}&search=${search}"><</a>
       </c:when>
        <c:otherwise>
            <span><</span>
        </c:otherwise>
    </c:choose>
   <c:forEach begin="1" end="${totalPages}" var="page">
        <c:choose>
            <c:when test="${page == currentPage}">
                <span>${page}</span>
            </c:when>
            <c:otherwise>
                <a href="./notice?pageNumber=${page}&search=${search}">${page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
     <c:choose>
        <c:when test="${currentPage < totalPages}">
            <a href="./notice?pageNumber=${currentPage + 1}&search=${search}">></a>
        </c:when>
        <c:otherwise>
            <span>></span>
        </c:otherwise>
    </c:choose>
        </span>
        <span class="search_css">
        <form id="f" method="get" action="./notice">
        <input type="text" class="search_in" placeholder="검색할 제목을 입력하세요" name="search" value="${search}">
        <input type="submit" value="검색" class="search_btn">
        </form>
        </span>
      </fieldset>
    
<!-- 서브 화면 종료 -->
</div>
  <!-- 카피라이터 시작 -->
	<%@include file="./indexCopy.jsp" %> 
 <!-- 카피라이터 종료 -->
</div>
    </div>
</body>
</html>
