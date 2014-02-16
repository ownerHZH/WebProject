window.onload=function(){
   creatMenuLi();

   var menu=document.getElementById("menu");
   var lis=menu.getElementsByTagName("li");
   var iframe=document.getElementById("content_iframe");
   for( var i=0;i<lis.length;i++)
   {
	    (function(x){
            lis[x].onclick=function(){
				var id=lis[x].id;
				iframe.src="pages/"+id+".html";
				}
        })(i);
   }
   
}
