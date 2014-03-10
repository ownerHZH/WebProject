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
    <link rel="stylesheet" href=" <c:url value="css/jquery.treeview.css"/>" />
    
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <script src="js/jquery.cookie.js" type="text/javascript"></script>
    <script src="js/jquery.treeview.js" type="text/javascript"></script>
    <title>系统维护页面</title>
		
	<style type="text/css">
	   html body{ height:100%; width:100%;overflow:hidden;}
	   .menu{width:15%; height: 100%; float: left; background-color: #876; overflow: auto;} 
	   #tree li ul li{ cursor: pointer;}
	   .content { width:85%; height:100%; float: right; background-color: gray;}	  
	   .iframe_content{ width: 100%; height: 100%; overflow: auto;}
	</style>
	
	<script type="text/javascript">	 

        var firstUlLi=null;
		$(document).ready(function() {
			creatMenuLi();
			$("#tree").treeview({
				collapsed : true,
				animated : "medium",
				persist : "location",
				unique:true
			});
			$(firstUlLi).children().eq(0).click();	
		});

		function creatMenuLi() {
			var oneul = $("#tree");
			<c:forEach items="${menulist}" var="menu" varStatus="status1">				
			var oneli = $("<li></li>");
			if("${status1.count}"=="1")
	        {
	           firstUlLi=oneli;
	        }
			oneli.text("${menu.menu_level_two_name}");
			var twoul = $("<ul></ul>");
			<c:forEach items="${menu.menuLevelThreeList}" var="menu_two" varStatus="status2">
			var twoli = $("<li></li>");
			twoli.text("${menu_two.menu_level_three_name}");
			twoli.click(function() {
				$("#iframe").attr("src", "${menu_two.mapping_page}");
			});
			twoul.append(twoli);
			</c:forEach>
			oneli.append(twoul);
			oneul.append(oneli);
			</c:forEach>
		}
	</script>
</head>

<body>   
<div id="menu" class="menu">
   <ul id="tree">
      <!-- <li><a>用户管理</a>
          <ul>
	          <li>添加角色</li>
	          <li>角色权限设置</li>
	          <li>教师用户导入</li>
	          <li>学生用户导入</li>
	          <li>添加/修改用户</li>
	          <li>修改密码</li>
          </ul>
      </li>
      <li><a>专业方向</a>
         <ul>
	          <li>添加角色</li>
	          <li>角色权限设置</li>
	          <li>教师用户导入</li>
	          <li>学生用户导入</li>
	          <li>添加/修改用户</li>
	          <li>修改密码</li>
          </ul>
      </li>
      <li><a>课程性质</a>
          <ul>
	          <li>添加角色</li>
	          <li>角色权限设置</li>
	          <li>教师用户导入</li>
	          <li>学生用户导入</li>
	          <li>添加/修改用户</li>
	          <li>修改密码</li>
          </ul>
      </li>
      <li><a>题型管理</a>
          <ul>
	          <li>添加角色</li>
	          <li>角色权限设置</li>
	          <li>教师用户导入</li>
	          <li>学生用户导入</li>
	          <li>添加/修改用户</li>
	          <li>修改密码</li>
          </ul>
      </li> -->
   </ul>
</div>

<div class="content"> 
    <iframe id="iframe" class="iframe_content" marginheight="0" marginwidth="0" hspace="0" vspace="0" frameborder="0"></iframe> 
</div>

</body>
</html>
