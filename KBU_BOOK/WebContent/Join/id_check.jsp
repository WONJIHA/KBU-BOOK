<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-28
  Time: ���� 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=EUC-KR" language="java" %>
<jsp:useBean id="memberDAO" class="member.memberDAO" />
<% request.setCharacterEncoding("EUC-KR");%>

<%   String id = request.getParameter("id");
    boolean result = memberDAO.checkId(id); %>
���̵� Ȯ��: <%=result%>

<html>
<head>
    <title>KBUBook_Join_Idcheck</title>
</head>
<body>
<div align="center">
    <br/><b><%=id%></b>
    <% if(result){
        out.println("�� �̹� ������� ���̵� �Դϴ�. ���ο� ���̵� �Է��ϼ���! <p/>");}
        else {
            out.println("�� ��� ������ ���̵� �Դϴ�!<p/>");
    } %>
    id�ߺ��׽�Ʈ
    <a href="#" onclick="self.close()">�ݴ´�</a>
</div>
</body>
</html>
