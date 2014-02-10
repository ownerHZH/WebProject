<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <style type="text/css">
     *{margin: 0;padding: 0;}
     html,body,table{height: 100%;}
     iframe{width:100%;}
  </style>
  
  <body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0"  marginwidth="0" marginheight="0">
    <table width="100%"> 
        <tr id="header">
            <td>
                <iframe src="/WEB-INF/pages/header.jsp" ></iframe>
            </td>
        </tr>
        <tr id="menu_body">
            <td id="menu" width="30%">
                <iframe src="/WEB-INF/pages/menu.jsp"></iframe>
            </td>
            <td id="body" width="70%">
                <iframe src="/WEB-INF/pages/body.jsp"></iframe>
            </td>
        </tr>
        <tr id="footer">
            <td >
                <iframe src="/WEB-INF/pages/footer.jsp"></iframe>
            </td>
        </tr>
    </table>
  </body>
</html>
