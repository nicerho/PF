<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=${date}">
<link rel="stylesheet" href="./css/admin_css.css?v=${date}">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=9999">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<%@include file="./top.jsp" %>  
<!-- 회원관리 시작 -->
<form id="frm"  method="get" action="./adminMember">
<main class="page_main">
<section class="page_section">
<div class="listbody">
    <div class="protitle">회원 관리</div>
    <div class="procho">
       <section class="search_part" >
        <ol >
        <li>회원 검색</li>
        <li>
        <select class="search_select"  name="searchpart" id="search_part" onchange="select2(this.value)">
           <option <c:if test="${selected eq '이름'}">selected</c:if>>이름</option>
           <option <c:if test="${selected eq '아이디'}">selected</c:if>>아이디</option>
           <option <c:if test="${selected eq '연락처'}">selected</c:if>>연락처</option>    
        </select>
        <input type="text" id="sdate2" class="search_input" name="search" value="${search}">
        <input type="button" value="검색" class="datebtn" id="searchPart2">
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="member_listsview">
       <ul>
        <li>번호</li>
        <li>아이디</li>
        <li>고객명</li>
        <li>연락처</li>
        <li>이메일</li>
        <li>주소</li>
        <li>이메일</li>
        <li>전화</li>
        <li>우편물</li>
        <li>SMS</li>
        <li>삭제</li>
       </ul>
       <c:forEach items="${memberList}" var="member">
       <ul>
        <li>${member.getMno()}</li>
        <li>${member.getMid()}</li>
        <li>${member.getMname()}</li>
        <li>${member.getMtel()}</li>
        <li>${member.getMemail()}</li>
        <li style="justify-content: flex-start;">(${member.getMadd1()})${member.getMadd2()}${member.getMadd3()}</li>
        <li>${member.getMmarket1()}</li>   
        <li>${member.getMmarket2()}</li>  
        <li>${member.getMmarket3()}</li>   
        <li>${member.getMmarket4()}</li>   
        <li>
            <input type="button" value="삭제" class="delbtn" onclick="deleteMember(${member.getMno()})">
        </li>
       </ul>
       </c:forEach>
       <c:if test="${memberList==null}">
       <ul class="nodatas">
        <li>등록된 회원이 없습니다.</li>
       </ul>
       </c:if>
       <aside>
        <div class="page_number">
            <c:choose>
       <c:when test="${currentPage > 1}">
        <a href="./adminMember?pageNumber=${currentPage - 1}&search=${search}"><</a>
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
                <a href="./adminMember?pageNumber=${page}&search=${search}">${page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
     <c:choose>
        <c:when test="${currentPage < totalPages}">
            <a href="./adminMember?pageNumber=${currentPage + 1}&search=${search}">></a>
        </c:when>
        <c:otherwise>
            <span>></span>
        </c:otherwise>
    </c:choose>
        </div>
       </aside>
       </section>
    </div>
</div> 
</section>
</main>
<!-- 회원관리 끝 -->
</form>
<footer>
<%@include file="./footer.jsp" %>  
</footer>
</body>
<script src="./js/adminMember.js"></script>
</html>