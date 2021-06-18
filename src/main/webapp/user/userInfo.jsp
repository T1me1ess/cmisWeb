<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
    System.out.println("path="+path);
    System.out.println("basePath="+basePath);
    %>   
    <base href="<%=basePath%>" > 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户查询</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"> 

//批量操作用户（根据用户id）
  function confirmMsg(tag)
  { 
	
  alert("tag=========="+tag)
  var ids="";
   //找到被选中的checkbox集
  var $chkBoxes = $('#userTable').find('input:checked');   
   //如果不勾选弹出警告框
  if ($chkBoxes.length == 0) {         
    alert('请至少选择一个数据集');
    return false;
  }
   //遍历被选中的checkbox集
  $($chkBoxes).each(function () { 
	  //将选择的所以用户的id连成字符串
    ids +=$(this).attr('data-id')+",";
  })
  alert("ids=="+ids)
  
  
  
   //删除操作
   if(tag=="delete")
	 {alert("进行删除操作")
	   if (confirm("您确定要删除选中的用户信息吗?"))
		 window.location="<%=basePath%>deleteUsers?userIds="+ids; 
		 } 
   
  //将用户的状态设置为启用状态  
  if(tag=="open")
	 {if (confirm("您确定要启用该用户吗?"))
		 window.location="<%=basePath%>operateUsers?tag=1&userIds="+ids; 
		 } 
  
 //将用户的状态设置为禁用状态  
  if(tag=="close")
	 {if (confirm("您确定要禁用该用户吗?"))
		 window.location="<%=basePath%>operateUsers?tag=2&userIds="+ids; 
		 } 
		 
//重置密码
  if(tag=="reset")
	 {if (confirm("重置密码,您确定要恢复初始密码吗?"))
		 window.location="<%=basePath%>operateUsers?tag=3&userIds="+ids; 
		 } 
}
  
  

  
  
  
   //展示分页的方法
  function gotoPage(pn){
	   //点击上一页、下一页、首页、尾页时执行
	  if(pn!=null && pn!=''){
		  //将pn参数传到userInfoList方法中
	  document.form1.action="userInfoList?pn="+pn;}
	 
	   //使用跳转时执行
	  // var pageNum=$("#toPageNums").val();
	  
	   //获取输入的内容(根据id获得输入框里的内容)
	  var pageNum=document.getElementById("toPageNums").value;
	  if(pageNum!=null && pageNum!=''){
	  document.form1.action="userInfoList?pn="+pageNum;}//将获取到的参数传到方法中
	  //提交
	  document.form1.submit();

  }
   
  
 //获取要修改的用户id（只能为一个）
  function getUserId()
  { 
	 var id="";
   //找到被选中的checkbox集
  var $chkBoxes = $('#userTable').find('input:checked');   
   //如果不勾选弹出警告框
  if ($chkBoxes.length == 0) {         
    alert('请至少选择一个数据集');
    return false;
  }
  //如果勾选多个弹出警告框
  if ($chkBoxes.length > 1) {         
    alert('请选择一个数据集');
    return false;
  }
   //遍历被选中的checkbox集
  $($chkBoxes).each(function () { 
	  //将选择的所以用户的id连成字符串
    id+=$(this).attr('data-id');
  })
  alert("id=="+id)
  alert("进入修改页面");
  window.location="<%=basePath%>updateUser?userId="+id;
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
    <li><a href="userInfoList">用户管理</a></li>
    </ul>
    </div>
	<form action="userInfoList" method="post" name="form1">
	<div class="formbody">
    <ul class="seachform">
    <li><label>用户编号</label><input name="userId" type="text" class="scinput" value="${userId}"/></li>
    <li><label>姓名</label><input name="username" type="text" class="scinput" value="${username }"/></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
    </ul>
	</div>

    <div class="rightinfo">
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="user/userInfoAdd.jsp"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:getUserId()"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:confirmMsg('delete')" ><span><img src="images/t03.png"/></span>删除</a></li>
	        <li><a href="javascript:confirmMsg('open')" ><span><img src="images/t08.png" height="24" width="24"/></span>启用</a></li>
	        <li><a href="javascript:confirmMsg('close')" ><span><img src="images/t09.png" height="24" width="24"/></span>禁用</a></li>
	        <li><a href="javascript:confirmMsg('reset')"  ><span><img src="images/t07.png" height="20" width="20"/></span>重置密码</a></li>
	        </ul>
	    </div>
	    <table class="tablelist" id="userTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="11">客户信息列表</td></tr>
		    	</thead>
		    	<thead>
		    	<tr>
		        <th>选择</th>
		        <th>用户编号</th>
		        <th>姓名</th>
		        <th>状态</th>
		        <th>注册时间</th>
		        <th>最后登录时间</th>
		        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${pageInfo.list}" var="user">
		        <tr>
		        <td><input name="user_ids" type="checkbox" value="${user.userId}" data-id="${user.userId}" /></td>
		        <td>${user.userId }</td>
		        <td>${user.username }</td>
		        <td>${user.isEnable}</td>
		        <td>${user.registerTime }</td>
		        <td>${user.lastTime }</td>
		        </tr> 
		     </c:forEach>
		       
	        </tbody>
	    </table>
		   <div class="pagin">
	 		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr><!-- pageInfo中：total表示查询到的总数  pageNum表示当前的页数 -->
	            <td class="STYLE4"><div class="message">共<i class="blue">${pageInfo.total }</i>条记录，当前显示第&nbsp;<i class="blue">${pageInfo.pageNum }&nbsp;</i>页</div>
	           </td>
	            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
	                <tr>
	                  <td width="45"><img src="images/first.gif" width="33" height="20" style="cursor:hand" onclick="gotoPage(1)"/></td>
	                  <td width="50"><img src="images/back.gif" width="43" height="20" style="cursor:hand" onclick="gotoPage(${pageInfo.pageNum-1})"/></td>
	                  <td width="50"><img src="images/next.gif" width="43" height="20" style="cursor:hand" onclick="gotoPage(${pageInfo.pageNum+1})"/></td>
	                  <td width="40"><img src="images/last.gif" width="33" height="20" style="cursor:hand" onclick="gotoPage(${pageInfo.pages})"/></td>
	                  <td width="100"><div align="center"><span class="STYLE1">转到第
	                    <input name="textfield" id="toPageNums" type="text" size="4" style="height:16px; width:35px; border:1px solid #999999;" /> 
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