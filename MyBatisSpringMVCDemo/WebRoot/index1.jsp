<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script type="text/javascript">
window.onload=function(){
   var menu=document.getElementById("menu");
   var lis=document.getElementsByTagName("li");
   var iframe=document.getElementById("content_iframe");
   for( var i=0;i<lis.length;i++)
   {
	   lis.item(i).onclick=function(){
		   alert((i+1)%4);
		   iframe.src="WEB-INF/pages/content"+((i+1)%4)+".html";
		   }
   }
}
</script>

<style type="text/css">
   body{ height:100%; width:100%; margin:0px; border:0px; overflow:hidden;}
   .header{ height:15%; width:100%; margin:0px; border:1px; background-image: url(WEB-INF/pictures/banner.gif); background-repeat:no-repeat; background-position:center;}
   .menu_body{ height:75%; width:100%;}
   .footer{height:10%; width:100%; background-color:#00C; margin:0px; border:1px;}
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
         <iframe id="content_iframe" class="content_iframe" src="WEB-INF/pages/content.html"></iframe>
      </div>
      <div id="menu" class="menu">
         <ul>
            <li>系统维护</li>
            <li>专业介绍</li>
            <li>课程体系</li>
            <li>师资情况</li>
            <li>大纲</li>
            <li>课件</li>
            <li>教辅资料</li>
            <li>教学录相</li>
            <li>作业</li>
            <li>在线测试</li>
            <li>实战演练</li>
            <li>互动平台</li>
         </ul>
      </div>
   </div>
   <div id="footer" class="footer"></div>
</body>
</html>