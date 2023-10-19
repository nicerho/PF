<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="frm" name="frm" method="get" action="./config">    
<div class="listbody">
 <div class="adlisttitle">관리자 현황</div>
 <div class="procho">
    <ul>
        <li class="prochoL procfont">소속</li>
        <li class="prochoL ">
            <select class="adlistcsel1" id="depSelect" name="adep" value="${adep}">
                <option value="" <c:if test="${dep eq ''}">selected</c:if>>전체</option>
                <option value="본사" <c:if test="${dep eq '본사'}">selected</c:if>>본사</option>
                <option value="경기도" <c:if test="${dep eq '경기도'}">selected</c:if>>경기도</option>
                <option value="인천" <c:if test="${dep eq '인천'}">selected</c:if>>인천</option>
                <option value="대전" <c:if test="${dep eq '대전'}">selected</c:if>>대전</option>
                <option value="세종" <c:if test="${dep eq '세종'}">selected</c:if>>세종</option>
                <option value="광주" <c:if test="${dep eq '광주'}">selected</c:if>>광주</option>
                <option value="대구" <c:if test="${dep eq '대구'}">selected</c:if>>대구</option>
                <option value="울산" <c:if test="${dep eq '울산'}">selected</c:if>>울산</option>
                <option value="전라남도" <c:if test="${dep eq '전라남도'}">selected</c:if>>전라남도</option>
                <option value="전라북도" <c:if test="${dep eq '전라북도'}">selected</c:if>>전라북도</option>
                <option value="충청남도" <c:if test="${dep eq '충청남도'}">selected</c:if>>충청남도</option>
                <option value="충청북도" <c:if test="${dep eq '충청북도'}">selected</c:if>>충청북도</option>
                <option value="경상남도" <c:if test="${dep eq '경상남도'}">selected</c:if>>경상남도</option>
                <option value="경상북도" <c:if test="${dep eq '경상북도'}">selected</c:if>>경상북도</option>
                <option value="제주도" <c:if test="${dep eq '제주도'}">selected</c:if>>제주도</option>  
            </select>           
        </li>
    </ul>
 </div>
 <div class="procho">
    <ul>
        <li class="prochoL procfont">검색형식</li>
        <li class="prochoL ">
            <select class="adlistcsel1" name="searchpart" id="search_part" onchange="select2(this.value)">
                <option <c:if test="${selected eq '이름'}">selected</c:if>>이름</option>
                <option <c:if test="${selected eq '아이디'}">selected</c:if>>아이디</option>
                <option <c:if test="${selected eq '연락처'}">selected</c:if>>연락처</option>
            </select>
        </li>
        <li class="prochoL"><input type="text" class="adlistcsel1" name="search" id="searchPart"  value="${search}"></li>
        <li class="prochoL"><input type="submit" class="proclick" value="검색" id="searchPart2"></li>
        <li class="prochoL"><button type="button" class="proclick" onclick="location.href='./config'">전체</button></li>
    </ul>
 </div>
 <div class="protaball">
    <table width="1100">
        <thead>
            <tr style="color: white; background-color:rgb(67, 66, 66);">
                <td class="listcenter" width=50>NO</td>
                <td class="listcenter" width=150>구분</td>
                <td class="listcenter" width=150>아이디</td>
                <td class="listcenter" width=120>이름</td>
                <td class="listcenter" width=80>직책</td>
                <td class="listcenter" width=200>이메일</td>
                <td class="listcenter" width=120>연락처</td>
                <td class="listcenter" width=120>현황</td>
                <td class="listcenter" width=110>적용</td>
            </tr>
        </thead>
        <tbody>
            <c:if test="${adminList==null}">
            <tr height="30"><td class="listcenter" colspan="9">등록된 관리자가 없습니다.</td></tr>
            </c:if>
            <c:forEach var="admin" items="${adminList}">
            <tr class="master_list" >
                <td class="listcenter" width=50 >${admin.getAno()}</td>
                <td class="listcenter" width=150>${admin.getAbranch()}</td>
                <td class="listcenter" width=150>${admin.getAid()}</td>
                <td class="listcenter" width=120>${admin.getAname()}</td>
                <td class="listcenter" width=80>${admin.getApos()}</td>
                <td class="listcenter" width=200>${admin.getAemail()}</td>
                <td class="listcenter" width=120>${admin.getAtel()}</td>
                <td class="listcenter" width=120>	
                    <select class="adlistsel3" id="use${admin.getAno()}">            
                        <option>근무중</option>                        
                        <option <c:if test="${admin.getAuse()=='N'}">selected</c:if>>퇴직중</option>  
                    </select>
                </td>
                <td class="listcenter" width=110>
                <button type="button" class="listclick" onclick="saveChange(${admin.getAno()})">적용</button></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
 </div>
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
</div>
</form>
<script src="./js/Config.js?v=${date}"></script>