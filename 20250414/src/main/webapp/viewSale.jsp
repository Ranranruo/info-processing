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
<h1 style="color: black;">네일실적조회</h1>
<table>
	<tr>
		<td>번호</td>
		<td>고객아이디</td>
		<td>성명</td>
		<td>주소</td>
		<td>고객등급</td>
		<td>네일</td>
		<td>패디</td>
		<td>기타</td>
		<td>방문일자</td>
	</tr>
	<%
	Connection conn = DBconnection.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "SELECT p.p_number, c.customerid, c.name, c.address, (CASE WHEN p.grade = 'V' THEN '우수고객' WHEN p.grade = 'G' THEN '일반고객' WHEN p.grade = 'S' THEN '학생고객' else '기타' END) AS grade, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode1) AS menucode1, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode2) AS menucode2, (SELECT menuname FROM tbl_menu WHERE menucode = p.menucode3) AS menucode3, to_char(to_date(p.visitdate), 'yyyy/MM/dd') as visitdate FROM tbl_performance p, tbl_customer c WHERE p.customerid = c.customerid";
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<% while(rs.next()) { %>
	<tr>
		<td><%= rs.getString("p_number") %></td>
		<td><%= rs.getString("customerid") %></td>
		<td><%= rs.getString("name") %></td>
		<td><%= rs.getString("address") %></td>
		<td><%= rs.getString("grade") %></td>
		<td><%= rs.getString("menucode1") %></td>
		<td><%= rs.getString("menucode2") %></td>
		<td><%= rs.getString("menucode3") %></td>
		<td><%= rs.getString("visitdate") %></td>
		
	</tr>
	
	<% } %>
</table>
</main>
<footer style="height: 100px; background-color: black; color: #fff; display: flex; align-items: center; justify-content: center; font-size: 50px;">Copyright @ 2023 All right reserved HRD</footer>
</body>
</html>