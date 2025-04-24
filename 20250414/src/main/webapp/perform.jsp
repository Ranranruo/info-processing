<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./style.css">
</head>
<body>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String pNumber = request.getParameter("p_number");
	String customerid = request.getParameter("customerid");
	String grade = request.getParameter("grade");
	String menucode1 = request.getParameter("menucode1");
	String menucode2 = request.getParameter("menucode2");
	String menucode3 = request.getParameter("menucode3");
	String visitdate = request.getParameter("visitdate");
	
	Connection conn = DBconnection.getConnection();
	PreparedStatement stmt = conn.prepareStatement("INSERT INTO tbl_performance VALUES (?, ?, ?, ?, ?, ?, ?)");
	stmt.setString(1, pNumber);
	stmt.setString(2, customerid);
	stmt.setString(3, grade);
	stmt.setString(4, menucode1);
	stmt.setString(5, menucode2);
	stmt.setString(6, menucode3);
	stmt.setString(7, visitdate);
	if(stmt.executeUpdate() > 0) {%>
	<script>
		alert("네일실적정보가 정상적으로 등록되었습니다!");
		location.href="sale.jsp";
	</script>
		<%
	} else {
		%>
		<script>
			alert("네일실적정보가 정상적으로 등록되지 않았습니다");
			location.href="sale.jsp";
		</script>
			<%
	}
%>
</body>
</html>