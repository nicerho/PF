<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=">
<link rel="stylesheet" href="./css/admin_css.css?v=">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
	
</script>
</head>
<body>
	<%@include file="./top.jsp"%>
	<main class="page_main">
		<section class="page_section">
			<div class="listbody">
				<div class="protitle">사전예약 회원 관리</div>
				<div class="procho">
					<section class="search_part">
						<ol>

							<li>회원 검색</li>
							<form id="f" method="get" action="./reserveCheck">
							<li><select class="search_select"  name="searchpart">
									<option>아이디</option>
									<option>이름</option>
									<option>연락처</option>
							</select> <input type="text" id="sdate2" class="search_input" name="search" id="searchPart"  value="${search}"> <input
type=button value="검색" class="datebtn"></li>
								</form>
							<li></li>
							<li></li>
							
						</ol>
					</section>
					<section class="reserve_listsview">
						<ul>
							<li>번호</li>
							<li>아이디</li>
							<li>고객명</li>
							<li>연락처</li>
							<li>예약일자</li>
							<li>예약시간</li>
							<li>인원수</li>
							<li>예약취소</li>
						</ul>
						<c:forEach items="${reserveList}" var="r">
							<ul>
								
								<li>${r.getRno()}</li>
								<li>${r.getRid()}</li>
								<li>${r.getRname()}</li>
								<li>${r.getRtel()}</li>
								<li>${r.getRreservedate()}</li>
								<li>${r.getRtime()}</li>
								<li>${r.getRperson()}</li>
								<li><input type="button" value="취소" class="delbtn" onclick="deleteBtn()">
								</li>
								<input type="hidden" value="${r.getRid()}" id="ridd">
							</ul>
						</c:forEach>
						<c:if test="${reserveList==null || reserveList.isEmpty()==true}">
							<ul class="nodatas">
								<li>사전예약 신청 회원이 없습니다.</li>
							</ul>
						</c:if>
						<aside>
							<div class="page_number">
								<c:choose>
									<c:when test="${currentPage > 1}">
										<a
											href="./faqPage?pageNumber=${currentPage - 1}&search=${search}"><</a>
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
											<a href="./faqPage?pageNumber=${page}&search=${search}">${page}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${currentPage < totalPages}">
										<a
											href="./faqPage?pageNumber=${currentPage + 1}&search=${search}">></a>
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
	<footer>
		<%@include file="./footer.jsp"%>
	</footer>
</body>
<script>
function deleteBtn(val){
	var val = document.getElementById("ridd").value;
	
	if (confirm("선택하신 에약사항을 취소하시겠습니까?")) {
		fetch("./mp/reserveDelete", {
			method: "POST",
			cache: "no-cache",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "rid=" + val
		}).then(function(response) {
			alert("저장완료")
			return response.text();
		}).then(function(result) {
			location.href = "./reserveCheck"
		}).catch(function(error) {
			console.log("Data Error!!");
		});
	}	
}

</script>
</html>