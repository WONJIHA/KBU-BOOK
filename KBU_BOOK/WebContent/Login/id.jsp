<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-06-01
  Time: ���� 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="kbu.MemberDAO" %>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR" language="java" %>
<jsp:useBean id="MemberDAO" class="kbu.MemberDAO" />
<% request.setCharacterEncoding("EUC-KR");%>

<%  String std_id = request.getParameter("std_id");
    String email = request.getParameter("email");
    kbu.MemberDAO dao = kbu.MemberDAO.getInstance();
    String ID = dao.se_id(std_id, email);
    %>
<html>
<link rel="stylesheet" href="../css/bootstrap.min.css"><!--��Ʈ��Ʈ�� css�� �ҷ���-->

<style>
    @import "../css/style.css";
    body{background-color: rgba(243,206,90,0.53);}
</style>
<head>
    <title>KBUBOOK SEARCH ID</title>
</head>
<body>
<div align="center">
    <serach>���̵� & ��й�ȣ ã��</serach>
    <hr></hr>
<% if(ID!= null){%>
    <b><%=std_id%></b>���� ���̵�� <id> <%=ID%> </id>�Դϴ�! <br>��й�ȣ�� �����ڿ��� ���� �Ͻʽÿ�. </br>
    <p><input type="button" value="�ݱ�" name="exit" onclick="window.close()" class="btn btn-danger"></p> <%} else
    {%>
    <b> <%= std_id%></b>���� �Ƶ��� �����ϴ�! �ٽ� ã�ų�, ȸ�������� �ϼ���.
    <p><input type="button" value="���̵� �ٽ�ã��" name="re" onclick="history.back()" class="btn btn-danger"></p><%
    } %>
</div>
</body>
</html>
