<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="hd">
 <div class="top_menu">
        <ul class="top_menu_list">
        <!--로그인 후 -->
         <c:if test="${loginMember!=null}">
        <li>${loginMember.getMname()}님 환영합니다 <a href="./logout">[로그아웃]</a></li>
        <li>FAQ</li>
        <li>공지사항</li>
        </c:if>
        <!-- 로그인 전 -->
        <c:if test="${loginMember==null}">
        <li><a href="./memberLogin.jsp">로그인</a></li>
        <li><a href="./joinAgree.jsp">회원가입</a></li>
        <li>FAQ</li>
        <li><a href="./notice">공지사항</a></li>
        </c:if>
        </ul>
    </div>
        <div class="top">
            <h1><a href="/" class="icon-hd-logo"></a></h1>
            <nav id="gnb">
                <li>
                    <a href=""><span>사업정보</span></a>
                    <ul>
                        <li><a href="">지구안내</a></li>
                        <li><a href="">입지안내</a></li>
                        <li><a href="">지역조감도</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>단지정보</span></a>
                    <ul>
                        <li><a href="">단지안내</a></li>
                        <li><a href="">시스템</a></li>
                        <li><a href="">단지배치도</a></li>
                        <li><a href="">동호배치도</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>세대정보</span></a>
                    <ul>
                        <li><a href="">타입별 평면도</a></li>
                        <li><a href="">인테리어</a></li>
						<li><a href="">사이버모델하우스</a></li>
						<li><a href="">인테리어마감재</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>공급정보</span></a>
                    <ul>
                       <li><a href="">입주자 모집공고</a></li>
                        <li><a href="">E-카달로그</a></li>
                         <li><a href="">공급일정 안내</a></li>
                        <li><a href="">오시는 길</a></li>
                      <li><a href=""></a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>사전방문예약</span></a>
                    <ul>
                        <li><a href="./reserve?mid=${loginMember.getMid()}">사전방문예약</a></li>
                        <li><a href="./reserveCheck?mid=${loginMember.getMid()}">사전방문예약확인</a></li>
                        <li><a href="./reserveCheck2?mid=${loginMember.getMid()}">사전방문예약취소</a></li>
                    </ul>
                </li>
            </nav>
        </div>
        <script>
        
        </script>
	</header>