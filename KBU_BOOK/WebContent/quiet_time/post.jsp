<%@ page contentType="text/html; charset=EUC-KR" %>

<% if (session.getAttribute("session_id") != null) {%>
<html>
<head>
    <title>������ �ۼ�</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <script>
        function postCheck() {
            var mem_name = document.getElementById("mem_name");
            var title = document.getElementById("title");
            var content = document.getElementById("content");
            var pass = document.getElementById("pass");

            if (mem_name.value.trim() === "") {
                alert("�̸��� �Է��ϼ���");
                return false;
            }
            if (title.value.trim() === "") {
                alert("������ �Է��ϼ���");
                return false;
            }
            if (content.value.trim() === "") {
                alert("������ �Է��ϼ���");
                return false;
            }
            if (pass.value.trim() === "") {
                alert("��й�ȣ�� �Է��ϼ���");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div align="center">
    <br/>
    <br/>
    <table style="width: 960; cellpadding: 3;">
        <tr>
            <td bgcolor="e9e9e9" height="25" align="center">������ �ۼ�</td>
        </tr>
    </table>
    <br/>
    <form name="postFrm" method="post" action="../quiet_time/postProc.jsp" onsubmit="return postCheck();">
        <table style="width: 960; cellpadding: 3; align: center">
            <tr>
                <td align=center>
                    <table style="width: 960; cellpadding: 3; align: center">
                        <tr>
                            <td width="10%">�� ��</td>
                            <td width="90%"><input id="mem_name" name="mem_name" size="10"
                                                   maxlength="8"></td>
                        </tr>
                        <tr>
                            <td>�� ��</td>
                            <td><input id="title" name="title" size="50" maxlength="30"></td>
                        </tr>
                        <tr>
                            <td>�� ��</td>
                            <td><textarea id="content" name="content" rows="10" cols="50"></textarea></td>
                        </tr>
                        <tr>
                            <td>��� ��ȣ</td>
                            <td><input type="password" id="pass" name="pass" size="15"
                                       maxlength="15"></td>
                        </tr>

                        <tr>
                            <td colspan="2"><input type="submit" value="���"> <input
                                    type="reset" value="�ٽþ���"> <input type="button"
                                                                      value="����Ʈ"
                                                                      onClick="javascript:location.href='../quiet_time/list.jsp'">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
    </form>
</div>
</body>
</html>

<%} else {
    out.print("<script>alert('�α����� ���ּ���.'); location.href='../index.jsp';</script>");
}%>