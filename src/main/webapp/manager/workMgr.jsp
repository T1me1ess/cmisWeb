<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<title>工作管理</title>
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
  var $chkBoxes = $('#workTable').find('input:checked');   
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
      if(confirm("删除工作记录,您确定要删除吗?"))
     { window.location="<%=basePath%>deleteCMWork?keys="+ids;
     }

  } 

  //展示分页的方法
  function gotoPage(pn){
	   //点击上一页、下一页、首页、尾页时执行
	  if(pn!=null && pn!=''){
		  //将pn参数传到cmworkInfoList方法中
	  document.form1.action="cmworkInfoList?pn="+pn;}
	 
	   //使用跳转时执行
	  // var pageNum=$("#toPageNums").val();
	  
	   //获取输入的内容(根据id获得输入框里的内容)
	  var pageNum=document.getElementById("toPageNums").value;
	  if(pageNum!=null && pageNum!=''){
	  document.form1.action="cmworkInfoList?pn="+pageNum;}//将获取到的参数传到方法中
	  //提交
	  document.form1.submit();

  }
  
  
  //获取要修改的会议记录key（只能为一个）
  function getCMWorkId()
  { 
	 var id="";
   //找到被选中的checkbox集
  var $chkBoxes = $('#workTable').find('input:checked');   
   //如果不勾选弹出警告框
  if ($chkBoxes.length == 0) {         
    alert('请至少选择一个会议记录');
    return false;
  }
  //如果勾选多个弹出警告框
  if ($chkBoxes.length > 1) {         
    alert('请选择一个会议记录');
    return false;
  }
   //遍历被选中的checkbox集
  $($chkBoxes).each(function () { 
	  //将选择的所以用户的id连成字符串
    id+=$(this).attr('data-id');
  })
  alert("key=="+id)
  alert("进入修改页面");
  window.location="<%=basePath%>updateCMWork?key="+id;
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
</head>
<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="cmworkInfoList">工作管理</a></li>
    </ul>
    </div>
   
	<form action="cmworkInfoList" method="post" name="form1">
	<div class="formbody">
	    <ul class="seachform">
	    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId}" /></li>
	    <li><label>录入日期</label><input name="cmDate" type="text" class="scinput" value="${cmDate}" /></li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	</div>

    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="manager/workMgrAdd.jsp"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:getCMWorkId()"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsgDel()" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>
	    <table class="tablelist" id="workTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="11">工作记录</td></tr>
		    	</thead>
		    	<thead>
		    	<tr>
		        <th><input name="" type="checkbox" value=""/></th>
		        <th>记录时间</th>
		        <th>客户维护</th>
		        <th>产品信息</th>
		        <th>货后管理</th>
		        <th>风险预警</th>
		        <th>发现问题</th>
		        <th>工作建议及感悟</th>
		        </tr>
	        </thead>
	        <tbody>
	      <c:forEach items="${pageInfo.list}" var="cmWork">  
		        <tr>
		        <td><input name="work_id" type="checkbox" value="${cmWork.key}"  data-id="${cmWork.key}"></td>
		        <td>${cmWork.cmDate }</td>
		        <td>${cmWork.cmManagement }</td>
		        <td>${cmWork.cmProduct }</td>
		        <td>${cmWork.cmLoan }</td>
		        <td>${cmWork.cmWarning }</td>
		        <td>${cmWork.cmIssue }</td>
		        <td>${cmWork.cmWorkProposal }</td>
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
	                  <td width="40"><img src="images/go.gif" width="33" height="17" style="cursor:hand" onclick="goPage()"/></td>
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

</body>>
</html>