<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page_default.css?v=">
<link rel="stylesheet" href="./css/admin_css.css?v=">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
<!-- 신규추가된 css 파일 -->
<link rel="stylesheet" href="./css/notice.css?v=33">
<!-- 신규추가된 css 파일 끝-->
<title>관리자 페이지</title>
<script>
</script>
</head>
<body>
<nav>
<div class="menusize">
    <ul id="menus">
        <li class="topmenu1">ADMINISTRATOR</li>
        <li class="topmenu2">환경설정</li>
        <li class="topmenu2">회원관리</li>
        <li class="topmenu2">공지사항 관리</li>
        <li class="topmenu2">FAQ</li>
        <li class="topmenu2">예약현황</li>
        <li class="topmenu2">관리자현황</li>
        <li class="topmenu3">홍길동님 환영합니다  <a href="">[로그아웃]</a></li>
    </ul>
 </div>
<div class="menuline"></div> 
</nav>
<!-- FAQ 리스트 시작 -->
<main class="page_main">
<section class="page_section">
<div class="listbody">
    <div class="protitle">FAQ 관리</div>
    <div class="procho">
       <section class="search_part">
        <ol>
        <li>FAQ내용 검색</li>
        <li>
        <input type="text" class="search_input">
        <input type="button" value="검색" class="datebtn">
        </li>        
        <li></li>
        <li></li> 
        </ol>
       </section> 
       <section class="data_listsview2">
       <ul>
        <li>QA</li>
        <li>질문/답변</li>
        <li>글쓴이</li>
        <li>등록일</li>
        <li>삭제</li>
       </ul>
          
<!-- FAQ 샘플 HTML 코드 시작 -->           
     <span id="faqSpan">
       <ul class="node">
        <li>Q</li>
        <li  style="text-align: left; justify-content: flex-start;">FAQ 질문사항 출력1</li>
        <li>관리자</li>
        <li>2023-10-06</li>
        <li>
        <input type="button" value="삭제" class="delbtn">
        </li>
       </ul>
      <!-- display:none 또는 display:flex 로 해야합니다. -->
       <ol style="display: none;">
        <li>A</li>
        <li style="text-align: left; justify-content: flex-start;">FAQ 답변사항 출력1</li>
       </ol> 
         
        <ul class="node">
        <li>Q</li>
        <li  style="text-align: left; justify-content: flex-start;">FAQ 질문사항 출력2</li>
        <li>관리자</li>
        <li>2023-10-06</li>
        <li>
        <input type="button" value="삭제" class="delbtn">
        </li>
       </ul>
       <ol style="display: none;">
        <li>A</li>
        <li style="text-align: left; justify-content: flex-start;">FAQ 답변사항 출력2</li>
       </ol> 
       <ul class="node">
        <li>Q</li>
        <li  style="text-align: left; justify-content: flex-start;">FAQ 질문사항 출력3</li>
        <li>관리자</li>
        <li>2023-10-06</li>
        <li>
        <input type="button" value="삭제" class="delbtn">
        </li>
       </ul>
       <ol style="display: none;">
        <li>A</li>
        <li style="text-align: left; justify-content: flex-start;">FAQ 답변사항 출력3</li>
       </ol> 
       
     </span>
<!-- FAQ 샘플 HTML 코드 끝 -->          
        
       <ul class="nodatas">
        <li>등록된 FAQ 내용 없습니다.</li>
       </ul>
       <span class="notice_btns">
       <input type="button" value="FAQ 등록" class="meno_btn2"></span>
       <aside>
        <div class="page_number">
           <ul>
           <li>1</li>      
           </ul>
        </div>
       </aside>
       </section>
    </div>
</div> 
</section>
</main>
<!-- FAQ 리스트 끝 -->
<footer>
<div class="menusize">Copyright ⓒ 2023 Raemian 분양안내 관리 시스템 All rights reserved</div>    
</footer>
</body>
<script src="./js/faq.js?v=1">

</script>
</html>