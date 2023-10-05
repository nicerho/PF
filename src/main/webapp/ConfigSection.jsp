<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form id="frm" name="frm" method="post" onsubmit="return member_search();">    
<div class="listbody">
 <div class="adlisttitle">관리자 현황</div>
 <div class="procho">
    <ul>
        <li class="prochoL procfont">소속</li>
        <li class="prochoL ">
            <select class="adlistcsel1">
                <option value="">전체</option>
                <option value="본사">본사</option>
                <option value="경기도">경기도</option>
                <option value="인천">인천</option>
                <option value="대전">대전</option>
                <option value="세종">세종</option>
                <option value="광주">광주</option>
                <option value="대구">대구</option>
                <option value="울산">울산</option>
                <option value="전라남도">전라남도</option>
                <option value="전라북도">전라북도</option>
                <option value="충청남도">충청남도</option>
                <option value="충청북도">충청북도</option>
                <option value="경상남도">경상남도</option>
                <option value="경상북도">경상북도</option>
                <option value="제주도">제주도</option>  
            </select>
        </li>
    </ul>
 </div>
 <div class="procho">
    <ul>
        <li class="prochoL procfont">검색형식</li>
        <li class="prochoL ">
            <select class="adlistcsel1" name="search_part">
                <option>이름</option>
                <option>아이디</option>
                <option>연락처</option>
            </select>
        </li>
        <li class="prochoL"><input type="text" class="adlistcsel1"></li>
        <li class="prochoL"><input type="submit" class="proclick" value="검색"></li>
        <li class="prochoL"><button type="button" class="proclick" >전체</button></li>
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
            <tr height="30"><td class="listcenter" colspan="9">등록된 관리자가 없습니다.</td></tr>
            <tr class="master_list">
                <td class="listcenter" width=50></td>
                <td class="listcenter" width=150></td>
                <td class="listcenter" width=150></td>
                <td class="listcenter" width=120></td>
                <td class="listcenter" width=80></td>
                <td class="listcenter" width=200></td>
                <td class="listcenter" width=120></td>
                <td class="listcenter" width=120>
                    <select class="adlistsel3">
                        <option>근무중</option>
                        <option>퇴직중</option>
                    </select>
                </td>
                <td class="listcenter" width=110>
                <button type="button" class="listclick" >적용</button></td>
            </tr>
        </tbody>
    </table>
 </div>
 
 <div class="propagebt">
    <ul>
        <li> < </li>
        <li> 1</li>
        <li style="margin-right: 0px;"> > </li>
    </ul>
 </div>
</div>
</form>