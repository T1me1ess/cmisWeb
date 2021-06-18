<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>top</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
</head>
<body style="background:url(images/topbg.gif) repeat-x;">

    <div  class="topleft">
    <a href="main.html" target="_parent"><img src="images/logo.png" title="系统首页" /></a>
    </div>
    <div class="topright">    
    <ul>
    <li><span><img src="images/i07.png" title="论坛"  class="helpimg" height="16" width="16"/></span><a href="#">论坛</a></li>
    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><span><img src="images/i10.png" title="注销"  class="helpimg" height="16" width="16"/></span><a href="logout" target="_parent">注销</a></li>
    </ul>
     
    <div class="user">
    <span>欢迎${user.username }登录！</span>
    </div>   
    </div>

</body>
</html>