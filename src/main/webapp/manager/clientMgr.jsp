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
<title>客户经理信息综合维护</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript"> 
  function confirmMsgDel()
  {   var ids="";
  //找到被选中的checkbox集
  var $chkBoxes = $('#cmTable').find('input:checked');   
   //如果不勾选弹出警告框
  if ($chkBoxes.length == 0) {         
    alert('请至少选择一个会议记录');
    return false;
  }
   //遍历被选中的checkbox集
  $($chkBoxes).each(function () { 
	  //将选择的所以用户的id连成字符串
	 ids +=$(this).attr('data-id')+",";
  })
  alert("key=="+ids)
     if(confirm("删除客户经理信息,您确定要删除吗?"))
     { window.location="<%=basePath%>deleteClientMgr?cmIds="+ids;
     }
    
  } 
  //导出数据
  function exportMsg()
  {  
     if(confirm("您确定要导出吗?"))
     window.location="<%=basePath%>exportExcel";
  } 
  
  //展示分页的方法
  function gotoPage(pn){
	   //点击上一页、下一页、首页、尾页时执行
	  if(pn!=null && pn!=''){
		  //将pn参数传到regularMeetInfoList方法中
	  document.form1.action="clientMgrInfoList?pn="+pn;}
	 
	   //使用跳转时执行
	   var pageNum=$("#toPageNums").val();
	  
	   //获取输入的内容(根据id获得输入框里的内容)
	  var pageNum=document.getElementById("toPageNums").value;
	  if(pageNum!=null && pageNum!=''){
	  document.form1.action="clientMgrInfoList?pn="+pageNum;}//将获取到的参数传到方法中
	  //提交
	  document.form1.submit();

  }
  
  //展示客户经理的详细信息和删除客户经理的详细信息
   function operatClientMgr(tag,id)
   { 
 	
   alert("id=="+id)
   
   if(tag=="detail"){
   alert("进入展示页面");
   window.location="<%=basePath%>showClientMgrDetail?cmId="+id;
   }
   if(tag=="delete"){
	   alert("删除客户经理信息");
	   window.location="<%=basePath%>singldeleteCM?cmId="+id;
	   }
   } 
  
  
   //获取要修改的客户经理信息的id（只能为一个）
   function getClientMgrId()
   { 
 	 var id="";
    //找到被选中的checkbox集
   var $chkBoxes = $('#cmTable').find('input:checked');   
    //如果不勾选弹出警告框
   if ($chkBoxes.length == 0) {         
     alert('请至少选择一个客户经理的信息');
     return false;
   }
   //如果勾选多个弹出警告框
   if ($chkBoxes.length > 1) {         
     alert('请选择一个客户经理的信息');
     return false;
   }
    //遍历被选中的checkbox集
   $($chkBoxes).each(function () { 
 	  //将选择的所以客户经理的信息的cmid连成字符串
     id+=$(this).attr('data-id');
   })
   alert("cmId=="+id)
   alert("进入修改页面");
   window.location="<%=basePath%>updateClientMgr?cmId="+id;
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
    </ul>
    </div>
	<form action="clientMgrInfoList" method="post" name="form1">
	<div class="formbody">
	    <ul class="seachform">
	    <li><label>机构</label><input name="cmUnit" type="text" class="scinput" value="${cmUnit}"/></li>
	    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId}" /></li>
	    <li><label>姓名</label><input name="cmName" type="text" class="scinput" value="${cmName }"/></li>
	    <li><label>状态</label>  
	    <div class="vocation">
	    <select class="select1" name="cmStatus">
	    <option value="">请选择</option>
	    <option value="T" <c:if test="${cmStatus == 'T' }">selected</c:if> >在职</option>
	    <option value="F" <c:if test="${cmStatus == 'F' }">selected</c:if> >退出</option>
	    </select>
	    </div>
	    </li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	</div>
	
    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="toMgrAdd"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:getClientMgrId()"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsgDel()" ><span><img src="images/t03.png"/></span>删除</a></li>
	        <li><a href="javascript:exportMsg()" ><span><img src="images/t06.png"  height="24" width="20"/></span>导出</a></li>
	        </ul>
	    </div>
	    <table class="tablelist" id="cmTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="10">客户经理信息列表</td></tr>
		    	</thead>
		    	<thead>
		    	<tr>
		        <th><input name="" type="checkbox" value=""/></th>
		        <th>员工号</th>
		        <th>姓名</th>
		        <th>性别</th>
		        <th>身份证号</th>
		        <th>出生日期</th>
		        <th>客户经理等级</th>
		        <th>机构</th>
		        <th>部门</th>
		        <th></th>
		        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${pageInfo.list }" var="clientMgr">
		        <tr>
		        <td><input name="cm_id" type="checkbox" value="${clientMgr.cmId}" data-id="${clientMgr.cmId}" /></td>
		        <td>${clientMgr.cmId }</td>
		        <td>${clientMgr.cmName }</td>
		        <td><c:if test="${clientMgr.cmSex=='M' }">男</c:if>
		            <c:if test="${clientMgr.cmSex=='F' }">女</c:if></td>
		        <td>${clientMgr.cmSsn}</td>
		        <td>${clientMgr.cmBirthDay }</td>
		        <td><!-- 客户经理等级 -->
		          <c:forEach items="${levelParam}" var="itemtype">
		             <c:if test="${clientMgr.cmLevel eq itemtype.key}">
		               ${itemtype.value }
		              </c:if>
		          </c:forEach>
		        </td>
		        <td>${clientMgr.cmUnit }</td>
		        <td>${clientMgr.cmDept }</td>
		        <td><a href="javascript:operatClientMgr('detail',${clientMgr.cmId})" class="tablelink">查看</a> 
		            <a href="javascript:operatClientMgr('delete',${clientMgr.cmId})" class="tablelink"> 删除</a></td>
		        </tr> 
		        
		        </c:forEach>    
		        
		       
	        </tbody>
	    </table>
		  <div class="pagin">
	 		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="STYLE4"><div class="message">共<i class="blue">${pageInfo.total }</i>条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum }&nbsp;</i>页</div>
	           </td>
	            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="45"><img src="images/first.gif" width="33" height="20" style="cursor:hand" onclick="gotoPage(1)"/></td>
	                  <td width="50"><img src="images/back.gif" width="43" height="20" style="cursor:hand" onclick="gotoPage(${pageInfo.pageNum-1})"/></td>
	                  <td width="50"><img src="images/next.gif" width="43" height="20" style="cursor:hand" onclick="gotoPage(${pageInfo.pageNum+1})"/></td>
	                  <td width="40"><img src="images/last.gif" width="33" height="20" style="cursor:hand" onclick="gotoPage(${pageInfo.pages})"/></td>
	                  <td width="100"><div align="center"><span class="STYLE1">转到第
	                    <input name="textfield" id="toPageNums" type="text" size="4" style="height:16px; width:35px; border:1px solid #999999;"/> 
	                    页 </span></div></td>
	                  <td width="40"><img src="images/go.gif" width="33" height="17" style="cursor:hand" onclick="gotoPage('')"/></td>
	                </tr>
	            </table>
	            </td>
	            </tr>
	            </table>
			</div>
    </div>
	</form>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
