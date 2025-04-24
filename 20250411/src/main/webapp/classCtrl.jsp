<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBconnection"%>
<%
String classYm = request.getParameter("class_ym");
String meNo = request.getParameter("mem_no");
String classLoc = request.getParameter("class_loc");
int classPrice = Integer.parseInt(request.getParameter("class_price"));
String teacherCd = request.getParameter("teacher_cd");
System.out.println(teacherCd);

Connection conn = DBconnection.getConnection();
String sql = "INSERT INTO tbl_class_202305 VALUES (?, ?, ?, ?, ?)";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, classYm);
stmt.setString(2, meNo);
stmt.setString(3, classLoc);
if(meNo.substring(0, 1) == "2") {
	stmt.setInt(4, classPrice / 2);	
} else {
	stmt.setInt(4, classPrice);
}
stmt.setString(5, teacherCd);
int rs = stmt.executeUpdate();

if(rs > 0) {
	response.sendRedirect("addClass.jsp");
}else {
	response.sendRedirect("asdf.jsp");
}
%>
<script>
</script>