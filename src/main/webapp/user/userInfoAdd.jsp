<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户的增加</title>

  <%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
   
    %>   

   

    
     
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});

//校验用户是否已存在
function checkUser(){
	//获取增加用户的姓名
	var username_Val = $("#username").val();
	$.ajax({
		
		url:"<%=basePath%>checkUser",
		
		data : {
			"username" : username_Val
		},
		dataType : "json",
		//编码设置
		contentType : "application/json;charset=utf-8",
		success : function(data) {
			if (data.msg != null) {
				alert(data.msg);
				$("#username").val("");
				$("#username").focus();
			} 
		},
		error:function(){
			alert("后台服务器出错，请联系系统管理员！");
		}})
}

//其他的校对
function toValid(){
	

	//校验用户名的长度
	var account_val = $("#username").val();
	if(account_val !="" && (account_val.length >10 || account_val.length <=5)){
		alert("用户名的长度不在要求的6~50位之间，请重新输入！");
		return false;
	}
	//校验邮箱号码是否合法
		var mail = $("#email").val();
		var myReg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
		if (!myReg.test(mail)) {
			alert("非合法的邮箱号，请确认！");
			$("#email").focus();
	        return false;
	        }

}

</script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="<%=basePath%>userInfoList">用户管理</a></li>
    <li><a href="userInfoAdd.jsp">添加</a></li>
    </ul>
    </div>
    
    <!-- 第一次添加用户 -->
    
    <form action="<%=basePath %>userInfoAdd" method="post" onsubmit="return toValid()"  >
    <div class="formbody">
    <div class="formtitle"><span>用户基本信息</span></div>
    
    
    <c:if test= "${flag !='1' }">
    <ul class="forminfo">
    <li><label>姓名</label><input name="username" type="text" class="dfinput" vaue="" id="username" onchange="checkUser()"/></li>
    <li><label>密码</label><input name="password" type="password" class="dfinput" value=""/></li>
    <li><label>性别</label><cite><input name="sex" type="radio" value="M" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;<input name="sex" type="radio" value="F" />女</cite></li>
    <li><label>出生日期</label><input name="birthDay" type="text" class="dfinput" value=""/></li>
    <li><label>电子邮箱</label><input name="email" type="text" class="dfinput" value="" id="email"/></li>  
    <li><label>密保问题</label><input name="question" type="text" class="dfinput" value=""/></li> 
    <li><label>答案</label><input name="answer" type="text" class="dfinput" value=""/></li>
    <li><label>角色</label><cite><select class="dfselect" name="roleId"><option value=" ">请选择</option><option value="1" >管理员</option><option value="2">客户经理</option></select></cite></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    </c:if>
    
    
    <!-- 展示用户 -->
   <c:if test="${flag == '1' }">
   <font color="green">${success}</font>
    <ul class="forminfo">
    <li><label>姓名</label><input name="username" type="text" class="dfinput" value="${addUser.username }" readonly/></li>
    <li><label>密码</label><input name="password" type="password" class="dfinput" value="${addUser.password }" readonly/></li>
    <li><label>性别</label><cite>
      <input name="sex" type="radio" value="M"  <c:if test="${'M' eq addUser.sex }">checked="checked"</c:if> />男&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="sex" type="radio" value="F" <c:if test="${'F' eq addUser.sex }">checked="checked"</c:if> />女</cite></li>
    <li><label>邮箱</label><input name="email" type="text" class="dfinput" value="${addUser.email }" readonly/></li>
    <li><label>密保问题</label><input name="question" type="text" class="dfinput" value="${addUser.question }" readonly/></li>
    <li><label>答案</label><input name="question" type="text" class="dfinput" value="${addUser.question }" readonly/></li>
    <li><label>出生日期</label><input name="birthDay" type="text" class="dfinput" value="${addUser.birthDay }" readonly/></li>
    <li><label>角色</label><cite><select class="dfselect" name="roleId">
           <option value="1" <c:if test="${'1' eq addUser.roleId }">selected </c:if>>管理员</option>
           <option value="2" <c:if test="${'2' eq addUser.roleId }">selected </c:if>>客户经理</option>
         </select></cite></li>

      

    </ul>

    </c:if>


    </div>
    </form>
</body>
</html>