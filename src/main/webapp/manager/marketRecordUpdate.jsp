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
<title>经营记录的修改</title>
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
    <li><a href="marketRecordInfoList">修改</a></li>
    </ul>
    </div>
    <font color="green">${message}</font>
    <form action="updateMarketRecord" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>营销记录</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="mrKey" value="${updateMR.mrKey}"/>
    <li><label>客户姓名</label><input name="cName" type="text" class="dfinput" value="${updateMR.cName }"/><i>姓名不能超过8个字符</i></li>
    <li><label>客户生产经营情况</label><textarea name="mrManagrment" cols="" rows="" class="textinput">${updateMR.mrManagrment }</textarea></li>
    <li><label>客户需求</label><textarea name="mrDemend" cols="" rows="" class="textinput">${updateMR.mrDemend }</textarea></li>
    <c:if test="${flag!='1' }">
    <li><label>客户拜访报告书</label><input name="report" type="file" class="dfinputfile"/>${updateMR.mrReport }</li>
    <li><label>客户推荐表</label><input name="tes" type="file" class="dfinputfile" value=""/>${updateMR.mrTes } </li>
    <li><label>客户综合评价</label><input name="evalue" type="file" class="dfinputfile" value=""/>${updateMR.mrEvalue } </li>
    <li><label>拜访日期</label><input name="mrDate" type="text" class="dfinput"  value="${updateMR.mrDate }"/></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    </c:if>
    <c:if test="${flag=='1'}">
    <li><label>客户拜访报告书</label><a href="downLoadMRFile?fileName=${updateMR.mrReport }">${updateMR.mrReport }</a> </li>
    <li><label>客户推荐表</label><a href="downLoadMRFile?fileName=${updateMR.mrTes }">${updateMR.mrTes }</a>  </li>
    <li><label>客户综合评价</label><a href="downLoadMRFile?fileName=${updateMR.mrEvalue }">${updateMR.mrEvalue }</a>  </li>
    </c:if>
  
    
    </div>
    </form>
    

</body>

</html>
