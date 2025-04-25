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
<h2>상품 등록</h2>
<form action="sdCtrl.jsp">
<table border="black">
<tr>
<td><b>상품번호</b></td>
<td><input name="no" id="no" /></td>
</tr>
<tr>
<td><b>상품이름</b></td>
<td><input name="name" id="name" /></td>
</tr>
<tr>
<td><b>상품가격</b></td>
<td><input name="price" id="price" /></td>
</tr>
<tr>
<td><b>상품분류</b></td>
<td><select name="category" id="category">
<option value="1">신발</option>
<option value="2">기능성 의류</option>
<option value="3">일반 의류</option>
</select></td>
</tr>
<tr>
<td><b>상품재고수량</b></td>
<td><input name="count" id="count" /></td>
</tr>
<tr>
<td colspan="2" style="margin: 0 auto; width: 100%"><button>등록</button><button id="a" type="button">조회</button></td>
</tr>
</table>
</form>
</section>
<script>
const $ = (s) => document.querySelector(s);
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