<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.lang.*" %>

<% request.setCharacterEncoding("EUC-KR");
	String id= (String)session.getAttribute("session_id");
	String msg=request.getParameter("msg");
	if(msg!= null && msg.equals("2")){
		out.println("<script>alert('���̵� �Ǵ� ��й�ȣ�� Ȯ�� �Ͻʽÿ�!');</script>");

	}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>KBUBook</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/signin.css">
</head>
<body onload="document.Login.id.focus();">
	<header class="text-center">
		<h1><img src="img/Logo.png" width="1192" height="363" alt=""/></h1>
	</header>
	<br>
	<div class="container">
		<form class="form-signin" method="post" name="Login" action="Loginpro.jsp">
			<input class="form-control" type="text" placeholder="���̵� �Է��ϼ���!" name="id" required><br>
			<input class="form-control" type="password" placeholder="��й�ȣ�� �Է��ϼ���!" name="pwd" required><br>
			<input class="btn btn-lg btn-primary btn-block" type="submit" value="�α���" onclick="msg()">
		<br><a href="Join/Join.html"><p align="center">ȸ������<a> ���̵�&��й�ȣ ã�� </a></p><br>
		</form>
	</div>
	<br>
	<div class="text-center">

	</div>
</body>
</html>