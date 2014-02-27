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
    
    <title>专业介绍页面</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <style type="text/css">
	   html body{ height:100%; width:100%; margin:0px; border:0px;overflow:hidden;}
	   .list{ margin:5px; width:25%; height:400px; float:left; border:0px; overflow:auto;}
	   .list ul{ list-style:none; overflow:auto;  padding-bottom:20%;}
	   .list ul li{ cursor: pointer;}
	   .describe{ width:70%; height:500px; padding-bottom:-50px; border:0px; float:right;}
	   iframe{ width: 100%; height: 100%;}
   </style>
   <script type="text/javascript" src="js/jquery-1.8.2.js"></script>
   <script type="text/javascript">	 
	  
	$(document).ready(function(){
       creatMenuLi();
    });
	
	function creatMenuLi()
	{
	    var ul=$("#major_list");
	    var firstUlLi=null;
	    <c:forEach items="${majors}" var="major" varStatus="status">      
	       var li= $("<li></li>");
	       if("${status.count}"=="1")
	       {
	          firstUlLi=li;
	       }
	       li.text("${major.major_name}");
	       li.click(function(){	           
	           $("#iframe").attr("src","${major.major_introduction}");
	       });
	       ul.append(li);	       
	    </c:forEach>
	    firstUlLi.click();	   
	}
	</script>
</head>

<body>
  <div id="professional_list" class="list">
     <ul id="major_list">
        <!--  <li>海洋科学</li>
         <li>力学</li>
         <li>农业工程</li>					
         <li>环境科学</li>
         <li>心理学</li>
         <li>统计学</li>
         <li>系统科学</li>	
         <li>地矿</li>
         <li>机械</li>
         <li>仪器仪表</li>
         <li>能源动力</li>
         <li>电气信息</li>	
         <li>土建</li>
         <li>测绘</li>
         <li>环境与安全</li>	
         <li>化工与制药</li>
         <li>交通运输</li>	
         <li>海洋工程</li>
         <li>航空航天</li>
         <li>武器</li>
         <li>工程力学</li>
         <li>生物工程	</li> 
         <li>公安技术</li>
         <li>材料科学	</li>
         <li>材料</li>
         <li> 水利</li>
         <li>航空航天</li>
         <li>武器</li>
         <li>工程力学</li>
         <li>生物工程	</li> 
         <li>公安技术</li>
         <li>材料科学	</li>
         <li>材料</li>
         <li> 水利</li>
         <li>工程力学</li>
         <li>生物工程	</li> 
         <li>公安技术</li>
         <li>材料科学	</li>
         <li>材料</li>
         <li> 水利</li> -->
     </ul>
  </div>
  <div id="describe" class="describe">
     <iframe id="iframe"></iframe>
  </div>
</body>
</html>
