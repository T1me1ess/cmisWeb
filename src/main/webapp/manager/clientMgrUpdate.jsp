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
<title>客户经理信息修改</title>
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
	<style type="text/css">
		.input{width:260px; height:20px; line-height:32px; border-top:solid 1px #a7b5bc; border-left:solid 1px #a7b5bc; border-right:solid 1px #ced9df; border-bottom:solid 1px #ced9df; background:url(../images/inputbg.gif) repeat-x; text-indent:10px;}
		
	</style>

</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="clientMgrInfoList">客户经理信息综合管理维护</a></li>
    <li><a href="#">修改</a></li>
    </ul>
    </div>

    <form action="updateClientMgr" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>客户经理基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>员工号</label><input name="cmId" type="text" class="dfinput" value="${CM.cmId }" readonly="readonly"/><i>员工号不允许修改</i></li>
    <li><label>姓名</label><input name="cmName" type="text" class="dfinput" value="${CM.cmName}"/> </li>
    <li><label>性别</label><cite>
    <input name="cmSex" type="radio" value="M" <c:if test="${CM.cmSex=='M'}">checked="checked"</c:if> />男&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="cmSex" type="radio" value="F" <c:if test="${CM.cmSex=='F'}">checked="checked"</c:if> />女</cite></li>
    <li><label>身份证号</label><input name="cmSsn" type="text" class="dfinput" value="${CM.cmSsn}"/> </li>
    <li><label>出生年月</label><input name="cmBirthDay" type="text" class="dfinput"  value="${CM.cmBirthDay}"/></li>
    <li><label>年龄</label><input name="cmAge" type="text" class="dfinput"  value="${CM.cmAge}"/></li>
    <li><label>民族</label><cite>
    <select class="dfselect" name="cmNation">
    <option value="0">请选择</option>
    <c:forEach items="${nationParam}" var="nation"> 
    <option value="${nation.key}" <c:if test="${nation.key eq CM.cmNation }">selected="selected"</c:if> >${nation.value }</option>
    </c:forEach>
    </select></cite></li>
    <li><label>政治面貌</label><cite><select class="dfselect" name="cmPoli">
    <option value="0">请选择</option>
    <c:forEach items="${policeParam}" var="po"> 
    <option value="${po.key}" <c:if test="${po.key eq CM.cmPoli }">selected="selected"</c:if> >${po.value }</option>
    </c:forEach>
    </select></cite></li>
    <li><label>籍贯</label><input name="cmHome" type="text" class="dfinput"  value="${CM.cmHome}"/></li>
    <c:if test="${tag!='1'}">
    <li><label>照片</label><input name="pic" type="file" class="dfselect1"/></li>
    <li><cite><img alt="图片不存在" src="<%=basePath %>images/upload/${CM.cmPhoto}" style="width:100px;height:100px"></cite></li>
    </c:if>
    <c:if test="${tag =='1'}">
    <li><label>照片</label>
    <cite><img alt="图片不存在" src="<%=basePath %>images/upload/${CM.cmPhoto}" style="width:100px;height:100px"></cite></li>
    </c:if>
    <li><label>学历</label><cite><select class="dfselect1" name="cmEducation">
    <option value="0">请选择</option>
    <c:forEach items="${educationParam}" var="education">
    <option value="${education.key}" <c:if test="${CM.cmEducation eq education.key }">selected</c:if> >${education.value}</option>
    </c:forEach>    
    </select></cite></li>
    <li><label>学位</label><cite><select class="dfselect" name="cmDegree">
    <option value="0">请选择</option>
    <c:forEach items="${degreeParam}" var="degree">
    <option value="${degree.key}" <c:if test="${CM.cmDegree eq degree.key }">selected</c:if> >${degree.value}</option>
    </c:forEach>
    </select></cite></li>
    <li><label>毕业院校及专业</label><input name="cmGraduated" type="text" class="dfinput"  value="${CM.cmGraduated}"/></li>
    <li><label>专业技术职称</label><div class="vocation">
				  <select class="dfselect1" name="cmProTitles">
		            <option value="0">请选择</option>
		            <c:forEach items="${proTitlesParam}" var="pro">
                    <option value="${pro.key}" <c:if test="${CM.cmProTitles eq pro.key }">selected</c:if> >${pro.value}</option>
                    </c:forEach>
		           </select></div></li>
    <li><label>客户经理等级</label><cite><select class="dfselect1" name="cmLevel">
		            <option value="0">请选择</option>
		            <c:forEach items="${levelParam}" var="level">
                    <option value="${level.key}" <c:if test="${CM.cmLevel eq level.key }">selected</c:if> >${level.value}</option>
                    </c:forEach>
		          </select></cite></li>
		           
    <li><label>所在单位</label><input name="cmUnit" type="text" class="dfinput"  value="${CM.cmUnit}"/></li>
    <li><label>部门</label><input name="cmDept" type="text" class="dfinput"  value="${CM.cmDept}"/></li>
    <li><label>职务</label><input name="cmPosition" type="text" class="dfinput"  value="${CM.cmPosition}"/></li>

    <li><label>业务条线</label><cite><select class="dfselect" name="cmBusLines">
    <option value="0">请选择</option>
    <option value="1" <c:if test="${CM.cmBusLines =='1' }">selected="selected"</c:if> >对公</option>
    <option value="2" <c:if test="${CM.cmBusLines =='2' }">selected="selected"</c:if> >对个人</option>
    </select></cite></li>
    <li><label>参加工作时间</label><input name="cmHireDate" type="text" class="dfinput"  value="${CM.cmHireDate}"/></li>
    <li><label>入行时间</label><input name="cmEntryDate" type="text" class="dfinput"  value="${CM.cmEntryDate}"/></li>
    <li><label>从事金融工作年限</label><input name="cmFiYear" type="text" class="dfinput"  value="${CM.cmFiYear}"/></li>
    <li><label>客户经理从业年限</label><input name="cmWorkYear" type="text" class="dfinput"  value="${CM.cmWorkYear}"/></li>
    <li><label>办公电话</label><input name="cmTel" type="text" class="dfinput"  value="${CM.cmTel}"/></li>
    <li><label>手机</label><input name="cmMobile" type="text" class="dfinput"  value="${CM.cmMobile}"/></li>
    <li><label>状态</label><cite>
    <select class="select1" name="cmStatus">
	    <option value="0">请选择</option>
	    <option value="T" <c:if test="${CM.cmStatus == 'T' }">selected</c:if> >在职</option>
	    <option value="F" <c:if test="${CM.cmStatus == 'F' }">selected</c:if> >退出</option>
	    </select></cite></li>
    <!-- 将修改的人员名字传到后台 --><input name="cmModiPerson" type="hidden" value="${user.username}">
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" class="btn" value="重置"/></li>
    </ul>
    
    </div>
    </form>
</body>

</html>
