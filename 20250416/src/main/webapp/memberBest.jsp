<%@page import="java.text.NumberFormat"%>
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
<h1 style="padding: 50px;">반별성적조회</h1>
<table>
<tr>
<td style="border: 1px solid black; padding: 10px;">학번</td>
<td style="border: 1px solid black; padding: 10px;">이름</td>
<td style="border: 1px solid black; padding: 10px;">국어</td>
<td style="border: 1px solid black; padding: 10px;">영어</td>
<td style="border: 1px solid black; padding: 10px;">수학</td>
<td style="border: 1px solid black; padding: 10px;">역사</td>
<td style="border: 1px solid black; padding: 10px;">총계</td>
<td style="border: 1px solid black; padding: 10px;">등수</td>
</tr>
<% 
Connection conn = DB.get();
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT m.id, m.name, s.korean, s.english, s.math, s.history, s.korean + s.english + s.math + s.history, RANK() OVER (ORDER BY s.korean + s.english + s.math + s.history DESC) FROM member_tbl_03 m, score_tbl_03 s WHERE m.id = s.id AND ROWNUM <= 3");

while(rs.next()) {
%>
<tr>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getString(1)%></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getString(2)%></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getInt(3)%></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getInt(4)%></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getInt(5)%></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getInt(6)%></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getInt(7)%></td>
<td style="border: 1px solid black; padding: 10px;"><%= rs.getInt(8)%></td>
</tr>
<% } %>
</table>
</section>
<footer style="height: 100px; background-color: gray; font-size: 50px; display: flex; justify-content: center; align-items: center;">Copyright ⓒ 2021 All right reserved High School</footer>
</body>
</html>