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
<title>客户经理信息增加</title>
</head>
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
    <li><a href="clientMgrInfoList">客户经理信息综合管理维护</a></li>
    <li><a href="toMgrAdd">添加</a></li>
    </ul>
    </div>
<font color="green">${message }</font>
    <form action="addClientMgr" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>客户经理基本信息</span></div>
    
    <ul class="forminfo">
    <c:if test="${saveFlag=='1' }">
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value="${mgr.cmId }" readonly/> </li>
    </c:if>
    <li><label>姓名</label><input name="cmName" type="text" class="dfinput" value="${mgr.cmName }"/> </li>
    <li><label>性别</label><cite>
    <input name="cmSex" type="radio" value="M" <c:if test="${mgr.cmSex=='M'}">checked="checked"</c:if> />男&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="cmSex" type="radio" value="F" <c:if test="${mgr.cmSex=='F'}">checked="checked"</c:if>  />女</cite></li>
    <li><label>身份证号</label><input name="cmSsn" type="text" class="dfinput" value="${mgr.cmSsn}"/> </li>
    <li><label>出生年月</label><input name="cmBirthDay" type="text" class="dfinput"  value="${mgr.cmBirthDay}"/></li>
    <li><label>年龄</label><input name="cmAge" type="text" class="dfinput"  value="${mgr.cmAge}"/></li>
    <li><label>民族</label><cite>
    <select class="dfselect" name="cmNation">
    <option value="0">请选择</option>
    <c:forEach items="${nationParam}" var="nation">
    <option value="${nation.key}" <c:if test="${mgr.cmNation eq nation.key }">selected</c:if> >${nation.value}</option>
    </c:forEach>
    </select></cite></li>
    <li><label>政治面貌</label><cite>
    <select class="dfselect" name="cmPoli">
    <option value="0">请选择</option>
    <c:forEach items="${policeParam}" var="police">
    <option value="${police.key}" <c:if test="${mgr.cmPoli eq police.key }">selected</c:if>>${police.value}</option>
    </c:forEach>
    </select></cite></li>
    <li><label>籍贯</label><input name="cmHome" type="text" class="dfinput"  value="${mgr.cmHome }"/></li>
   <c:if test="${saveFlag!='1' }">
    <li><label>照片</label><input name="pic" type="file" class="dfselect1"/></li>
   </c:if>
   <c:if test="${saveFlag =='1' }">
    <li><label>照片</label><cite><img alt="图片不存在" src="<%=basePath %>images/upload/${mgr.cmPhoto}" style="width:100px;height:100px"></cite></li>
   </c:if>
    <li><label>学历</label><cite>
    <select class="dfselect1" name="cmEducation">
    <option value="0">请选择</option>
    <c:forEach items="${educationParam}" var="education">
    <option value="${education.key}" <c:if test="${mgr.cmEducation eq education.key }">selected</c:if> >${education.value}</option>
    </c:forEach>
    </select></cite></li>    
    <li><label>学位</label><cite>
    <select class="dfselect" name="cmDegree">
    <option value="0">请选择</option>
    <c:forEach items="${degreeParam}" var="degree">
    <option value="${degree.key}" <c:if test="${mgr.cmDegree eq degree.key }">selected</c:if> >${degree.value}</option>
    </c:forEach>
    </select></cite></li>    
    <li><label>毕业院校及专业</label><input name="cmGraduated" type="text" class="dfinput"  value="${mgr.cmGraduated }"/></li>
    <li><label>专业技术职称</label><div class="vocation">
				  <select class="dfselect1" name="cmProTitles">
		            <option value="0">请选择</option>
		            <c:forEach items="${proTitlesParam}" var="pro">
                    <option value="${pro.key}" <c:if test="${mgr.cmProTitles eq pro.key }">selected</c:if> >${pro.value}</option>
                    </c:forEach>
		           </select></div></li>
    <li><label>客户经理等级</label><cite>
                   <select class="dfselect1" name="cmLevel">
		            <option value="0">请选择</option>
		             <c:forEach items="${levelParam}" var="level">
                    <option value="${level.key}" <c:if test="${mgr.cmLevel eq level.key }">selected</c:if> >${level.value}</option>
                    </c:forEach>
		          </select></cite></li>
		           
    <li><label>所在单位</label><input name="cmUnit" type="text" class="dfinput"  value="${mgr.cmUnit }"/></li>
    <li><label>部门</label><input name="cmDept" type="text" class="dfinput"  value="${mgr.cmDept }"/></li>
    <li><label>职务</label><input name="cmPosition" type="text" class="dfinput"  value="${mgr.cmPosition }"/></li>

    <li><label>业务条线</label><cite>
    <select class="dfselect" name="cmBusLines">
    <option value="0">请选择</option>
    <option value="1" <c:if test="${mgr.cmBusLines=='1' }">selected</c:if>>对公</option>
    <option value="2" <c:if test="${mgr.cmBusLines=='2' }">selected</c:if>>对个人</option>
    </select></cite></li>
    
    <li><label>参加工作时间</label><input name="cmHireDate" type="text" class="dfinput"  value="${mgr.cmHireDate }"/></li>
    <li><label>入行时间</label><input name="cmEntryDate" type="text" class="dfinput"  value="${mgr.cmEntryDate }"/></li>
    <li><label>从事金融工作年限</label><input name="cmFiYear" type="text" class="dfinput"  value="${mgr.cmFiYear }"/></li>
    <li><label>客户经理从业年限</label><input name="cmWorkYear" type="text" class="dfinput"  value="${mgr.cmWorkYear }"/></li>
    <li><label>办公电话</label><input name="cmTel" type="text" class="dfinput"  value="${mgr.cmTel }"/></li>
    <li><label>手机</label><input name="cmMobile" type="text" class="dfinput"  value="${mgr.cmMobile }"/></li>
    <input type="hidden" name="cmModiPerson" value="${user.username }"/> 
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>

</html>
