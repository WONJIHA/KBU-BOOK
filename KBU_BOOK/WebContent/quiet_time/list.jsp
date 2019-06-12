<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.Vector"%>
<%@page import="quiet_time.Quiet_time"%>
<%@page import="java.sql.Timestamp"%>
<jsp:useBean id="bMgr" class="quiet_time.Quiet_timeMgr" />
<%	
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0; //��ü���ڵ��
	int numPerPage = 10; // �������� ���ڵ� ��
	int pagePerBlock = 15; //���� ��������
	int totalPage = 0; //��ü ������ ��
	int totalBlock = 0; //��ü ����
	int nowPage = 1; // ����������
	int nowBlock = 1; //�����
	int start = 0; //����� select ���۹�ȣ
	int end = 10; //���۹�ȣ�� ���� ������ select ����
	int listSize = 0; //���� �о�� �Խù��� ��
	String keyWord = "", keyField = "";
	Vector<Quiet_time> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null) {
		if (request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü��������
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ���
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
%>
<jsp:include page="../top.jsp"/>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(value) {
		document.readFrm.nowPage.value =
<%=pagePerBlock%>
	* (value - 1) + 1;
		document.readFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
</script>
</head>
<body>
	<div align="center">
		<br />
		<h2>�Խ���</h2>
		<br />
		<table style="align: center; width: 960;">
			<tr>
				<td>Total : <%=totalRecord%>Articles(<font color="red">
						<%=nowPage%>/<%=totalPage%>Pages</font>)</td>
			</tr>
		</table>
		<table style="width: 960; cellpadding: 3; align: center">
			<tr>
				<td align="center" colspan="2">
					<%
						vlist = bMgr.getBoardList(keyField, keyWord, start, end);
						listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
						if (vlist.isEmpty()) {
							out.println("��ϵ� �Խù��� �����ϴ�.");
						} else {
					%>
					<table
						style="width: 100%; cellpadding: 2; cellspacing: 0; align: center">
						<tr align="center" bgcolor="#e9e9e9" height="120%">
							<td width="10%">�� ȣ</td>
							<td width="50%">�� ��</td>
							<td width="15%">�� ��</td>
							<td width="15%">�� ¥</td>
							<td width="10%">��ȸ��</td>
						</tr>
						<%
							for (int i = 0; i < numPerPage; i++) {
									if (i == listSize)
										break;
									Quiet_time bean = vlist.get(i);
									int num = bean.getIdx();
									String name = bean.getMem_name();
									String title = bean.getTitle();
									Timestamp regdate = bean.getReg_date();
									int count = bean.getCount();
						%>
						<tr>
							<td align="center"><%=totalRecord - ((nowPage - 1) * numPerPage) - i%>
							</td>
							<td><a href="javascript:read('<%=num%>')"><%=title%></a></td>
							<td align="center"><%=name%></td>
							<td align="center"><%=regdate%></td>
							<td align="center"><%=count%></td>
						</tr>
						<%} //for%>
						</table> <%
 						} //if
 					%>
				</td>
			</tr>
			<tr>
				<td colspan="2"><br /> <br /></td>
			</tr>
			<tr>
				<td>
					<!-- ����¡ �� �� ó�� Start--> <%
 	int pageStart = (nowBlock - 1) * pagePerBlock + 1; //�ϴ� ������ ���۹�ȣ
 	int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
 	//�ϴ� ������ ����ȣ
 	if (totalPage != 0) {
 		if (nowBlock > 1) { %> 
 		<a href="javascript:block('<%=nowBlock - 1%>')">prev...</a> <%} %>&nbsp;
  		<%for (; pageStart < pageEnd; pageStart++) { %>
  		 <a href="javascript:pageing('<%=pageStart%>')"> 
  		 <%if (pageStart == nowPage) {%><font color="blue"> <%}%>
  		  [<%=pageStart%>] 
  		  <%if (pageStart == nowPage) {%></font> <%} %></a>
  		  <%} //for%>&nbsp;
  		   <%if (totalBlock > nowBlock) { %>
  		   <a href="javascript:block('<%=nowBlock + 1%>')">.....next</a> 
  		   <%} %>&nbsp; 
  		   <%}%>
  		    
  		    <!-- ����¡ �� �� ó�� End-->
				</td>
				<td align="right"><a href="post.jsp">[�۾���]</a>
				 <a	href="javascript:list()">[ó������]</a></td>
			</tr>
		</table>
		<hr width="960" />
		<form name="searchFrm" method="get" action="list.jsp">
			<table style="width: 960; cellpadding: 4; cellspacing: 0">
				<tr>
					<td align="center" valign="bottom"><select name="keyField"
						size="1">
							<option value="mem_name">�� ��</option>
							<option value="title">�� ��</option>
							<option value="content">�� ��</option>
					</select> <input size="16" name="keyWord"> <input type="button"
						value="ã��" onClick="javascript:check()"> <input
						type="hidden" name="nowPage" value="1"></td>
				</tr>
			</table>
		</form>
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true"> <input
				type="hidden" name="nowPage" value="1">
		</form>
		<form name="readFrm" method="get">
			<input type="hidden" name="num"> 
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			 <input type="hidden" name="keyField" value="<%=keyField%>">
			  <input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>
	</div>
</body>
</html>