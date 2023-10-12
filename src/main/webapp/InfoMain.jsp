<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=2">
<link rel="stylesheet" href="./css/admin_css.css?v=3334">
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
    <div class="protitle">환경설정 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>세대정보 검색</li>
        <li>
        <form id="info" method="get" action="./infoPage">
        <input type="text" id="sdate2" class="search_input" value="${search}" name="search">
        <input type="button"id="infoSearchBtn" value="검색" class="datebtn">
        </form>
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="data_listsview">
       <ul>
        <li>번호</li>
        <li>세대타입 및 면적</li>
        <li>사용 유/무</li>
        <li>출력순서</li>
        <li>글쓴이</li>
        <li>등록일</li>
        <li>삭제</li>
       </ul>
       <c:forEach items="${infos}" var="info">
       <ul style="height:140px;">
        <li>${info.getIno()}</li>
        <li style="text-align: left; justify-content: flex-start;">
        <div class="info_img">
        <img src="${info.getIimagedir()}">   
        </div>
        <div class="info_text">
        <span>주거타입 : ${info.getItype()}</span>
        <span>주거전용 : ${info.getIp1()}</span>
        <span>주거공용 : ${info.getIp2()}</span>
        <span>기타공용 : ${info.getIp3()}</span>
        <span>계약면적 : ${info.getIp4()}</span>
        </div>
        </li>
        <li>${info.getIuse()}</li>
        <li>${info.getIorder()}</li>
        <li>${info.getIwriter()}</li>
        <li>${info.getIdate()}</li>
        <li>
            <input type="button" value="삭제" class="delbtn" onclick="deleteInfo(${info.getIno()})">
        </li>
       </ul>
       </c:forEach>
       <c:if test="${infos==null}">
       <ul class="nodatas">
        <li>등록된 세대타입 내용이 없습니다.</li>
       </ul>
       </c:if>
       <span class="notice_btns">
       <input type="button" value="세대타입 생성" class="meno_btn2" onclick="location.href='./InfoWrite.jsp'"></span>
       <aside>
        <div class="page_number">
        <c:choose>
       <c:when test="${currentPage > 1}">
        <a href="./config?pageNumber=${currentPage - 1}&search=${search}"><</a>
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
                <a href="./config?pageNumber=${page}&search=${search}">${page}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
     <c:choose>
        <c:when test="${currentPage < totalPages}">
            <a href="./config?pageNumber=${currentPage + 1}&search=${search}">></a>
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
<!-- 공지사항 관리 끝 -->
<footer>
<%@include file="./footer.jsp" %>   
</footer>
</body>
<script>
function deleteInfo(val){
	console.log(val)
	if(confirm("삭제시 데이터가 복구되지 않습니다 삭제하시겠습니까?")){
		fetch("./infoDelete", {
			method: "POST",
			cache: "no-cache",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "infoNumber=" + val
		}).then(function(response) {
			alert("삭제완료")
			return response.text();
		}).then(function(result) {
			location.href = "./infoPage"
		}).catch(function(error) {
			console.log("Data Error!!");
		});
	}
}
document.querySelector("#infoSearchBtn").addEventListener("click",function(){
	info.submit();
})
</script>
</html>