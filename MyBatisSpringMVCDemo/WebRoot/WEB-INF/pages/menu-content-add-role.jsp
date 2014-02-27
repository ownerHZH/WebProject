<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'content.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script type="text/javascript">
       $(document).ready(function(){
          $("#submit").click(function(){
              $.ajax({
				   type: "POST",
				   url: "addRole.html",
				   data: {
				            role_name:$("#role_name").val(),
				            role_comment:$("#role_comment").val()
				         },
				   success: function(msg,status){
				     if(status=="success"&&msg=="true")
				     {
				        alert("数据添加成功");
				        $("#role_name").val("");
				        $("#role_comment").val("");
				     }
				   }
				});
          });
       });
    </script>
  </head>
  
  <body>

    <div id="content_1_1" class="item_content">
	          <div>添加角色</div>
	       <div>
	       
	          <div>
	             角色名：
	             <input type="text" name="role_name" id="role_name" />
	          </div>
	          
	          <div>
	              备注：
	              <input type="text"  name="role_comment" id="role_comment" />
	          </div>
	          
	          <div><input type="button" value="提交" id="submit" /></div>
	          
	       </div>
       </div>
       
  </body>
</html>
