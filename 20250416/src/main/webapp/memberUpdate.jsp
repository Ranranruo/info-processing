<%@page import="java.sql.Statement"%>
<%@page import="db.DB"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
<table>
<tr>
<td style="border: 1px solid black; padding: 10px;">이름</td>
<td style="border: 1px solid black; padding: 10px;">학년</td>
<td style="border: 1px solid black; padding: 10px;">반</td>
<td style="border: 1px solid black; padding: 10px;">번호</td>
<td style="border: 1px solid black; padding: 10px;">성별</td>
</tr>
<% 
Connection conn = DB.get();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM member_tbl_03");

while(rs.next()) {
%>
<tr>
<td style="border: 1px solid black; padding: 10px;"><a href="memberUpdateDetail.jsp?id=<%=rs.getString(1)%>"><%= rs.getString(2) %></a></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getString(1).substring(0,1) %></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getString(1).substring(1,3) %></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getString(1).substring(3,5) %></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getString(3).contains("1") ? "남" : "여" %></td>
</tr>
<% } %>
</table>
</section>
<footer style="height: 100px; background-color: gray; font-size: 50px; display: flex; justify-content: center; align-items: center;">Copyright ⓒ 2021 All right reserved High School</footer>
</body>
</html>