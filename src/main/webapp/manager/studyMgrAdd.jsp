<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
    %>   
    <base href="<%=basePath%>" >
<title>添加学习资料</title>
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
    <li><a href="getStudyMgrList">学习园地管理</a></li>
    <li><a href="toStudyMgrAdd">添加</a></li>
    </ul>
    </div>
    
    <form action="addStudyMgr" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>学习园地资料管理</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="lUper" value="${user.username}"/>
    <li><label>资料名称</label><input name="lName" type="text" class="dfinput" value="${addST.lName}"/></li>
    <li><label>完全公开</label><cite>
    <input name="lLine" type="radio" value="T" <c:if test="${addST.lLine=='T'}">checked="checked"</c:if> />是&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="lLine" type="radio" value="F" <c:if test="${addST.lLine=='F'}">checked="checked"</c:if>/>否</cite></li>
    <li><label>资料类型</label><cite><select class="dfselect1" name="lType">
							<option value="">请选择</option>
							<option value="规章制度">规章制度</option>
							<option value="学习培训材料">学习培训材料</option>
							<option value="资格岗位考试教程">资格岗位考试教程</option>
							<option value="客户营销技巧">客户营销技巧</option>
								    </select></cite></li>
    <li><label>资料描述</label><textarea name="lDes" cols="" rows="" class="textinput">${addST.lDes}</textarea></li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfinputfile"/>${addSt.lUrl} </li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
    

</body>

</html>
