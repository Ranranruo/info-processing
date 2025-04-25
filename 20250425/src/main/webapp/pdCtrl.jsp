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
 String sql = "insert into sell_tbl VALUES (?, ?, ?, ?, ?)";
 PreparedStatement s = con.prepareStatement(sql);
 s.setString(1, request.getParameter("emp"));
 s.setString(2, request.getParameter("product"));
 s.setString(3, request.getParameter("date"));
 s.setString(4, request.getParameter("time"));
 s.setString(5, request.getParameter("count"));
 s.executeUpdate();
 %>

<script>
alert("판매 정보 등록이 완료되었습니다.")
location.href="pd.jsp";
</script>
</body>
</html>