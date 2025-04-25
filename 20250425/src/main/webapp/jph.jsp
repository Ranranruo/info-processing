<%@page import="java.text.NumberFormat"%>
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
<h2>직원별 판매 현황</h2>
<form>
<table border="black">
<tr>
<td><b>직원이름</b></td>
<td><b>누적판매액</b></td>
</tr>
<%
PreparedStatement s = con.prepareStatement("select e.empname, SUM(s.sellcount * p.productprice) from emp_tbl e, product_tbl p, sell_tbl s WHERE e.empno = s.empno AND s.productno = p.productno GROUP BY e.empname ORDER BY SUM(s.sellcount * p.productprice) DESC");
ResultSet r = s.executeQuery();
while(r.next()) {
%>
<tr>
<td><%= r.getString(1) %></td>
<td><%= NumberFormat.getInstance().format(r.getInt(2)) %></td>
</tr>
<% } %>
</table>
</form>
</section>
<script>
</script>
</body>
</html>