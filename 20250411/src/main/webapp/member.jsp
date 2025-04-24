<%@page import="db.DBconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = DBconnection.getConnection();
Statement stmt =  conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT substr(c.class_ym, 1, 4) || '년' || substr(c.class_ym, 5, 2) || '월', m.mem_no, m.mem_nm, t.class_nm, c.class_loc, to_char(c.class_price, 'L999,999'), CASE WHEN substr(m.mem_no, 1, 1) = 	'1' THEN '일반' WHEN substr(m.mem_no, 1, 1) = '2' THEN 'VIP' END AS rank FROM tbl_member_202305 m, tbl_class_202305 c, tbl_teacher_202305 t WHERE m.mem_no = c.mem_no AND t.teacher_cd = c.teacher_cd ORDER BY c.class_ym DESC, m.mem_no ASC");
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
	<p class="title">회원정보조회</p>
	<table>
		<tr>
			<td class="sub">수강월</td>
			<td class="sub">회원번호</td>
			<td class="sub">회원명</td>
			<td class="sub">강의명</td>
			<td class="sub">강의장소</td>
			<td class="sub">수강료</td>
			<td class="sub">등급</td>
		</tr>
		<%while(rs.next()) {%>
		<tr>
			<td class="sub"><%= rs.getString(1) %></td>
			<td class="sub"><%= rs.getString(2) %></td>
			<td class="sub"><%= rs.getString(3) %></td>
			<td class="sub"><%= rs.getString(4) %></td>
			<td class="sub"><%= rs.getString(5) %></td>
			<td class="sub"><%= rs.getString(6) %></td>
			<td class="sub"><%= rs.getString(7) %></td>
		</tr>
		<%} %>
	</table>
	</main>
	<footer>
	HRDKOREA Copyright@2015 All rights reserved. Human Resource Development Service of Korea
	</footer>
</body>
</html>