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
<form action="perform.jsp" style="min-height: calc(100vh - 450px); display: flex; flex-direction: column; align-items: center; padding-top: 20px; gap: 30px;">
<h1 style="color: black;">네일실적등록</h1>
<table>
	<tr>
		<td>번호</td>
		<td><input data-title="번호" name="p_number" id="no" />예)1</td>
	</tr>
	<tr>
		<td>고객아이디</td>
		<td><input data-title="고객아이디" id="cid" name="customerid"/>예)C001</td>
	</tr>
	<tr>
		<td>고객등급</td>
		<td>
		<select name="grade">
			<option value="V">V[우수고객]</option>
			<option value="G">G[학생고객]</option>
			<option value="S">S[일반고객]</option>
		</select>
		예)V[우수고객]
		</td>
	</tr>
	<tr>
		<td>네일코드</td>
		<td>
		<select name="menucode1">
		<%
		Connection conn = DBconnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_menu WHERE substr(menucode, 0, 1) = 'N'");
		%>
		<% while(rs.next()) { %>
			<option value="<%=rs.getString(1)%>">[<%=rs.getString(1)%>]<%=rs.getString(2)%></option>
		<% } %>
		</select>
		예)[N01]풀코트
		</td>
	</tr>
	<tr>
		<td>페디코드</td>
		<td>
		<select name="menucode2">
		<%
		rs = stmt.executeQuery("SELECT * FROM tbl_menu WHERE substr(menucode, 0, 1) = 'P'");
		%>
		<% while(rs.next()) { %>
			<option value="<%=rs.getString(1)%>">[<%=rs.getString(1)%>]<%=rs.getString(2)%></option>
		<% } %>
		</select>
		예)[P01]풀코트
		</td>
	</tr>
	<tr>
		<td>기타</td>
		<td>
		<select name="menucode3">
		<%
		rs = stmt.executeQuery("SELECT * FROM tbl_menu WHERE substr(menucode, 0, 1) = 'E'");
		%>
		<% while(rs.next()) { %>
			<option value="<%=rs.getString(1)%>">[<%=rs.getString(1)%>]<%=rs.getString(2)%></option>
		<% } %>
		</select>
		예)[E01]해당없음
		</td>
	</tr>
	<tr>
		<td>방문일자</td>
		<td><input name="visitdate" id="date" data-title="방문일자"/>예)230801</td>
	</tr>
	<tr>
		<td colspan="2" style="display: flex; justify-content: center;"><button>등록</button><button type="reset">다시쓰기</button></td>
	</tr>
</table>
</form>
<footer style="height: 100px; background-color: black; color: #fff; display: flex; align-items: center; justify-content: center; font-size: 50px;">Copyright @ 2023 All right reserved HRD</footer>
</body>
<script type="text/javascript">
const $ = (s) => document.querySelector(s);

$("form").addEventListener("submit", (e) => {
	if($("#cid").value.replaceAll(" ", "") == "") {
		alert("고객아이디가 입력되지 않았습니다.");
		$("#cid").focus();
		e.preventDefault();	
	}
	if($("#date").value.replaceAll(" ", "") == "") {
		alert("방문일자가 입력되지 않았습니다.");
		$("#cid").focus();
		e.preventDefault();	
	}
	if($("#no").value.replaceAll(" ", "") == "") {
		alert("번호가 입력되지 않았습니다.");
		$("#cid").focus();
		e.preventDefault();	
	}
});
</script>
</html>