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
<style>
    @import "../css/style.css";
</style>
<script>
    function submit_id() {
        opener.document.form.idcheck.value="check_id"; //���̵� �ߺ� Ȯ�� ����� ȸ������ �������� ���� ��.
        opener.document.form.id.value="<%=id%>";// �˾�â�� ���� ���̵� �Է��� �ڵ����� ȸ������ ������ ���̵� ���� �Էµ�.
        self.close();
    }
    function checkid() { //id�� Ȯ��
        var id = document.getElementById("uid").value;
        if ((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")) {
            alert("���̵�� �ѱ� �� Ư�����ڴ� ����� �� �����ϴ�!\n �ٽ� Ȯ���� �Է��� ���ֽñ� �ٶ��ϴ�!!");
            location.reload();
        }

    }

</script>
<html>
<head>
    <title>KBUBook_Join_Idcheck</title>
</head>
<body onload="document.check.id.focus();">
<div align="center">
    <br/><id><%=id%></id>
    <% if(result){
        out.println("�� �̹� ������� ���̵� �Դϴ�.<p/> ���ο� ���̵� �Է��ϼ���! <p/>"); %>

    <form name="check" method="post" action="id_check.jsp">
        <input type="text" size="50" value="" placeholder="�ߺ�Ȯ�� ���ּ�." name="id" class="text-form" id="uid" required> <input type="submit" value="�ߺ�Ȯ��" onclick="checkid(this.check)">
    </form>
      <%  }else {
            out.println("�� ��� ������ ���̵� �Դϴ�!<p/>"); %>
    <input type="button" value="ID����ϱ�!" onclick="submit_id()">
    <%}%>
    <br>id�ߺ��׽�Ʈ</br>

</div>
</body>
</html>
