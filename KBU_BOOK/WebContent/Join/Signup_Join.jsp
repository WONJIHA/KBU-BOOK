<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-26
  Time: ���� 5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=EUC-KR" language="java" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("EUC-KR");%>
<style>
    @import "../css/style.css";
</style>
<%
    String std_id = request.getParameter("std_id"); /*�й�*/
    String id = request.getParameter("id"); /*���̵�*/
    String pwd= request.getParameter("pwd"); /*��й�ȣ*/
    String email = request.getParameter("email"); /*�б��̸���*/
    String email2 = request.getParameter("email2"); /*�б��̸�2*/
    String tel = request.getParameter("phone"); /*��ȭ��ȣ*/
    Timestamp join_date=new Timestamp(System.currentTimeMillis()); /*������*/

    Connection conn=null;
    PreparedStatement pstmt=null;
    String str="";
    try{ String jdbcUrl="jdbc:mysql://210.119.129.186:33306/kbu_book?serverTimezone=UTC";
        String dbId="dev";
        String dbPass="151517";
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        String sql= "insert into  member(std_id, id, pwd, email, tel, join_date) values (?,?,?,?,?,?)";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1,std_id);
        pstmt.setString(2,id);
        pstmt.setString(3, pwd);
        pstmt.setString(4, email+"@"+email2);
        pstmt.setString(5, tel);
        pstmt.setTimestamp(6, join_date);
        pstmt.executeUpdate();
        out.println("�����մϴ�! ȸ������ ���� �Դϴ�!"); %>
<hr class="hr"> <input type="button" value="Home" onClick="location.href='../index.jsp'">
<meta http-equiv="refresh" content="5; URL=../index.jsp"> <!--5���� ����Ȩ�������� �̵�-->
</hr>
  <%  }catch(Exception e){ e.printStackTrace();
    out.println("ȸ�����Կ� ���� �߽��ϴ�.");%>
<hr class="hr"> <input type="button" value="Back" onClick="history.back()"> </hr>
<%
    }finally{ if(pstmt != null) try{pstmt.close();
    }catch(SQLException sqle){} if(conn != null) try{conn.close();}catch(SQLException sqle){} } %>
<html>
<head>
    <title>KbuBook_Join_End</title>
</head>
<body>
<h1> ȸ������ ������ �׽�Ʈ ��</h1>
</body>
</html>
