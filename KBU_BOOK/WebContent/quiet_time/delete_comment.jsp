<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="rMgr" class="quiet_time.Quiet_time_CommentMgr"/>
<html>
<head>
    <title>JSP Board</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <%
        request.setCharacterEncoding("EUC-KR");
        String nowPage = request.getParameter("nowPage");
        int num = Integer.parseInt(request.getParameter("num"));
        int idx = Integer.parseInt(request.getParameter("idx"));
        if
        (request.getParameter
                ("pass") != null) {
            String inPass = request.getParameter
                    ("pass");
            boolean delete_ok = rMgr.deleteReply
                    (idx, num, inPass);
            if
            (delete_ok) {
                String url = "read.jsp?num=" + num + "&nowPage=" + nowPage;
                response.sendRedirect
                        (url);
            } else {
    %>
    <script type="text/javascript">
        alert(
            "�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
        history.back();
    </script>
    <%
        }
    } else {
    %>
    <script type="text/javascript">
        function check() {
            if
            (document.delFrm.pass.value == "") {
                alert(
                    "�н����带 �Է��ϼ���.");
                document.delFrm.pass.focus();
                return false
                    ;
            }
            document.delFrm.submit();
        }
    </script>
</head>
<body>
<div align="center">
    <br/> <br/>
    <table style="width: 960; cellpadding: 3">
        <tr>
            <td bgcolor=#dddddd height="21" align="center">������� ��й�ȣ�� �Է����ּ��� .
            </td>
        </tr>
    </table>
    <form name="delFrm" method="post" action="../quiet_time/delete_comment.jsp">
        <table style="width: 960; cellpadding: 2">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td align="center"><input type="password" name="pass"
                                                      size="17" maxlength="15"></td>
                        </tr>
                        <tr>
                            <td>
                                <hr size="1" color="#eeeeee"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="center"><input type="button" value="�����Ϸ�"
                                                      onClick="check()"> <input type="reset" value="�ٽþ���">
                                <input type="button" value="�ڷ�" onClick="history.go(-1)">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input type="hidden" name="nowPage" value="<%=nowPage%>">
        <input type="hidden" name="idx" value="<%=idx%>">
        <input type="hidden" name="num" value="<%=num%>">
    </form>
</div>
<%
    }%>
</body>
</html>