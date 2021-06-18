<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
    %>   
    <base href="<%=basePath%>" >
<title>营销信息的增加</title>
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
    <li><a href="marketRecordInfoList">营销记录管理</a></li>
    <li><a href="manager/marketRecordAdd.jsp">添加</a></li>
    </ul>
    </div>
    <font color="green">${message }</font>
    <form action="addMarketRecord" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>营销记录</span></div>
  
    <c:if test="${flag!='1' }">
    <ul class="forminfo">
    <input type="hidden" name="cmId" value="${user.userId}">
    <li><label>客户姓名</label><input name="cName" type="text" class="dfinput" value=""/><i>姓名不能超过8个字符</i></li>
    <li><label>客户生产经营情况</label><textarea name="mrManagrment" cols="" rows="" class="textinput"></textarea></li>
    <li><label>客户需求</label><textarea name="mrDemend" cols="" rows="" class="textinput"></textarea></li>
    <li><label>客户拜访报告书</label><input name="report" type="file" class="dfinputfile"/> </li>
    <li><label>客户推荐表</label><input name="tes" type="file" class="dfinputfile"/> </li>
    <li><label>客户综合评价</label><input name="evalue" type="file" class="dfinputfile"/> </li>
    <li><label>拜访日期</label><input name="mrDate" type="text" class="dfinput" /></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    </c:if>
    <c:if test="${flag=='1' }">
    <ul class="forminfo">
    <li><label>客户姓名</label><input name="cName" type="text" class="dfinput" value="${addMR.cName }"/><i>姓名不能超过8个字符</i></li>
    <li><label>客户生产经营情况</label><textarea name="mrManagrment" cols="" rows="" class="textinput">${addMR.mrManagrment }</textarea></li>
    <li><label>客户需求</label><textarea name="mrDemend" cols="" rows="" class="textinput">${addMR.mrDemend }</textarea></li>
    <li><label>客户拜访报告书</label><a href="downLoadMRFile?fileName=${marketRecord.mrReport }">${addMR.mrReport }</a> </li>
    <li><label>客户推荐表</label><a href="downLoadMRFile?fileName=${marketRecord.mrTes }">${addMR.mrTes }</a>  </li>
    <li><label>客户综合评价</label><a href="downLoadMRFile?fileName=${marketRecord.mrEvalue }">${addMR.mrEvalue }</a>  </li>
    <li><label>拜访日期</label><input name="mrDate" type="text" class="dfinput" value="${addMR.mrDate }"/></li>
    </ul>
    </c:if>
    
    </div>
    </form>
    

</body>

</html>
