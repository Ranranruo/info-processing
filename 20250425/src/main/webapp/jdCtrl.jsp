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
 String sql = "insert into emp_tbl VALUES (?, ?, ?, ?)";
 PreparedStatement s = con.prepareStatement(sql);
 s.setString(1, request.getParameter("no"));
 s.setString(2, request.getParameter("name"));
 s.setString(3, request.getParameter("tel"));
 s.setString(4, request.getParameter("date"));
 s.executeUpdate();
 %>

<script>
alert("직원 등록이 완료되었습니다.")
location.href="jd.jsp";
</script>
</body>
</html>