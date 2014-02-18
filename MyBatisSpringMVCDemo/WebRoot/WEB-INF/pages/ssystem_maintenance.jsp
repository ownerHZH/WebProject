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
    <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
    <title>系统维护页面</title>
		
	<style type="text/css">
	   html body{ height:100%; width:100%; margin:0px; border:0px; overflow:hidden;}
	   .menu{ border:0px; width:400px; right:0px; float:right; position:absolute;}
	   .menu ul{ margin:0px; list-style:none; width:100%; border:0px;}
	   .menu ul li{ margin:10px; float:left; cursor:pointer;}
	   
	   .content { width:100%; height:100%; margin:10px; border:1px;}
	   .content_menu{ float:left; width:20%; height:100%; cursor:pointer; background-color:#cc0;text-align:center;}
	   .content_menu ul{ list-style:none;}
	   .content_menu ul li{ margin:5px;}
	   .content_content { float:left; width:80%; height:100%; text-align:center; padding-top:15%; background-color:#990;}
	   .item_content{display: none;}
	</style>
	
	<script type="text/javascript">	 
	  
	$(document).ready(function(){
       creatMenuLi();
    });
	
	function creatMenuLi()
	{
	    var oneul=$("#menu_one_ul");
	    var firstUlLi=null,secondUlLi=null;
	    <c:forEach items="${menulist}" var="menu" varStatus="status1">      
	       var oneli= $("<li></li>");
	       if("${status1.count}"=="1")
	       {
	          firstUlLi=oneli;
	       }
	       oneli.text("${menu.menu_level_two_name}");
	       oneli.click(function(){
	           var twoul=$("#menu_two_ul");
	           twoul.empty();
	           <c:forEach items="${menu.menuLevelThreeList}" var="menu_two" varStatus="status2">
	              var twoli=$("<li></li>");
	              if("${status2.count}"=="1")
	              {
	                 secondUlLi=twoli;
	              }			      
	              twoli.text("${menu_two.menu_level_three_name}");
	              twoli.click(function(){
	                 $(".item_content").css("display","none");
	                 $("#content_${status1.count}_${status2.count}").css("display","block");
	              });
	              twoul.append(twoli);
	           </c:forEach>
	           secondUlLi.click();
	       });
	       oneul.append(oneli);	       
	    </c:forEach>
	    firstUlLi.click();	   
	}
	</script>
</head>

<body>   
<div id="menu" class="menu">
   <ul id="menu_one_ul">
      <!-- <li>用户管理</li>
      <li>专业方向</li>
      <li>课程性质</li>
      <li>题型管理</li> -->
   </ul>
</div>
<br />
<div class="content">
   <div class="content_menu">
      <ul id="menu_two_ul">
          <!-- <li>添加角色</li>
          <li>角色权限设置</li>
          <li>教师用户导入</li>
          <li>学生用户导入</li>
          <li>添加/修改用户</li>
          <li>修改密码</li> -->
      </ul>
   </div>
   <div id="menu_content"  class="content_content">
       <div id="content_1_1" class="item_content">
	          <div>添加角色</div>
	       <div>
	       
	          <div>
	             角色名：
	             <input type="text"  />
	          </div>
	          
	          <div>
	              备注：
	              <input type="text"  />
	          </div>
	          
	          <div><input type="button" value="提交" /></div>
	          
	       </div>
       </div>
       
       <div id="content_2_1" class="item_content">
	           <div>添加方向</div>
	       <div>
	       
	          <div>
	             方向名：
	             <input type="text"  />
	          </div>
	          
	          <div><input type="button" value="提交" /></div>
	          
	       </div>
       </div>
       
       <div id="content_3_1" class="item_content">
				<div>添加性质</div>
				<div>

					<div>
						课程性质名： <input type="text" />
					</div>

					<div>
						<input type="button" value="提交" />
					</div>

				</div>
		</div>
		
		<div id="content_4_1" class="item_content">
				<div>添加题型</div>
				<div>

					<div>
						题型名： <input type="text" />
					</div>

					<div>
						标题描述： <input type="text" />
					</div>

					<div>
						是否为客观题:<input type="radio" value="是" />是<input type="radio"
							value="否" />否
					</div>

					<div>
						<input type="button" value="提交" />
					</div>

				</div>
		</div>
       
   </div>
</div>

</body>
</html>
