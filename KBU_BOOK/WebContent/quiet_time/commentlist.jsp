<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="quiet_time.Quiet_time_Comment"%>
<%@page import="java.sql.Timestamp"%>
<jsp:useBean id="rMgr" class="quiet_time.Quiet_time_CommentMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int board_idx = Integer.parseInt(request.getParameter("num"));
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	Vector<Quiet_time_Comment> vlist = null;
%>
<html>
<head>
<title>JSP Board</title>
</head>
<body>
	��۸��
	<div align="center">
		<table style="width: 960; cellpadding: 3; align: center;">
			<tr>
				<td align="center" colspan="2">
					<%
						vlist = rMgr.getReplyList(board_idx);
						if (vlist.isEmpty()) {
							out.println("����� �����ϴ�.");
						} else {
					%>
					<table border=1
						style="width: 100%; cellpadding: 2; cellspacing: 0; align: center; border-collapse: collapse">
						<tr align="center" bgcolor="#e9e9e9" height="120%">
							<td width="5%">�� ȣ</td>
							<td width="60%">����</td>
							<td width="15%">�� ��</td>
							<td width="17%">�� ¥</td>
							<td width="3%">����</td>
						</tr>
						<%
							for (int i = 0; i < vlist.size(); i++) {
									Quiet_time_Comment bean = vlist.get(i);
									int reply_idx = bean.getIdx();
									String name = bean.getName();
									String content = bean.getContent();
									Timestamp regdate = bean.getReg_date();
						%>
						<tr>
							<td align="center"><%=i + 1%></td>
							<td><pre><%=content%></pre></td>
							<td align="center"><%=name%></td>
							<td align="center"><%=regdate%></td>
							<td align="center"><a
								href="delete_reply.jsp?nowPage=<%=nowPage%>&num=<%=board_idx%>&idx=<%=reply_idx%>">x</a>
						</tr>
						<%
} //for
%>
					</table> <%
} //if
%>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>