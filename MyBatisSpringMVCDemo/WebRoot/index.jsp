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
     html,body,table{height: 100%;overflow-x:hidden; }
     iframe{width:100%;}
  </style>
  
  <body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0"  marginwidth="0" marginheight="0">
    <table width="100%"> 
        <tr align="center" valign="middle" id="header" style="margin:0; marker-offset:0;">
            <td height="100%" colspan="2" rowspan="1" style="margin:0; marker-offset:0;">              
                <iframe id="iframe_header"  frameborder="0" onload="this.height=header.offsetHeight+5" scrolling="auto" src="/WEB-INF/pages/header.jsp"></iframe>
            </td>
        </tr>
      <tr id="menu_body">
            <td id="menu" width="30%">
                <iframe id="iframe_menu" frameborder="0" onload="this.height=menu_body.offsetHeight+5" scrolling="auto" src="/WEB-INF/pages/menu.jsp"></iframe>
            </td>
            <td id="body" width="70%">
                <iframe id="iframe_body" frameborder="0" onload="this.height=menu_body.offsetHeight+5" scrolling="auto" src="/WEB-INF/pages/body.jsp"></iframe>
            </td>
        </tr>
        <tr id="footer">
            <td colspan="2" >
                <iframe id="iframe_footer"  frameborder="0" onload="this.height=footer.offsetHeight+5" scrolling="auto" src="/WEB-INF/pages/footer.jsp"></iframe>
            </td>
        </tr>
    </table>
  </body>
</html>
