<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{padding: 0; margin: 0; text-decoration: none;}
a{color:inherit;}
.c{ display: flex; align-items: center; justify-content: center;}
</style>
</head>
<body>
<header style="height: 100px; font-size: 50px; background-color: black; color: #fff;" class="c">중고차 관리 프로그램</header>
<nav style="display:flex; gap:20px; background-color: gray; color:#fff; align-items: center; height: 50px; padding-left: 10px;">
<a href="index.jsp">홈</a>
<a href="carInsert.jsp">차량등록</a>
<a href="salesCar.jsp">판매차량조회</a>
<a href="dealers.jsp">딜러별 매출조회</a>
<a href="dealer.jsp">딜러 실적조회</a>
</nav>
<section style="min-height: calc(100vh - 200px); flex-direction: column; justify-content: start;" class="c">
<h1 style="padding: 50px;">중고차 관리 프로그램</h1>
<p style="padding: 30px;">안녕하세요! <b>중고차 판매 및 딜러 관리 시스템</b>에 오신것을 환영합니다.</p>
<p style="">이 시스템은 차량 등록, 판매 내역 조회, 딜러별 매출 및 실적을 확인할 수 있도록 구성되어 있습니다.</p>
<p style="">상단에 메뉴를 통해서 각 기능을 확인해보세요!</p>
</section>
<footer style="height: 50px; font-weight: bold; background-color: black; color: #fff;" class="c">ⓒ2025 중고차 관리 시스템</footer>
</body>
</html>