<%@ page import="kbu.memberDAO" %><%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-06-01
  Time: ���� 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR" language="java" %>
<jsp:useBean id="memberDAO" class="kbu.memberDAO" />
<% request.setCharacterEncoding("EUC-KR");%>

<%  String std_id = request.getParameter("std_id");
    String email = request.getParameter("email");
    kbu.memberDAO dao = memberDAO.getInstance();
    String ID = dao.se_id(std_id, email);
    %>
<html>
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
    <b><%=std_id%></b>���� ���̵�� <id> <%=ID%> </id>�Դϴ�! <b>��й�ȣ�� �����ڿ��� ���� �Ͻʽÿ�. </b>
    <p><input type="button" value="�ݱ�" name="exit" onclick="window.close()"></p> <%} else
    {%>
    <b> <%= std_id%></b>���� �Ƶ��� �����ϴ�! �ٽ� ã�ų�, ȸ�������� �ϼ���.
    <p><input type="button" value="���̵� �ٽ�ã��" name="re" onclick="history.back()"></p><%
    } %>
</body>
</html>
