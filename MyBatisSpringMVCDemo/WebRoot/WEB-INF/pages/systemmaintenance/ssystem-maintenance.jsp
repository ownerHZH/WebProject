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
        //firstUlLi 树结构菜单的根节点对象   firstLi 树结构菜单根节点的第一个子菜单项对象
        var firstUlLi=null,firstLi=null;
		$(document).ready(function() {
		    //动态生成树结构菜单
			creatMenuLi();
			//Jquery TreeView控件的初始化
			$("#tree").treeview({
				collapsed : true,
				animated : "medium",
				persist : "location",
				unique:true
			});
			//初始时让树结构菜单的第一项展开
			$(firstUlLi).children().eq(0).click();	
			//初始时让树结构菜单的第一项的的子菜单执行点击事件
			$(firstLi).click();
		});

        /**
        *动态生成树结构菜单函数
        *Jquery树结构如下：
        * <ul> -->跟节点
             <li><a>menuName</a>
                <ul>
                   <li>item1</li>
                   <li>item2</li>
                   <li>item3</li>
                </ul>
             </li>
          </ul> 
        **/
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
			if("${status1.count}"=="1"&&"${status2.count}"=="1")
	        {
	           firstLi=twoli;
	        }			
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
   </ul>
</div>

<div class="content"> 
    <iframe id="iframe" class="iframe_content" marginheight="0" marginwidth="0" hspace="0" vspace="0" frameborder="0"></iframe> 
</div>

</body>
</html>
