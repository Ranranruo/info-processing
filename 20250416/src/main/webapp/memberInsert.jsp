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
<h1 style="padding: 50px;">학생조회/수정</h1>
<form action="memberInsertCtrl.jsp">
<div style="display: flex;">
<h2>학번</h2>
<input name="id"/>
</div>
<div style="display: flex;">
<h2>이름</h2>
<input name="name"/>
</div>
<div style="display: flex;">
<h2>성별</h2>
<select name="gender">
<option value="1">남자</option>
<option value="2">여자</option>
</select>
</div>
<button>등록</button>
</form>
</section>
<footer style="height: 100px; background-color: gray; font-size: 50px; display: flex; justify-content: center; align-items: center;">Copyright ⓒ 2021 All right reserved High School</footer>
</body>
</html>