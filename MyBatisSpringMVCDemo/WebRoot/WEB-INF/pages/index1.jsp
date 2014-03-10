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
window.onload=function(){
   creatMenuLi();   
}

function creatMenuLi()
{
    var iframe=document.getElementById("content_iframe");
    var ul=document.getElementById("menuul");
    <c:forEach items="${menuList}" var="menu">      
       var li= document.createElement("li");
       var t=document.createTextNode("${menu.menu_level_one_name}");
       //li.id="${menu.mapping_page}";
       li.onclick=function(){
           iframe.src="${menu.mapping_page}";
       };
       li.appendChild(t);
       ul.appendChild(li);
    </c:forEach>
}
</script>

<!-- <link rel=stylesheet href="css/index1.css" type="text/css"> -->
<style type="text/css" >
   body{ height:100%; width:100%; margin:0px; border:0px; overflow:hidden;}
   .header{ height:14%; width:100%; margin:0px; border:1px; background-image: url(img/banner.gif); background-repeat:no-repeat; background-position:center;}
   .footer{width:100%; background-color:#cccccc; text-align:center;}
   .menu{width:100%;  height: 7%; background-color:#990;}
   .menu ul{list-style:none;}
   .menu li{ font-size:24px; font-weight:bold; margin:10px; float:left; cursor:pointer;}
   .body{ height:74%; width:100%; background-color:#933;}
   .content_iframe{ width:100%; height:100%;overflow:auto;}
</style>
</head>

<body>
   <div id="header" class="header"></div>
   <div id="menu" class="menu">
     <ul id='menuul'>
        
     </ul>
    </div> 
    
    <div id="body" class="body">
        <iframe id="content_iframe" class="content_iframe" marginheight="0" marginwidth="0" hspace="0" vspace="0" frameborder="0" src="content.html"></iframe>
    </div> 
     
   <div id="footer" class="footer">@copyright 2014 auther:owner</div>
</body>
</html>