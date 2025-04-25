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
 String sql = "insert into product_tbl VALUES (?, ?, ?, ?, ?)";
 PreparedStatement s = con.prepareStatement(sql);
 s.setString(1, request.getParameter("no"));
 s.setString(2, request.getParameter("name"));
 s.setString(3, request.getParameter("price"));
 s.setString(4, request.getParameter("category"));
 s.setString(5, request.getParameter("count"));
 s.executeUpdate();
 %>

<script>
alert("상품 등록이 완료되었습니다.")
location.href="sd.jsp";
</script>
</body>
</html>