<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB"%>
<%@page import="java.sql.Connection"%>
<%
Connection conn = DB.get();
PreparedStatement stmt = conn.prepareStatement("INSERT INTO member_tbl_03 VALUES (?, ?, ?)");
stmt.setString(1, request.getParameter("id"));
stmt.setString(2, request.getParameter("name"));
stmt.setString(3, request.getParameter("gender"));
stmt.executeUpdate();
response.sendRedirect("index.jsp");
%>