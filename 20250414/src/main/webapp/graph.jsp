<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body>
<header style="height: 300px; display: flex; align-items: center; justify-content: center; font-size: 50px; font-weight: bold; background-color: blue; color: #fff; ">네일아트관리 프로그램</header>
<nav style="background-color: black; height: 50px; display: flex">
<a href="naleMenu.jsp" style="padding: 20px; color: #fff; display: flex; height: 50px; align-items: center;">네일메뉴조회</a>
<a href="sale.jsp" style="padding: 20px; color: #fff; display: flex; height: 50px; align-items: center;">네일실적등록</a>
<a href="viewSale.jsp" style="padding: 20px; color: #fff; display: flex; height: 50px; align-items: center;">네일실적조회</a>
<a href="graph.jsp" style="padding: 20px; color: #fff; display: flex; height: 50px; align-items: center;">네일아트통계</a>
<a href="index.jsp" style="padding: 20px; color: #fff; display: flex; height: 50px; align-items: center;">홈으로</a>
</nav>
<main style="min-height: calc(100vh - 450px); display: flex; flex-direction: column; align-items: center; padding-top: 20px; gap: 30px;">
<h1 style="color: black;">네일메뉴조회</h1>
<table>
	<tr>
		<td>방문일자</td>
		<td>총건수</td>
		<td>총가격</td>
	</tr>
	<%
	Connection conn = DBconnection.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT to_char(to_date(p.visitdate), 'yyyy/MM/dd') as visitdate, COUNT(*), SUM(CASE WHEN p.grade = 'V' THEN m.price * 0.9 WHEN p.grade = 'S' THEN m.price * 0.8 ELSE m.price END ) as price FROM tbl_performance p, tbl_menu m WHERE p.menucode1 = m.menucode AND m.price != 0 GROUP BY p.visitdate ORDER BY p.visitdate");
	%>
	<% while(rs.next()) { %>
	<tr>
		<td><%= rs.getString(1) %></td>
		<td><%=rs.getString(2) %>건</td>
		<td>\ <%=NumberFormat.getInstance().format(rs.getInt(3)) %></td>
	</tr>
	
	<% } %>
</table>
</main>
<footer style="height: 100px; background-color: black; color: #fff; display: flex; align-items: center; justify-content: center; font-size: 50px;">Copyright @ 2023 All right reserved HRD</footer>
</body>
</html>