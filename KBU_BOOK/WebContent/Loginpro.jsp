<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-31
  Time: ���� 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=EUC-KR" pageEncoding="EUC-KR" language="java" %>
<%@ page import="kbu.memberDAO" %>
<% request.setCharacterEncoding("EUC-KR"); %>
<html>
<head>
    <title>KBUBook_LOGIN_PROCESSING</title>
</head>
<body>

<%
    // �α��� ȭ�鿡 �Էµ� ���̵�� ��й�ȣ�� �����´�
    String id= request.getParameter("id");
    String pwd = request.getParameter("pwd");

    // DB���� ���̵�, ��й�ȣ Ȯ��
    memberDAO mdo = memberDAO.getInstance();
    int check = mdo.checklogin(id, pwd);

    // �α��� ����� ���� �ش� �ּҷ� �̵�
     String url = "";

    if(check == 1)    // �α��� ����
    {
        // ���ǿ� ���� ���̵� ����
        session.setAttribute("session_id", id);
        url ="Main.jsp";
    }
    else if(check == 2 || check == 3) // ���̵�, ��й�ȣ�� ���� �ʰų� ���� ���̵� �Է��Ͽ�����
    {
        url = "index.jsp?msg=2";
    }
    response.sendRedirect(url); // sendRedirect(String URL) : �ش� URL�� �̵�, URL�ڿ� get��� ó�� �����͸� ���ް���
%>

�α����� �Դϴ�...

</body>
</html>
