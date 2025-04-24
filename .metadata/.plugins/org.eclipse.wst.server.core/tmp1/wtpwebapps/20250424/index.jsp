<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
<style>
* {padding:0; margin: 0; text-decoration: none; color: inherit;}
.c { display: flex; justify-content: center; align-items: center;}
</style>
</head>
<body>
<header class="c" style="background-color: gray; color: #000; font-weight: bold; font-size: 50px; height: 100px;">(과정평가형 정보처리산업기사) 백신접종예약 프로그램 ver 2021-08</header>
<nav style="display: flex; padding: 10px; gap: 20px; background: #aaa; color: black; font-weight: bold; height:30px;">
<a href="insert.jsp">백신접종예약</a>
<a href="select.jsp">접종예약조회</a>
<a href="view.jsp">접종인원통계</a>
<a href="index.jsp">홈으로</a>
</nav>
<section style="min-height: calc(100vh - 200px);">
<h1 class="c" style="padding: 50px;">과정평가형 자격 CBQ</h1>
<p style="margin-bottom: 100px; font-size: 30px;">국가직무능력표준(NCS : National Competency Standards)으로 설계된 교육⦁훈련과
정을 체계적으로 이수하고 내⦁외부 평가를 거쳐 취득하는 국가기술자격입니다. 산업현장 중심의 교육평가로 더 커지는 능력!</p>
<b style="font-size: 30px;">산업현장 중심의 교육평가로 더 커지는 능력!<br>
알고 있는 것에 할 수 있는 것을 더하는<br>
과정평가형 자격은<br>
현장 중심형 인재육성을 지원 합니다.</b>
</section>
<footer class="c" style="background-color: black; color: #fff; font-weight: bold; font-size: 30px; height: 50px;">HRDKIREA Copyright @ 2021 All rights reserved. Human Resources Development Service of Korea</footer>
</body>
</html>