<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
    System.out.println("path="+path);
    System.out.println("basePath="+basePath);
    %>   
    <base href="<%=basePath%>" >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改用户信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
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

</script>

</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="userInfoList">用户管理</a></li>
    <li><a href="user/userInfoUpdate.jsp">修改</a></li>
    </ul>
    </div>
    <font color="green">${message }</font>
    <form action="updateUser" method="post">
    <div class="formbody">
    <div class="formtitle"><span>用户基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>用户编号</label><input name="userId" type="text" class="dfinput" value="${User.userId }"/><i>编号不允许修改</i></li>
    <li><label>姓名</label><input name="username" type="text" class="dfinput" value="${User.username}"/></li>
    <li><label>性别</label><cite>
      <input name="sex" type="radio" value="M" <c:if test="${'M' eq User.sex }">checked="checked"</c:if> />男&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="sex" type="radio" value="F" <c:if test="${'F' eq User.sex }">checked="checked" </c:if> />女</cite></li>
    <li><label>出生日期</label><input name="birthDay" type="text" class="dfinput" value="${User.birthDay }"/></li>
    <li><label>角色</label><cite><select class="dfselect" name="roleId">
     <option value="0">请选择</option>
     <option value="1" <c:if test="${'1' eq User.roleId }">selected </c:if>>管理员</option>
     <option value="2" <c:if test="${'2' eq User.roleId }">selected </c:if>>客户经理</option>
           </select></cite></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>
</html>