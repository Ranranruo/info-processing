<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = DB.get();
String sql = "INSERT INTO TBL_CAR_202504 VALUES ((SELECT MAX(CAR_ID) + 1 FROM TBL_CAR_202504), ?, ?, ?, 'N')";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setString(1, request.getParameter("car_name"));
stmt.setString(2, request.getParameter("buy_price"));
stmt.setString(3, request.getParameter("dealer_id"));
stmt.executeUpdate();
%>
<script>
alert("등록되었습니다.");
location.href="salesCar.jsp";
</script>
</body>
</html>