<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="quiet_time.Quiet_time"%>

<% if (session.getAttribute("session_id") != null) { %>
<%
int num = Integer.parseInt
(request.getParameter("num"));
String nowPage = request.getParameter("nowPage");
Quiet_time bean = (Quiet_time) session.getAttribute("bean");
String subject = bean.getTitle();
String name = bean.getMem_name();
String content = bean.getContent();
%><html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css
">
<script>
	function check() {
		if (document.updateFrm.pass.value == "") {
			alert("������ ���� �н����带 �Է��ϼ���.");
			document.updateFrm.pass.focus();
			return false;
		}
		document.updateFrm.submit();
	}
</script>
</head>
<body>
	<div align="center">
		<br /> <br />
		<table style="width: 960; cellpadding: 3;">
			<tr>
				<td bgcolor="#e9e9e9" height="21" align="center">�����ϱ�</td>
			</tr>
		</table>
		<form name="updateFrm" method="post" action="updateProc.jsp">
			<table style="width: 600; cellpadding: 7;">
				<tr>
					<td>
						<table>
							<tr>
								<td width="20%">�� ��</td>
								<td width="80%"><input name="name" value="<%=name%>"
									size="30" maxlength="20"></td>
							</tr>
							<tr>
								<td>�� ��</td>
								<td><input name="title" size="50" value="<%=subject%>"
									maxlength="50"></td>
							<tr>
								<td>�� ��</td>
								<td><textarea name="content" rows="10" cols="50"><%=content%></textarea>
								</td>
							</tr>
							<tr>
								<td>��� ��ȣ</td>
								<td><input type="password" name="pass" size="15"
									maxlength="15"><span style="color: red"> * ����
										�ÿ��� ��й�ȣ�� �ʿ��մϴ�.</span></td>
							</tr>
							<tr>
								<td colspan="2" height="5"><hr /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" value="�����Ϸ�"
									onClick="check()"> <input type="reset" value="�ٽü���">
									<input type="button" value="�ڷ�" onClick="history.go(-1)">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
				type='hidden' name="num" value="<%=num%>">
		</form>
	</div>
</body>
</html>
<%} else {
	out.print("<script>alert('�α����� ���ּ���.'); location.href='../index.jsp';</script>");
}%>