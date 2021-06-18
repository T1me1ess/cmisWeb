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

<title>客户经理详细信息展示</title>
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

//展示客户经理的详细信息
function getClientMgrDetail(id)
{ 
	
alert("id=="+id)
alert("进入展示页面");
window.location="<%=basePath%>showClientMgrDetail?cmId="+id;
}
</script>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 400	;
	});
	$(".select2").uedSelect({
		width : 167  
	});
	$(".select3").uedSelect({
		width : 100
	});
});
</script>
</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="clientMgrInfoList">客户经理信息综合管理维护</a></li>
    <li><a href="javascript:showClientMgrDetail(${clientMgr.cmId})">查看</a></li>
    </ul>
    </div>

    <form action="" method="post">
    <div class="formbody">
    <div class="formtitle"><span>客户经理基本信息</span></div>
    
    <ul class="forminfo">
    
    <li><label>员工号</label><cite>${clientMgr.cmId }</cite></li>
    <li><label>姓名</label><cite>${clientMgr.cmName }</cite></li>
    <li><label>性别</label><cite>
            <c:if test="${clientMgr.cmSex=='M' }">男</c:if>
            <c:if test="${clientMgr.cmSex=='F' }">女</c:if>
    </cite></li>
    
    <li><label>身份证号</label><cite>${clientMgr.cmSsn }</cite></li>
    <li><label>出生年月</label><cite>${clientMgr.cmBirthDay }</cite></li>
    <li><label>年龄</label><cite>${clientMgr.cmAge }</cite></li>
    <li><label>民族</label><cite>
    <c:forEach items="${nationParam }" var="nation">
      <c:if test="${nation.key eq clientMgr.cmNation}">
               ${nation.value}</c:if></c:forEach></cite></li>
    <li><label>政治面貌</label><cite>
    <c:forEach items="${policeParam }" var="polic">
      <c:if test="${polic.key eq clientMgr.cmPoli}">
               ${polic.value}</c:if></c:forEach></cite></li>     
    <li><label>籍贯</label><cite>${clientMgr.cmHome }</cite></li>
    <li><label>照片</label>
    <cite><img alt="图片不存在" src="<%=basePath %>images/upload/${clientMgr.cmPhoto}" style="width:100px;height:100px"></cite>
    </li>
    <li><label>学历</label><cite>
    <c:forEach items="${educationParam }" var="education">
      <c:if test="${education.key eq clientMgr.cmEducation}">
               ${education.value}
       </c:if>
     </c:forEach></cite></li> 
               
    <li><label>学位</label><cite>
    <c:forEach items="${degreeParam }" var="degree">
      <c:if test="${degree.key eq clientMgr.cmDegree}">
               ${degree.value}</c:if></c:forEach></cite></li>   
    <li><label>毕业院校及专业</label><cite>${clientMgr.cmGraduated }</cite></li>
    <li><label>专业技术职称</label><cite> 
    <c:forEach items="${proTitlesParam }" var="pro">
      <c:if test="${pro.key eq clientMgr.cmProTitles}">
               ${pro.value}</c:if></c:forEach>
    </cite></li>   
    <li><label>客户经理等级</label><cite>
    <c:forEach items="${levelParam }" var="level">
      <c:if test="${level.key eq clientMgr.cmLevel}">
               ${level.value}</c:if></c:forEach>
    </cite></li>   
		           
    <li><label>所在单位</label><cite>${clientMgr.cmUnit }</cite></li>
    <li><label>部门</label><cite>${clientMgr.cmDept }</cite></li>
    <li><label>职务</label><cite>${clientMgr.cmPosition }</cite></li>

    <li><label>业务条线</label><cite>
            <c:if test="${clientMgr.cmBusLines=='1' }">对公</c:if>
            <c:if test="${clientMgr.cmBusLines=='2' }">对个人</c:if> 
    </cite></li>
    <li><label>参加工作时间</label><cite>${clientMgr.cmHireDate }</cite></li>
    <li><label>入行时间</label><cite>${clientMgr.cmEntryDate }</cite></li>
    <li><label>从事金融工作年限</label><cite>${clientMgr.cmFiYear }</cite></li>
    <li><label>客户经理从业年限</label><cite>${clientMgr.cmWorkYear }</cite></li>
    <li><label>办公电话</label><cite>${clientMgr.cmTel }</cite></li>
    <li><label>手机</label><cite>${clientMgr.cmMobile }</cite></li>

    <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
    </ul>
    
    </div>
    </form>
</body>

</html>
