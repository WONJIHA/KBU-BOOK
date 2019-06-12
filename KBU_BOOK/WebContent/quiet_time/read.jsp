<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="quiet_time.Quiet_time"%>
<%@page import="java.sql.Timestamp"%>
<jsp:useBean id="bMgr" class="quiet_time.Quiet_timeMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(num);//��ȸ�� ����
	Quiet_time bean = bMgr.getBoard(num);//�Խù� ��������
	String name = bean.getMem_name();
	String title = bean.getTitle();
	Timestamp reg_date = bean.getReg_date();
	String content = bean.getContent();
	String ip = bean.getIp();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css
">
<script type="text/javascript
">
function list() {
document.listFrm.submit();
}
</script>
</head>
<body>
	<div align="center">
		<br /> <br />
		<table style="width: 960; cellpadding: 3;">
			<tr>
				<td style="background-color: #e9e9e9; height: 30px;" align="center">���б�</td>
			</tr>
			<tr>
				<td colspan="2">
					<table style="cellpadding: 3; cellspacing: 0; width: 100%">
						<tr>
							<td align="center" bgcolor="#DDDDDD" width="10%">�� ��</td>
							<td><%=name%></td>
							<td align="center" bgcolor="#DDDDDD" width="10%">��ϳ�¥</td>
							<td><%=reg_date%></td>
						</tr>
						<tr>
							<td align="center" bgcolor="#DDDDDD">�� ��</td>
							<td colspan="3"><%=title%></td>
						</tr>
						<tr>
							<td colspan="4"><br /> <pre><%=content%></pre><br /></td>
						</tr>
						<tr>
							<td colspan="4" align="right"><%=ip%>�� ���� ���� ����̽��ϴ�./ ��ȸ�� <%=count%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<hr />
					<hr /> [ <a href="javascript:list()">����Ʈ</a> | <a
					href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> | <a
					href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> ]<br />
				</td>
			</tr>
		</table>
		<form name="listFrm" method="post" action="list.jsp">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<%
				if (!(keyWord == null || keyWord.equals(""))) {
			%>
			<input type="hidden" name="keyField" value="<%=keyField%>"> <input
				type="hidden" name="keyWord" value="<%=keyWord%>">
			<%
				}
			%>
		</form>
	</div>
	
	<!-- ���  -->
	
	<tr>
<td align="center" colspan="2">
<hr /> [ <a href="javascript:list()">����Ʈ</a> | <a
href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> | <a
href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">�� ��</a> ]<br />
</td>
</tr>
<tr>
<td><hr />
<form action="replyProc.jsp" method="post">
<table style="width: 960; cellpadding: 4; align: center">
<tr>
<td width="20%">�� ��</td>
<td width="30%"><input type="text" name="name" size="10"
maxlength="8"></td>
<td width="20%">��й�ȣ</td>
<td width="30%"><input type="password" name="pass"
size="50" maxlength="30"></td>
</tr>
<tr>
<td width="20%">�� ��</td>
<td colspan="3" width="50%"><textarea name="content"
rows="3" cols="100"></textarea></td>
<td width="30%"><input type="submit" value="����"></td>
</tr>
</table>
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
<%
if (!(keyWord == null || keyWord.equals(""))) {%>
<input type="hidden" name="keyField" value="<%=keyField%>">
<input type="hidden" name="keyWord" value="<%=keyWord%>">
<%}%>
</form></td>
</tr>
<tr>
<td><hr /> <jsp:include page="commentlist.jsp" /></td>
</tr>
</table>

	<!-- ���  -->
	
</body>
</html>