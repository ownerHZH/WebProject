<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript" src="js/index1.js"></script>
<script type="text/javascript">
function creatMenuLi()
{
    var ul=document.getElementById("menuul");
    <c:forEach items="${menuList}" var="menu">      
       var li= document.createElement("li");
       var t=document.createTextNode("${menu.menu_level_one_name}");
       li.id="${menu.mapping_page}";
       li.appendChild(t);
       ul.appendChild(li);
    </c:forEach>
}
</script>

<!-- <LINK REL=stylesheet HREF="css/index1.css" TYPE="text/css"> -->
<style type="text/css" >
   body{ height:100%; width:100%; margin:0px; border:0px; overflow:hidden;}
   .header{ height:15%; width:100%; margin:0px; border:1px; background-image: url(img/banner.gif); background-repeat:no-repeat; background-position:center;}
   .menu_body{ height:80%; width:100%;}
   .footer{height:5%; width:100%; background-color:#cccccc; margin:0px; border:1px; text-align:center; padding-top:0.5%;}
   .body{ height:100%; width:80%; background-color:#933; border:1px; margin:0px; float:left;}
   .menu{ height:100%; width:20%; background-color:#990; border:1px; margin:0px; float:right; overflow:auto;}
   .menu ul{ margin-top:10%; margin-left:20%;}
   .menu li{ font-size:24px; margin:10px; cursor:pointer;}
   .content_iframe{ width:100%; height:100%; border:0px; margin:0px; overflow:auto;}
</style>
</head>

<body>
   <div id="header" class="header"></div>
   <div id="menu_body" class="menu_body">
      <div id="body" class="body">
         <iframe id="content_iframe" class="content_iframe" src="pages/content.html"></iframe>
      </div>
      <div id="menu" class="menu">
         <ul id='menuul'>
            <!-- <li id="system_maintenance">系统维护</li>
            <li id="professional_introduction">专业介绍</li>
            <li id="curriculum_system">课程体系</li>
            <li id="teachers_qualification">师资情况</li>
            <li id="outline">大纲</li>
            <li id="courseware">课件</li>
            <li id="teaching_materials">教辅资料</li>
            <li id="teaching_video">教学录相</li>
            <li id="homework">作业</li>
            <li id="online_testing">在线测试</li>
            <li id="practicing">实战演练</li>
            <li id="interactive_platform">互动平台</li> -->
         </ul>
      </div>
   </div>
   <div id="footer" class="footer"> 
       @copyright 2014  auther:owner 
   </div>
</body>
</html>