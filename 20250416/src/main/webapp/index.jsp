<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{ padding: 0; margin: 0; text-decoration: none; color:inherit;}
</style>
</head>
<body>
<header style="height: 100px; background-color: gray; font-size: 50px; display: flex; justify-content: center; align-items: center;">학생 성적 관리 프로그램 ver 1.0</header>
<nav style="padding: 20px; display:flex; gap:10px; background-color: #333; color: #fff;">
<a href="memberInsert.jsp">학생등록</a>
<a href="memberUpdate.jsp">학생조회/수정</a>
<a href="memberRank.jsp">반별성적조회</a>
<a href="memberBest.jsp">성적우수자조회</a>
<a href="index.jsp">홈으로</a>
</nav>
<section style="min-height: calc(100vh - 220px); display: flex; flex-direction: column; align-items: center;">
<h1 style="padding: 50px;">학생성적 관리 프로그램</h1>
<h2 style="display: block; width: 100%; padding: 50px 0px;">학생과 학생 성적에 관한 데이터베이스를 구축하고 관리하기 위한 프로그램이다.</h24>
<h2 style="display: block; width: 100%">1. 학생정보 및 학생성적 테이블을 생성하고 샘플데이터를 추가한다.</h24>
<h2 style="display: block; width: 100%">2. 학생등록, 학생조회/수정, 반별성적조회, 성적우수자조회 프로그램을 작성한다.</h24>
<h2 style="display: block; width: 100%">3. 올바르게 구현되었는지 확인한다.</h24>
</section>
<footer style="height: 100px; background-color: gray; font-size: 50px; display: flex; justify-content: center; align-items: center;">Copyright ⓒ 2021 All right reserved High School</footer>
</body>
</html>