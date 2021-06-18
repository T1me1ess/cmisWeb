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
<title>会议记录的增加</title>
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
    <li><a href="regularMeetInfoList">例会记录管理</a></li>
    <li><a href="manager/regularMeetingAdd.jsp">添加</a></li>
    </ul>
    </div>
    <font color="green">${message}</font>
    <form action="addRegularMeet" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>例会记录</span></div>
    <c:if test="${flag!='1' }">
    <ul class="forminfo">
    <input name="cmId" type="hidden" value="${user.userId}"/>
    <li><label>主题</label><input name="theme" type="text" class="dfinput" value=""/></li>
    <li><label>日期</label><input name="meetDate" type="text" class="dfinput" value=""/></li>
    <li><label>与会人员</label><textarea name="parties" cols="" rows="" class="textinput"></textarea></li>
    <li><label>附件</label><input name="upload" type="file" class="dfinputfile"/> </li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    </c:if>
    
    <c:if test="${flag =='1' }">
    <ul class="forminfo">
    <input name="cmId" type="hidden" value="${user.userId}"/>
    <li><label>主题</label><input name="theme" type="text" class="dfinput" value="${ addRegulaMeet.theme}"/></li>
    <li><label>日期</label><input name="meetDate" type="text" class="dfinput" value="${addRegulaMeet.meetDate }"/></li>
    <li><label>与会人员</label><textarea name="parties" cols="" rows="" class="textinput">${addRegulaMeet.parties }</textarea></li>
    <li><label>附件</label><a href="downLoadFile?fileName=${ addRegulaMeet.attachment }" class="tablelink">${addRegulaMeet.attachment }</a> </li>
    </ul>
    </c:if>
    </div>
    </form>
    

</body>

</html>
