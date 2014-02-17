<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统维护页面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
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
	</style>
	
	<script type="text/javascript">
	   window.onload=function(){
	   var menu=document.getElementById("menu");
	   var lis=menu.getElementsByTagName("li");
	   for( var i=0;i<lis.length;i++)
	   {
		    (function(x){
	            lis[x].onclick=function(){
					for(var j=0;j<lis.length;j++)
					{
						if(j!=x)
						{
							var d=document.getElementById("menu_li"+(j+1)+"_content");
					        d.style.display="none";
						}else
						{
							var div=document.getElementById("menu_li"+(j+1)+"_content");
					        div.style.display="block";
						}					
					}				
					};
	        })(i);
	   }
	   document.getElementById("menu_li1_content").style.display="block";
	};
	</script>
</head>

<body>   
<div id="menu" class="menu">
   <ul>
      <li>用户管理</li>
      <li>专业方向</li>
      <li>课程性质</li>
      <li>题型管理</li>
   </ul>
</div>
<br />
<div id="menu_li1_content" class="content">
   <div id="menu_li1_content_menu" class="content_menu">
      <ul>
          <li>添加角色</li>
          <li>角色权限设置</li>
          <li>教师用户导入</li>
          <li>学生用户导入</li>
          <li>添加/修改用户</li>
          <li>修改密码</li>
      </ul>
   </div>
   <div id="menu_li1_content_content"  class="content_content">
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
</div>

<div id="menu_li2_content" class="content">
   <div id="menu_li2_content_menu" class="content_menu">
      <ul>
          <li>添加方向</li>
          <li>浏览/修改方向</li>
      </ul>
   </div>
   <div id="menu_li2_content_content" class="content_content">
       <div>添加方向</div>
       <div>
       
          <div>
             方向名：
             <input type="text"  />
          </div>
          
          <div><input type="button" value="提交" /></div>
          
       </div>
   </div>
</div>

<div id="menu_li3_content" class="content">
   <div id="menu_li3_content_menu" class="content_menu">
      <ul>
          <li>添加性质</li>
          <li>浏览/修改性质</li>
      </ul>
   </div>
   <div id="menu_li3_content_content" class="content_content">
       <div>添加性质</div>
       <div>
       
          <div>
             课程性质名：
             <input type="text"  />
          </div>
          
          <div><input type="button" value="提交" /></div>
          
       </div>
   </div>
</div>

<div id="menu_li4_content" class="content">
   <div id="menu_li4_content_menu" class="content_menu">
      <ul>
          <li>添加题型</li>
          <li>浏览/修改题型</li>
      </ul>
   </div>
   <div id="menu_li4_content_content" class="content_content">
       <div>添加题型</div>
       <div>
       
          <div>
             题型名：
             <input type="text"  />
          </div>
          
          <div>
              标题描述：
              <input type="text"  />
          </div>
          
          <div>
          是否为客观题:<input type="radio" value="是" />是<input type="radio" value="否" />否
          </div>
          
          <div><input type="button" value="提交" /></div>
          
       </div>
   </div>
</div>

</body>
</html>
