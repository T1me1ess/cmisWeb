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
<title>修改工作记录</title><link href="css/style.css" rel="stylesheet" type="text/css" />
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
    <li><a href="manager/workMgrUpdate.jsp">修改</a></li>
    </ul>
    </div>
    <font color="green">${message }</font>
    <form action="updateCMWork" method="post">
    <div class="formbody">
    <div class="formtitle"><span>工作记录</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="key" value="${updateWork.key }"/>
    <li><label>客户维护</label><textarea name="cmManagement" cols="" rows="" class="textinput">${updateWork.cmManagement }</textarea></li>
    <li><label>产品信息</label><textarea name="cmProduct" cols="" rows="" class="textinput">${updateWork.cmProduct }</textarea></li>
    <li><label>货后管理</label><textarea name="cmLoan" cols="" rows="" class="textinput">${updateWork.cmLoan }</textarea></li>
    <li><label>风险预警</label><textarea name="cmWarning" cols="" rows="" class="textinput">${updateWork.cmWarning }</textarea></li>
    <li><label>发现问题</label><textarea name="cmIssue" cols="" rows="" class="textinput">${updateWork.cmIssue }</textarea></li>
    <li><label>工作建议及感悟</label><textarea name="cmWorkProposal" cols="" rows="" class="textinput">${updateWork.cmWorkProposal }</textarea></li>
    <li><label>&nbsp;</label>
    <c:if test="${flag !='1' }">
    <input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </c:if>
    </ul>
    
    </div>
    </form>
    

</body>

</html>
