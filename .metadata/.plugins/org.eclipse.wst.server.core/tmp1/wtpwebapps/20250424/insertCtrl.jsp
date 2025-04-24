<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
	String sql = "insert into tbl_vaccresv_202108 values (?, ?, ?, ?, ?, ?)";
	PreparedStatement s = con.prepareStatement(sql);
	s.setString(1, request.getParameter("no"));
	s.setString(2, request.getParameter("jumin"));
	s.setString(3, request.getParameter("vcode"));
	s.setString(4, request.getParameter("hcode"));
	s.setString(5, request.getParameter("date"));
	s.setString(6, request.getParameter("time"));
	s.executeUpdate();
	
%>
<script>
alert("접종예약정보가 등록 되었습니다!");
location.href="select.jsp";
</script>