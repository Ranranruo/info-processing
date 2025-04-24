<%@page import="db.DBconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = DBconnection.getConnection();
Statement stmt =  conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT t.teacher_cd, t.class_nm, t.teacher_nm, to_char(SUM(c.class_price), 'L999,999') FROM tbl_class_202305 c, tbl_teacher_202305 t WHERE t.teacher_cd = c.teacher_cd GROUP BY t.teacher_cd, t.class_nm, t.teacher_nm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body>
<header>
		골프 연습장 회원관리 프로그램 ver 1.0
	</header>
	<nav>
		<a href="./teacher.jsp">강사조회</a>
		<a href="./addClass.jsp">수강신청</a>
		<a href="./member.jsp">회원정보조회</a>
		<a href="./teacherMoney.jsp">강사매출현황</a>
		<a href="./index.jsp">홈으로</a>
	</nav>
	<main>
	<p class="title">강사매출현황</p>
	<table>
		<tr>
			<td class="sub">강사코드</td>
			<td class="sub">강의명</td>
			<td class="sub">강사명</td>
			<td class="sub">총매출</td>
		</tr>
		<%while(rs.next()) {%>
		<tr>
			<td class="sub"><%= rs.getString(1) %></td>
			<td class="sub"><%= rs.getString(2) %></td>
			<td class="sub" style="text-align: right;"><%= rs.getString(3) %></td>
			<td class="sub" style="text-align: right;"><%= rs.getString(4) %></td>
		</tr>
		<%} %>
	</table>
	</main>
	<footer>
	HRDKOREA Copyright@2015 All rights reserved. Human Resource Development Service of Korea
	</footer>
</body>
</html>