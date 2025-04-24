<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DB"%>
<%@page import="java.sql.Connection"%>
<%
Connection conn = DB.get();
PreparedStatement stmt = conn.prepareStatement("UPDATE member_tbl_03 SET name = ?, gender = ? WHERE id = ?");
stmt.setString(1, request.getParameter("name"));
stmt.setString(2, request.getParameter("gender"));
stmt.setString(3, request.getParameter("id"));
stmt.executeUpdate();
response.sendRedirect("index.jsp");
%>