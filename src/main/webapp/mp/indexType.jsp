<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<section id="px4" class="sect04 px-sect last-sect">
        <div class="w-base">
            <div class="tit-area  animated fadeInUp m_center">
                <h3>편안하고 실용적인 <br class="m_br">합리적 공간배치<br class="m_br"><a href="#">more</a></h3>
                <p class="animated fadeInUp m_center">더 나은 삶, 나은 내일<br>가족의 행복한 이야기로 가득 채워집니다</p>
            </div>


             <div class="contents-4-box row">
                <div>
                    <ul class="nav nav-tabs box-nav m_flex_center">
              <c:forEach items="${info}" var="i">
              <c:if test="${i.getIuse()=='O'}">
                        <!-- 타입 출력 -->
						 <li>
						 	<c:if test="${i.getIorder()==1}">
                            <button type="button" class="tab_showroom active" data-num="${i.getIorder()}">${i.getItype()}</button>
                            </c:if>
                            <c:if test="${i.getIorder()!=1}">
                            <button type="button" class="tab_showroom " data-num="${i.getIorder()}">${i.getItype()}</button>
                            </c:if>
                        </li>
                     </c:if>
                        <!-- 타입 출력 끝-->
             </c:forEach>
                    </ul>
                </div>
                <div class="col-sm-12 col-xs-12">
                    <div class="iso-box">
                     <c:forEach items="${info}" var="i">
                     <c:if test="${i.getIuse()=='O'}">
                        <div class="showroom" id="showroom_${i.getIorder()}">
                            <span><img src="${i.getIimagedir()}" class="img-responsive center-block" alt=""></span>
                            <div class="area-info col-sm-1">
                                <h4>${i.getItype()}</h4>
                                <ul>
                                    <li>
                                        <h5>주거전용</h5>
                                        <p>${i.getIp1()}㎡</p>
                                    </li>
                                    <li>
                                        <h5>주거공용</h5>
                                        <p>${i.getIp2()}㎡</p>
                                    </li>
                                    <li>
                                        <h5>기타공용</h5>
                                        <p>${i.getIp3()}㎡</p>
                                    </li>
                                    <li>
                                        <h5>계약면적</h5>
                                        <p>${i.getIp4()}㎡</p>
                                    </li>
                                </ul>
                               </div>
                            </div>
                            </c:if>
                                </c:forEach>
                    </div>
                </div>
            </div>
        </div>
	</section>