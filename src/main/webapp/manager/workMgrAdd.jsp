<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
   
    %>   
    <base href="<%=basePath%>" >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>客户经理工作管理</title>
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
    <li><a href="cmworkInfoList">工作管理</a></li>
    <li><a href="manager/workMgrAdd.jsp">添加</a></li>
    </ul>
    </div>
    <font color="green">${message}</font>
    <form action="addCMWork" method="post">
    <div class="formbody">
    <div class="formtitle"><span>工作记录</span></div>
    <c:if test="${flag!='1' }">
    <ul class="forminfo">
    <input type="hodden" name="cmId" value="${user.userId}"/>
    <li><label>客户维护</label><textarea name="cmManagement" cols="" rows="" class="textinput"></textarea></li>
    <li><label>产品信息</label><textarea name="cmProduct" cols="" rows="" class="textinput"></textarea></li>
    <li><label>货后管理</label><textarea name="cmLoan" cols="" rows="" class="textinput"></textarea></li>
    <li><label>风险预警</label><textarea name="cmWarning" cols="" rows="" class="textinput"></textarea></li>
    <li><label>发现问题</label><textarea name="cmIssue" cols="" rows="" class="textinput"></textarea></li>
    <li><label>工作建议及感悟</label><textarea name="cmWorkProposal" cols="" rows="" class="textinput"></textarea></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul></c:if>
    
    <c:if test="${flag =='1' }">
    <ul class="forminfo">
    <li><label>客户维护</label><textarea name="cmManagement" cols="" rows="" class="textinput">${addCMWork.cmManagement }</textarea></li>
    <li><label>产品信息</label><textarea name="cmProduct" cols="" rows="" class="textinput" >${addCMWork.cmProduct }</textarea></li>
    <li><label>货后管理</label><textarea name="cmLoan" cols="" rows="" class="textinput" >${addCMWork.cmLoan }</textarea></li>
    <li><label>风险预警</label><textarea name="cmWarning" cols="" rows="" class="textinput" >${addCMWork.cmWarning }</textarea></li>
    <li><label>发现问题</label><textarea name="cmIssue" cols="" rows="" class="textinput">${addCMWork.cmIssue }</textarea></li>
    <li><label>工作建议及感悟</label><textarea name="cmWorkProposal" cols="" rows="" class="textinput" >${addCMWork.cmWorkProposal }</textarea></li>
    </ul></c:if>
    
    </div>
    </form>
    
</body>
</html>