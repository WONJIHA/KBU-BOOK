<%--
  Created by IntelliJ IDEA.
  User: HWJ
  Date: 2019-05-26
  Time: ���� 6:36
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>JDBC ����̹� �׽�Ʈ</title></head>
<body
><% Connection conn = null;
    Boolean connect = false;
    try {
        String jdbcUrl="jdbc:mysql://210.119.129.186:33306/kbu_book?serverTimezone=UTC";
        String dbId="dev";
        String dbPass="151517";
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
         connect=true; conn.close();
    }catch(Exception e){ e.printStackTrace();
    } if(connect==true){ out.print(" ����Ǿ����ϴ� ");
    }else { out.print(" ���ῡ �����Ͽ����ϴ�.");
    } %></body>
</html>
