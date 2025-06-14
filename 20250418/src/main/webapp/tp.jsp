<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
padding: 0; margin: 0; text-decoration: none; 
}
	.c {
		display: flex; justify-content: center; align-items: center;
	}
	td {
	border: 1px solid black;
	}
</style>
</head>
<body>
<header style="height: 150px; background: gray; color: #fff; font-size: 50px;" class="c">(과정평가형 2020-05) 지역구의원투표 프로그램 ver 1.0</header>
<nav style="height: 50px; gap:10px; display: flex; align-items: center; background: black; color: #fff; font-size: 16px;">
<a style="color: #fff;" href="hb.jsp">후보조회</a>
<a style="color: #fff;" href="tp.jsp">투표하기</a>
<a style="color: #fff;" href="tpView.jsp">투표검수조회</a>
<a style="color: #fff;" href="hbRank.jsp">후보자등수</a>
<a style="color: #fff;" href="index.jsp">홈으로</a>

</nav>
<main style="min-height: calc(100vh - 300px); display: flex; flex-direction: column; align-items: center;">
<h1 style="padding: 50px;">투표하기</h1>
<form action="tbCtrl.jsp">
<table>
	<tr>
		<td>주민번호</td>
		<td><input name="jumin"/>예)0302083000001</td>
	</tr>
	<tr>
		<td>투표자명</td>
		<td><input name="name"/></td>
	</tr>
	<tr>
		<td>후보자명</td>
		<td>
		<select name="no">
		<option value="">후보선택</option>
		<%
		Connection c = DB.get();
		Statement s = c.createStatement();
		ResultSet rs = s.executeQuery("SELECT * FROM TBL_MEMBER_202005");
		while(rs.next()) {
		%>
		<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
		<% } %>
		</select>
		</td>
	</tr>
	<tr>
		<td>투표시간</td>
		<td><input name="time"/></td>
	</tr>
	<tr>
		<td>투표장소</td>
		<td><input name="loc"/></td>
	</tr>
	<tr>
		<td>후보자확인</td>
		<td style="display: flex;"><input type="radio" value="Y" name="yn"/><p>확인</p><input type="radio" value="N" name="yn"/><p>미확인</p></td>
	</tr>
	
</table>
	<tr>
		<button>투표하기</button>
		<button type="reset">다시쓰기</button>
	</tr>
</form>
</main>
<footer style="height: 100px; background: gray; color: #fff; font-size: 20px;" class="c">HRDKOREA Copyrightⓒ2020 All rights reserved. Human Resource Development Service of Korea</footer>
<script>
const $ = (s) => document.querySelector(s);
const $$ = (s) => document.querySelectorAll(s);
$("button[type=reset]").addEventListener("click", (e) => {
	const abc = confirm("정보를 지우고 처음부터 다시 입력합니다!");
	if(!abc) {
		e.preventDefault();
	} else {
		$("input[name=jumin]").focus();
	}
})
$("form").addEventListener("submit", (e) => {
	if($("input[name=jumin]").value == "") {
		alert("주민번호가 입력하지 않았습니다!");
		$("input[name=jumin]").focus();
		e.preventDefault();
	}
	else if($("input[name=name]").value == "") {
		alert("성명이 입력되지 않았습니다!");
		$("input[name=no]").focus();
		e.preventDefault();
	}
	else if($("select[name=no]").value == "") {
		alert("후보번호가 선탹되지 않았습니다!");
		$("input[name=no]").focus();
		e.preventDefault();
	}
	else if($("input[name=time]").value == "") {
		alert("투표시간이 입력되지 않았습니다!");
		$("input[name=time]").focus();
		
		e.preventDefault();
	}
	else if($("input[name=loc]").value == "") {
		alert("투표장소가 입력되지 않았습니다!");
		$("input[name=loc]").focus();
		e.preventDefault();
	}
	else {
	let is = true;
	$$("input[name=yn]").forEach(el=>{
		console.log()
		if(el.checked) {
			is = false;
		};
	});
		if(is) {
			
		e.preventDefault();
		alert("유권자확인이 선택되지 않았습니다!");
		return;
		}
		$("input[name=time]").value=$("input[name=time]").value.substring(0, 2)+$("input[name=time]").value.substring(3, 5);
	}
	
	
});
</script>
</body>
</html>