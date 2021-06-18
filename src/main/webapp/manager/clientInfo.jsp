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
<title>客户信息</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"> 
  function confirmMsgDel()
  {  
	  var ids="";
	  //找到被选中的checkbox集
	  var $chkBoxes = $('#cTable').find('input:checked');   
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
	  alert("keys=="+ids)
	     if(confirm("删除客户经理信息,您确定要删除吗?"))
	     { window.location="<%=basePath%>deleteClient?ckeys="+ids;
	     }
  } 

  
  //展示分页的方法
  function gotoPage(pn){
	   //点击上一页、下一页、首页、尾页时执行
	  if(pn!=null && pn!=''){
		  //将pn参数传到regularMeetInfoList方法中
	  document.form1.action="clientInfoList?pn="+pn;}
	 
	   //使用跳转时执行
	   var pageNum=$("#toPageNums").val();
	  
	   //获取输入的内容(根据id获得输入框里的内容)
	  var pageNum=document.getElementById("toPageNums").value;
	  if(pageNum!=null && pageNum!=''){
	  document.form1.action="clientInfoList?pn="+pageNum;}//将获取到的参数传到方法中
	  //提交
	  document.form1.submit();

  }
  
//获取要修改的客户信息的ckey（只能为一个）
  function getClienCkey()
  { 
	 var id="";
   //找到被选中的checkbox集
  var $chkBoxes = $('#cTable').find('input:checked');   
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
  alert("ckey=="+id)
  alert("进入修改页面");
  window.location="<%=basePath%>updateClient?ckey="+id;
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
    <li><a href="clientInfoList">客户信息管理</a></li>
    </ul>
    </div>
	<form action="clientInfoList" method="post" name="form1">
	<div class="formbody">
    <ul class="seachform">
    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }" /></li>
    <li><label>客户姓名</label><input name="cName" type="text" class="scinput" value="${cName}" /></li>
    <li><label>客户身份证号</label><input name="cSsn" type="text" class="scinput" value="${cSsn}"/></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
    </ul>
	</div>

    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="manager/clientInfoAdd.jsp"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:getClienCkey()"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsgDel()" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>
	    <table class="tablelist" id="cTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="11">客户信息列表</td></tr>
		    	</thead>
		    	<thead>
		    	<tr>
		        <th><input name="" type="checkbox" value=""/></th>
		        <th>姓名</th>
		        <th>身份证号</th>
		        <th>联系方式</th>
		        <th>年收入（万元）</th>
		        <th>资产（万元）</th>
		        <th>负债（万元）</th>
		        <th>客户单位</th>
		        <th>家庭住址</th>
		        <th>业务关联</th>
		        <th>客户经理</th>
		        </tr>
	        </thead>
	        <tbody>
		        <tr>
		        <c:forEach items="${pageInfo.list}" var="client">		 
		        <td><input name="" type="checkbox" value="${client.ckey }" data-id="${client.ckey }"/></td>
                <td>${client.cName }</td>
		        <td>${client.cSsn }</td>
		        <td>${client.cTel }</td>
		        <td>${client.cSalary }</td>
		        <td>${client.cBalance }</td>
		        <td>${client.cDebt }</td>
		        <td>${client.cUnit}</td>
		        <td>${client.cAdd }</td>
		        <td>${client.cBusiness }</td>
		        <td>${client.cmName}</td>
		        </tr> 
		        </c:forEach>
	        </tbody>
	    </table>
			</div><div class="pagin">
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
