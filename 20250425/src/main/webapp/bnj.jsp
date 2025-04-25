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
<h2>판매 내역 조회</h2>
<form>
<table border="black">
<tr>
<td><b>판매일자</b></td>
<td><b>판매시각</b></td>
<td><b>직원이름</b></td>
<td><b>상품이름</b></td>
<td><b>판매수량</b></td>
<td><b>판매금액</b></td>
</tr>
<%
 PreparedStatement s = con.prepareStatement("select to_char(s.selldate, 'yyyy-MM-dd'), s.selltime, e.empname, p.productname, s.sellcount, s.sellcount * p.productprice from emp_tbl e, product_tbl p, sell_tbl s WHERE e.empno = s.empno AND s.productno = p.productno");
ResultSet r = s.executeQuery();
while(r.next()) {
%>
<tr>
<td><%= r.getString(1) %></td>
<td><%= r.getString(2) %></td>
<td><%= r.getString(3) %></td>
<td><%= r.getString(4) %></td>
<td><%= r.getString(5) %></td>
<td><%= NumberFormat.getInstance().format(r.getInt(6)) %></td>
</tr>
<% } %>
</table>
</form>
</section>
<script>
</script>
</body>
</html>