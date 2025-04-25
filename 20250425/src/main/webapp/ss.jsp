<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<h1 style="width: 100%; display:flex; justify-content:center; margin: 0 auto; padding: 50px;">매장관리 프로그램 ver 1.0</h1>
</header>
<hr/>
<nav>
<a href="index.jsp">홈으로</a>
<a href="jd.jsp">직원 등록</a>
<a href="jj.jsp">직원 조회</a>
<a href="sd.jsp">상품 등록</a>
<a href="smj.jsp">상품 목록 조회</a>
<a href="pd.jsp">판매 등록</a>
<a href="bnj.jsp">판매 내역 조회</a>
<a href="jph.jsp">직원별 판매 현화</a>
</nav>
<hr/>
<section>
<%
PreparedStatement s = con.prepareStatement("SELECT * FROM product_tbl WHERE productno = ?");
s.setString(1, request.getParameter("no"));
ResultSet rs = s.executeQuery();
rs.next();
%>
<h2>상품 수정</h2>
<form action="ssCtrl.jsp">
<table border="black">
<tr>
<td><b>상품번호</b></td>
<td><input name="no" id="no" value="<%= rs.getString(1) %>" /></td>
</tr>
<tr>
<td><b>상품이름</b></td>
<td><input name="name" id="name" value="<%= rs.getString(2) %>" /></td>
</tr>
<tr>
<td><b>상품가격</b></td>
<td><input name="price" id="price"value="<%= rs.getString(3) %>" /></td>
</tr>
<tr>
<td><b>상품분류</b></td>
<input id="ab" value="<%= rs.getString(4) %>" hidden />
<td><select name="category" id="category">
<option id="i1" value="1">신발</option>
<option id="i2" value="2">기능성 의류</option>
<option id="i3" value="3">일반 의류</option>
</select></td>
</tr>
<tr>
<td><b>상품재고수량</b></td>
<td><input name="count" id="count" value="<%= rs.getString(5) %>" /></td>
</tr>
<tr>
<td colspan="2" style="margin: 0 auto; width: 100%"><button>수정</button><button id="a" type="button">조회</button></td>
</tr>
</table>
</form>
</section>
<script>
const $ = (s) => document.querySelector(s);
$("#i" + $("#ab").value).toggleAttribute("selected")
$("#a").addEventListener("click", () => {
	location.href="smj.jsp";
})
$("form").addEventListener("submit", (e)=> {
	if($("#no").value == ""){
		$("#no").focus();
		alert("모든 항목을 입력하세요");
		e.preventDefault();
	} else if($("#name").value == ""){
		$("#name").focus();
		alert("모든 항목을 입력하세요");
		e.preventDefault();
	} else if($("#price").value == ""){
		$("#price").focus();
		alert("모든 항목을 입력하세요");
		e.preventDefault();
	} else if($("#count").value == ""){
		$("#count").focus();
		alert("모든 항목을 입력하세요");
		e.preventDefault();
	}
})


</script>
</body>
</html>