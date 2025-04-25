<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<h1 style="width: 100%; display:flex; justify-content:center; margin: 0 auto; padding: 50px;">매장관리 프로그램 ver 1.0</h1>
</header>
<hr/>
<nav>
<a href="index.jsp">홈으로</a>
<a href="jd.jsp">직원 등록</a>
<a href="jj.jsp">직원 조회</a>
<a href="sd.jsp">상품 등록</a>
<a href="smj.jsp">상품 목록 조회</a>
<a href="pd.jsp">판매 등록</a>
<a href="bnj.jsp">판매 내역 조회</a>
<a href="jph.jsp">직원별 판매 현화</a>
</nav>
<hr/>
<section>
<h2>판매 등록</h2>
<form action="pdCtrl.jsp">
<table border="black">
<tr>
<td><b>직원</b></td>
<td>
<select name="emp">
<%
PreparedStatement s = con.prepareStatement("select * from emp_tbl");
ResultSet rs = s.executeQuery();
while(rs.next()) {
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(2) %></option>
<% } %>
</select>
</td>
</tr>
<tr>
<td><b>상품</b></td>
<td>
<select name="product">
<%
PreparedStatement s1 = con.prepareStatement("select * from product_tbl");
ResultSet rs1 = s1.executeQuery();
while(rs1.next()) {
%>
<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2) %></option>
<% } %>
</select>
</td>
</tr>
<tr>
<td><b>판매일자</b></td>
<td><input name="date" id="date"/></td>
</tr>
<tr>
<td><b>판매시각</b></td>
<td><input name="time" id="time"/></td>
</tr>
<tr>
<td><b>판매수량</b></td>
<td><input name="count" id="count"/></td>
</tr>
<tr>
<td colspan="2" style="margin: 0 auto; width: 100%"><button>등록</button><button id="a" type="button">목록</button></td>
</tr>
</table>
</form>
</section>
<script>
const $ = (s) => document.querySelector(s);
$("#a").addEventListener("click", () => {
	location.href="bnj.jsp";
})
$("form").addEventListener("submit", (e)=> {
	if($("#date").value == ""){
		$("#date").focus();
		alert("모든 항목을 입력하세요");
		e.preventDefault();
	} else if($("#time").value == ""){
		$("#time").focus();
		alert("모든 항목을 입력하세요");
		e.preventDefault();
	} else if($("#count").value == ""){
		$("#count").focus();
		alert("모든 항목을 입력하세요");
		e.preventDefault();
	}
})


</script>
</body>
</html>