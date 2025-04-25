<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 Class.forName("oracle.jdbc.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
 String sql = "UPDATE product_tbl SET productname = ?, productprice = ?, producttype = ?, productstock = ? WHERE productno = ?";
 PreparedStatement s = con.prepareStatement(sql);
 s.setString(1, request.getParameter("name"));
 s.setString(2, request.getParameter("price"));
 s.setString(3, request.getParameter("category"));
 s.setString(4, request.getParameter("count"));
 s.setString(5, request.getParameter("no"));
 s.executeUpdate();
 %>

<script>
alert("상품정보가 수정되었습니다.")
location.href="ss.jsp?no=<%=request.getParameter("no")%>";
</script>
</body>
</html>