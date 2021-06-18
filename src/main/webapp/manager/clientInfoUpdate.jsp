<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
    %>   
    <base href="<%=basePath%>" >
<title>客户信息的修改</title>
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
    <li><a href="clientInfoList">客户信息管理</a></li>
    <li><a href="clientInfoList">修改</a></li>
    </ul>
    </div>
    <font color="green">${message }</font>
    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>客户基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>客户姓名</label><input name="cName" type="text" class="dfinput" value="${Client.cName }"/><i>姓名不能超过8个字符</i></li>
    <li><label>身份证号</label><input name="cSsn" type="text" class="dfinput" value="${Client.cSsn }"/></li>
    <li><label>联系方式</label><input name="cTel" type="text" class="dfinput" value="${Client.cTel }"/></li>
    <li><label>年收入（万元）</label><input name="cSalary" type="text" class="dfinput" value="${Client.cSalary }"/></li>
    <li><label>资产（万元）</label><input name="cBalance" type="text" class="dfinput" value="${Client.cBalance }"/></li>
    <li><label>负债（万元）</label><input name="cDebt" type="text" class="dfinput" value="${Client.cDebt }"/></li>
    <li><label>所在单位</label><input name="cUnit" type="text" class="dfinput" value="${Client.cUnit }"/></li>
    <li><label>家庭住址</label><input name="cAdd" type="text" class="dfinput" value="${Client.cAdd }"/></li>
    <li><label>业务关联</label><input name="cBusiness" type="text" class="dfinput" value="${Client.cBusiness }"/></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>

</html>
