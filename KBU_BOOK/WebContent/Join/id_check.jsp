<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-28
  Time: ���� 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" language="java" %>
<jsp:useBean id="MemberDAO" class="kbu.MemberDAO" />
<% request.setCharacterEncoding("EUC-KR");%>

<%   String id = request.getParameter("id");
    boolean result = MemberDAO.checkId(id); %>
<style>
    @import "../css/style.css";
</style>
<link rel="stylesheet" href="../css/bootstrap.min.css"><!--��Ʈ��Ʈ�� css�� �ҷ���-->

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
        <input type="text" size="50" value="" placeholder="�ߺ�Ȯ�� ���ּ�." name="id" class="text-form" id="uid" required> <input type="submit" value="�ߺ�Ȯ��" onclick="checkid(this.check)" class="btn btn-warning">
    </form>
      <%  }else {
            out.println("�� ��� ������ ���̵� �Դϴ�!<p/>"); %>
    <input type="button" value="ID����ϱ�!" onclick="submit_id()" class="btn btn-warning">
    <%}%>

</div>
</body>
</html>
