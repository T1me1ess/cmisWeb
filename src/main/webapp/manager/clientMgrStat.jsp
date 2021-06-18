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
<title>报表管理</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript"> 
  function exportMsg()
  {  
     if(confirm("您确定要导出excel文件吗?"))
     window.location="<%=basePath%>exportExcelStat";
  } 
</script>
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
    KE.show({
        id : 'content7',
        cssPath : './index.css'
    });
  </script>
  
<script type="text/javascript">
$(document).ready(function(e) {
    $(".select1").uedSelect({
		width : 100			  
	});
	$(".select2").uedSelect({
		width : 200 
	});
	$(".select3").uedSelect({
		width : 150
	});
});
</script>

</head>


<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">报表管理</a></li>
    </ul>
    </div>
    <form action="getclientMgrStatList" method="post">
	<div class="formbody">
		    <ul class="seachform">
		    <li><label>机构</label><input name="cmUnit" type="text" class="scinput" value="${cmUnit}" /></li>
		    <li><label>状态</label>  
		    <div class="vocation">
		    <select class="select1" name="cmStatus">
		    <option value="">请选择</option>
	        <option value="T" <c:if test="${cmStatus == 'T' }">selected</c:if> >在职</option>
	        <option value="F" <c:if test="${cmStatus == 'F' }">selected</c:if> >退出</option>
		    </select>
		    </div>
		    </li>
		    <li><label>性别</label>  
		    <div class="vocation">
		    <select class="select1" name="cmSex">
		    <option value="">请选择</option>
		    <option value="M" <c:if test="${cmSex == 'M' }">selected</c:if> >男</option>
		    <option value="F" <c:if test="${cmSex == 'F' }">selected</c:if> >女</option>
		    </select>
		    </div>
		    </li>
	        <li><label>学历</label>
	        <div class="vocation">
	        <select class="select1" name="cmEducation">
	        <option value="">请选择</option>
	        <c:forEach items="${educationParam}" var="education">
    <option value="${education.key}" <c:if test="${cmEducation eq education.key }">selected</c:if> >${education.value}</option>
            </c:forEach>
	        </select></div></li>
	        <li><label>专业技术职称</label><div class="vocation">
				  <select class="select2" name="cmProTitles">
		            <option value="">请选择</option>
		            <c:forEach items="${proTitlesParam}" var="pro">
                    <option value="${pro.key}" <c:if test="${cmProTitles eq pro.key }">selected</c:if> >${pro.value}</option>
                    </c:forEach>
		           </select></div></li>
    		<li><label>客户经理等级</label><div class="vocation">
    		<select class="select3" name="cmLevel">
		            <option value="">请选择</option>
		            <c:forEach items="${levelParam}" var="level">
                    <option value="${level.key}" <c:if test="${cmLevel eq level.key }">selected</c:if> >${level.value}</option>
                    </c:forEach>
		          </select></div></li>
		
	        <li><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/> &nbsp;&nbsp;&nbsp;&nbsp;
	        <input name="" type="button" class="scbtn" value="导出excel" onClick="exportMsg()"/></li>
	   	    </ul>
	</div>
	
    <div class="rightinfo">
   	    <div class="tools">
	    	<ul>
	        <li></li>
	        </ul>
	    </div>
	    <table class="tablelist">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">客户经理信息列表</td></tr>
		    	</thead>
		    	<thead>
		    	<tr>
		        <th>员工号</th>
		        <th>姓名</th>
		        <th>性别</th>
		        <th>客户经理等级</th>
		        <th>机构</th>
		        <th>部门</th>
		        <th>业务条线</th>
		        <th>职务</th>
		        <th>客户经理从业年限</th>
		        <th>联系电话</th>
		        <th>状态</th>
		        <th>年龄</th>
		        <th>学历</th>
		        <th>专业职称</th>
		        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${clientMgrList}" var="clientMgr">
		        <tr>
		        <td>${clientMgr.cmId}</td>
		        <td>${clientMgr.cmName}</td>
		        <td>
		        <c:if test="${clientMgr.cmSex=='M'}">男</c:if>
		        <c:if test="${clientMgr.cmSex=='F'}">女</c:if>		        
		        </td>
		        <td>
		        <c:forEach items="${levelParam}" var="level">
		        <c:if test="${level.key eq clientMgr.cmLevel}">${level.value}</c:if>
		        </c:forEach></td>
		        <td>${clientMgr.cmUnit }</td>
		        <td>${clientMgr.cmDept }</td>
		        <td>
		        <c:if test="${clientMgr.cmBusLines=='1'}">对公</c:if>
		        <c:if test="${clientMgr.cmBusLines=='2'}">对个人</c:if></td>
		        <td>${clientMgr.cmPosition}</td>
		        <td>${clientMgr.cmEntryDate}</td>
		        <td>${clientMgr.cmMobile}</td>
		        <td>
		        <c:if test="${clientMgr.cmStatus=='T'}">在职</c:if>
		        <c:if test="${clientMgr.cmStatus=='F'}">退出</c:if>
		        </td>
		        <td>${clientMgr.cmAge}</td>
		        <td>
		        <c:forEach items="${educationParam}" var="education">
		        <c:if test="${education.key eq clientMgr.cmEducation}">${education.value}</c:if>
		        </c:forEach>
		        </td>
		        <td>
		        <c:forEach items="${proTitlesParam}" var="pro">
		        <c:if test="${pro.key eq clientMgr.cmProTitles}">${pro.value}</c:if>
		        </c:forEach>
		        </td>
		        </tr>
		   </c:forEach> 
		       
	        </tbody>
	    </table>
    </div>
    </form>
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>