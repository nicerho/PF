<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="ad_top" ></div>
   
  <div class="ad_mainall">
   <div class="ad_main">
<!-- 일반회원 리스트 시작(추가) -->
       <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">일반회원</li>
            <li class="ad_mainbox">
            <ol>
                <li>아이디</li>
                <li>고객명</li>
                <li>연락처</li>
                <li>이메일</li>
                <li>주소</li>
            </ol>
            <c:forEach items="${members}" var="m">
            <ol class="bgcancel">
                <li>${m.getMid()}</li>
                <li>${m.getMname()}</li>
                <li>${m.getMtel()}</li>
                <li>${m.getMemail()}</li>
                <li style="text-align: left;">(${m.getMadd1()})${m.getMadd2()}${m.getMadd3()}</li>
            </ol>
            </c:forEach> 
            <c:if test="${members.isEmpty()==true}">
				<ul class="nodatas">
					<li>오늘 가입한 회원이 없습니다.</li>
				</ul>
			</c:if> 
            </li>
         </ul>
      </div>
<!-- 일반회원 리스트 끝(추가) -->
   </div>
   <div class="ad_main">
      <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">1:1 문의사항</li>
            <li class="ad_mainbox"></li>
         </ul>
      </div>
   </div>
   <div class="ad_main">
      <div class="ad_main1">
         <ul>
            <li class="ad_maintitle">예약현황</li>
            <li class="ad_mainbox2">
            <ol>
                <li>아이디</li>
                <li>고객명</li>
                <li>연락처</li>
                <li>예약일자</li>
                <li>예약시간</li>
                <li>예약인원</li>
            </ol>
            <c:forEach items="${reserve}" var="r">
            <ol class="bgcancel">
                <li>${r.getRid()}</li>
                <li>${r.getRname()}</li>
                <li>${r.getRtel()}</li>
                <li>${r.getRreservedate()}</li>
                <li>${r.getRtime()}</li>
                <li>${r.getRperson()}</li>
            </ol>
            </c:forEach>  
            </li> 
         </ul>
      </div>
   </div>
 </div>
<!-- 관리자 메인 파트 끝 -->