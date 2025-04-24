<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.DB"%>
<%@page import="java.sql.Connection"%>
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
td{ border: 1px solid black;}
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
<h1 style="padding: 50px;">판매 준비 차량 목록</h1>
<form action="carInsertCtrl.jsp">
<table>
<tr>
	<td>차량번호</td>
	<td>차량명</td>
	<td>매입가</td>
	<td>판매가</td>
	<td>딜러명</td>
</tr>
<%
Connection con = DB.get();
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_CAR_202504 c INNER JOIN TBL_DEALER_202504 d ON c.DEALER_ID = d.DEALER_ID WHERE IS_SOLD = 'N'");
while(rs.next()) {
%>
<tr>
	<td><%=rs.getInt("CAR_ID")%></td>
	<td><%=rs.getString("CAR_NAME")%></td>
	<td><%=NumberFormat.getInstance().format(rs.getInt("BUY_PRICE"))%>만원</td>
	<td><%=NumberFormat.getInstance().format(rs.getInt("BUY_PRICE") + (rs.getInt("BUY_PRICE") / 5))%>만원</td>
	<td><%=rs.getString("DEALER_NAME")%></td>
</tr>
<% } %>
</table>
</form>
</section>
<footer style="height: 50px; font-weight: bold; background-color: black; color: #fff;" class="c">ⓒ2025 중고차 관리 시스템</footer>
</body>
</html>