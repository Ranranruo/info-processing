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
<h1 style="padding: 50px;">차량 등록</h1>
<form action="carInsertCtrl.jsp">
<table>
<tr>
	<td>차랑명</td>
	<td><input id="name" data-name="차량명을 입력해주세요." name="car_name"/></td>
</tr>
<tr>
	<td>매입가</td>
	<td><input id="price" data-name="매입가를 입력해주세요." type="number" name="buy_price"/>만원</td>
</tr>
<tr>
	<td>딜러 선택</td>
	<td>
		<select id="dealer" name="dealer_id" data-name="딜러를 선택해주세요.">
		<option value="">선택</option>
	<%
	Connection con = DB.get();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_DEALER_202504");
	while(rs.next()) {
	%>
	<option value="<%=rs.getInt(1)%>"><%= rs.getString(2) %></option>
	<% } %>			
		</select>
	</td>
</tr>
<tr>
	<td style="text-align: center;" colspan="2">
		<button class="button">등록</button>
		<button class="button" type="reset" id="re">다시쓰기</button>
	</td>
</tr>
</table>
</form>
</section>
<footer style="height: 50px; font-weight: bold; background-color: black; color: #fff;" class="c">ⓒ2025 중고차 관리 시스템</footer>
<script>
	const $ = (s) => document.querySelector(s);
	$("#re").addEventListener("click", (e) => {
		$("#name").focus();
	})
	$("form").addEventListener("submit", (e) => {
		if($("#name").value == "") {
			alert($("#name").dataset.name);
			$("#name").focus();
			e.preventDefault();		
		}
		else if($("#price").value == "") {
			alert($("#price").dataset.name);
			$("#price").focus();
			e.preventDefault();		
		}
		else if($("#dealer").value == "") {
			alert($("#dealer").dataset.name);
			$("#dealer").focus();
			e.preventDefault();
		}
	});
</script>
</body>
</html>