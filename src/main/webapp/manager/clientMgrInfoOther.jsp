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
<title>客户经理辅助信息维护</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/select.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="js/select-ui.min.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>
<script type="text/javascript"> 
  function oWorkPerformDel(pageNum)
  {   
      if(pageNum=='1')
    	 {
    	 var ids="";
    	  //找到被选中的checkbox集
    	  var $chkBoxes = $('#cmrTable').find('input:checked');   
    	   //如果不勾选弹出警告框
    	  if ($chkBoxes.length == 0) {         
    	    alert('请至少选择一个工作业绩记录');
    	    return false;
    	  }
    	   //遍历被选中的checkbox集
    	  $($chkBoxes).each(function () { 
    		  //将选择的所以用户的id连成字符串
    		 ids +=$(this).attr('data-id')+",";
    	  })
    	  alert("cmrkey=="+ids)
    	     if(confirm("删除工作业绩信息,您确定要删除吗?"))
    	 {
    	 window.location="<%=basePath%>deleteClientMgrResult?cmrKeys="+ids;
    	 }
    	 }

      if(pageNum=='2')
    	 {
    	 var ids="";
    	  //找到被选中的checkbox集
    	  var $chkBoxes = $('#cetTable').find('input:checked');   
    	   //如果不勾选弹出警告框
    	  if ($chkBoxes.length == 0) {         
    	    alert('请至少选择一个证照记录');
    	    return false;
    	  }
    	   //遍历被选中的checkbox集
    	  $($chkBoxes).each(function () { 
    		  //将选择的所以用户的id连成字符串
    		 ids +=$(this).attr('data-id')+",";
    	  })
    	  alert("cmrkey=="+ids)
    	     if(confirm("删除证照信息,您确定要删除吗?"))
    	 {
    	    	 window.location="<%=basePath%>deleteCertificate?cetKeys="+ids;
    	    	 }
    	 }
      
      if(pageNum=='3')
 	 {
 	 var ids="";
 	  //找到被选中的checkbox集
 	  var $chkBoxes = $('#rprTable').find('input:checked');   
 	   //如果不勾选弹出警告框
 	  if ($chkBoxes.length == 0) {         
 	    alert('请至少选择一个奖惩记录');
 	    return false;
 	  }
 	   //遍历被选中的checkbox集
 	  $($chkBoxes).each(function () { 
 		  //将选择的所以用户的id连成字符串
 		 ids +=$(this).attr('data-id')+",";
 	  })
 	  alert("rprKey=="+ids)
 	     if(confirm("删除奖惩信息,您确定要删除吗?"))
 	 {
 	    	 window.location="<%=basePath%>deleteRPR?rprKeys="+ids;
 	    	 }
 	 }
      //删除考核信息
      if(pageNum=='4')
  	 {
  	 var ids="";
  	  //找到被选中的checkbox集
  	  var $chkBoxes = $('#assTable').find('input:checked');   
  	   //如果不勾选弹出警告框
  	  if ($chkBoxes.length == 0) {         
  	    alert('请至少选择一个考核记录');
  	    return false;
  	  }
  	   //遍历被选中的checkbox集
  	  $($chkBoxes).each(function () { 
  		  //将选择的所以用户的id连成字符串
  		 ids +=$(this).attr('data-id')+",";
  	  })
  	  alert("assKey=="+ids)
  	     if(confirm("删除考核信息,您确定要删除吗?"))
  	 {
  	    	 window.location="<%=basePath%>deleteAssess?assKeys="+ids;
  	    	 }
  	 }
    //删除学习培训信息
      if(pageNum=='5')
  	 {
  	 var ids="";
  	  //找到被选中的checkbox集
  	  var $chkBoxes = $('#ltrTable').find('input:checked');   
  	   //如果不勾选弹出警告框
  	  if ($chkBoxes.length == 0) {         
  	    alert('请至少选择一个考核记录');
  	    return false;
  	  }
  	   //遍历被选中的checkbox集
  	  $($chkBoxes).each(function () { 
  		  //将选择的所以用户的id连成字符串
  		 ids +=$(this).attr('data-id')+",";
  	  })
  	  alert("ltrKey=="+ids)
  	     if(confirm("删除学习记录信息,您确定要删除吗?"))
  	 {
  	    	 window.location="<%=basePath%>deleteLTR?ltrKeys="+ids;
  	    	 }
  	 }
      //删除等级认定信息
      if(pageNum=='6')
  	 {
  	 var ids="";
  	  //找到被选中的checkbox集
  	  var $chkBoxes = $('#leTable').find('input:checked');   
  	   //如果不勾选弹出警告框
  	  if ($chkBoxes.length == 0) {         
  	    alert('请至少选择一个等级认定信息');
  	    return false;
  	  }
  	   //遍历被选中的checkbox集
  	  $($chkBoxes).each(function () { 
  		  //将选择的所以用户的id连成字符串
  		 ids +=$(this).attr('data-id')+",";
  	  })
  	  alert("leKey=="+ids)
  	     if(confirm("删除学习记录信息,您确定要删除吗?"))
  	 {
  	    	 window.location="<%=basePath%>deleteLevel?leKeys="+ids;
  	    	 }
  	 }
      //删除等级认定信息
      if(pageNum=='7')
  	 {
  	 var ids="";
  	  //找到被选中的checkbox集
  	  var $chkBoxes = $('#workTable').find('input:checked');   
  	   //如果不勾选弹出警告框
  	  if ($chkBoxes.length == 0) {         
  	    alert('请至少选择一个工作经历的信息');
  	    return false;
  	  }
  	   //遍历被选中的checkbox集
  	  $($chkBoxes).each(function () { 
  		  //将选择的所以用户的id连成字符串
  		 ids +=$(this).attr('data-id')+",";
  	  })
  	  alert("workKey=="+ids)
  	     if(confirm("删除学习记录信息,您确定要删除吗?"))
  	 {
  	    	 window.location="<%=basePath%>deleteWork?workKeys="+ids;
  	    	 }
  	 }
  }
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
		width : 260			  
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
    <li><a href="#">客户经理辅助信息维护</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    
    <div id="usual1" class="usual"> 
    
    <div class="itab">
  	<ul> 
    <li><a href="#tab1" <c:if test="${pageNum=='1' }">class="selected"</c:if> >年度工作业绩</a></li> 
    <li><a href="#tab2" <c:if test="${pageNum=='2' }">class="selected"</c:if> >证照列表</a></li> 
    <li><a href="#tab3" <c:if test="${pageNum=='3' }">class="selected"</c:if>>奖惩记录</a></li> 
    <li><a href="#tab4" <c:if test="${pageNum=='4' }">class="selected"</c:if>>考核记录</a></li> 
    <li><a href="#tab5" <c:if test="${pageNum=='5' }">class="selected"</c:if>>学习培训记录</a></li> 
    <li><a href="#tab6" <c:if test="${pageNum=='6' }">class="selected"</c:if>>等级认定记录</a></li> 
    <li><a href="#tab7" <c:if test="${pageNum=='7' }">class="selected"</c:if>>工作经历</a></li> 
  	</ul>
    </div>
    
    <!--年度工作业绩  -->
  	<div id="tab1" class="tabson">
  		<form action="getClientMgrOtherList?pageNum=1" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }"/></li>
		    <li><label>工作年度</label><input name="cmrYear" type="text" class="scinput" value="${cmrYear }"/></li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(1)"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(2)"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel(1)" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="cmrTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="10">年度工作业绩</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>工作年度</th>
	        <th>工作业绩</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <c:forEach items="${ClientMgrResultExt}" var="cmr">
	        <td>
	        <input name="resultId" type="checkbox" value="${cmr.cmrKey }" data-id="${cmr.cmrKey }"/></td>
	        <td>${cmr.cmName}</td>
	        <td>${cmr.cmrYear }</td>
	        <td>${cmr.cmrResult }</td>
	        <td><a href="downLoadClientMgrOtherFile?fileName=${cmr.cmrAttachment}">${cmr.cmrAttachment}</a></td>
	        <td>${cmr.cmrModiDate }</td>
	        <td>${cmr.cmrModiPerson }</td>
	        </tr> 
	        </c:forEach>
	        </tbody>
	    </table>
	    </form>
	</div>  
	
	
    <!--证件列表  -->
  	<div id="tab2" class="tabson">
  	  <form action="getClientMgrOtherList?pageNum=2" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }"/></li>
		   <li><label>工作年度</label><input name="" type="text" class="scinput" /></li>  
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(3)"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(4)"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel(2)" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="cetTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">证照列表</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>证书名称</th>
	        <th>证书类型</th>
	        <th>证书编号</th>
	        <th>发证单位</th>
	        <th>发证时间</th>
	        <th>失效时间</th>
	        <th>有效性</th>
	        <th>证书原件</th>
	        <th>作废标识</th>
	        <th>备注</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <tr>
	        <c:forEach items="${CertificateExt }" var="cet">
	        <td><input name="certificateId" type="checkbox" value="${cet.cetKey }" data-id="${cet.cetKey}" /></td>
	        <td>${cet.cmName }</td>
	        <td>${cet.cetName}</td>
	        <td>
	        <c:forEach items="${certificateTypeParam}" var="cetType">
	        <c:if test="${cetType.key eq cet.cetType }">${cetType.value}</c:if>
	        </c:forEach>
	        </td>
	        <td>${cet.cetNo }</td>
	        <td>${cet.cetUnit }</td>
	        <td>${cet.cetDate }</td>
	        <td>${cet.cetEndDate }</td>
	        <td>
	        <c:if test="${cet.cetPeriod =='1' }">有效</c:if>
	     	<c:if test="${cet.cetPeriod =='2' }">无效</c:if>
	        </td>
	        <td><a href="downLoadClientMgrOtherFile?fileName=${cet.cetUrl}">${cet.cetUrl }</a></td>
	        <td>${cet.cetInvalid }</td>
	        <td>${cet.cetRemark }</td>
	        <td>${cet.cetModiDate }</td>
	        <td>${cet.cetModiPerson }</td>
	        </tr> 
	        </c:forEach>
	     
	        </tbody>
	    </table></form>
	</div> 
	
    <!--奖惩记录  -->
  	<div id="tab3" class="tabson">
  	 <form action="getClientMgrOtherList?pageNum=3" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }"/></li>
		    <li><label>奖惩分类</label><input name="rprType" type="text" class="scinput" value="${rprType }"/></li>
		    <li><label>&nbsp;</label><input name="" type="button" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(5)"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(6)"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel(3)" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="rprTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="13">奖惩记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>奖惩分类</th>
	        <th>奖惩内容</th>
	        <th>生效日期</th>
	        <th>审批单位</th>
	        <th>审批人</th>
	        <th>撤销日期</th>
	        <th>撤销原因</th>
	        <th>备注</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	       
	        <c:forEach items="${RPRExt}" var="rpr">
	        <tr>
	        <td><input name="rprId" id="rprId" type="checkbox" value="${rpr.rprKey }" data-id="${rpr.rprKey}"/></td>
	        <td>${rpr.cmName }</td>
	        <td>${rpr.rprType }</td>
	        <td>${rpr.rprSub }</td>
	        <td>${rpr.rprDate }</td>
	        <td>${rpr.rprUnit }</td>
	        <td>${rpr. rprAperson}</td>
	        <td>${rpr.rprRdate }</td>
	        <td>${rpr.rprAreson }</td>
	        <td>${rpr.rprRemark }</td>
	        <td><a href="downLoadClientMgrOtherFile?fileName=${rpr.rprAttachment}">${rpr.rprAttachment}</a></td>
	        <td>${rpr.rprModiDate }</td>
	        <td>${rpr.rprModiPerson }</td>
	        </tr> 
	        </c:forEach>
	        
	        </tbody>
	    </table></form>
	</div> 

    <!--考核记录  -->
  	<div id="tab4" class="tabson">
  	   <form action="getClientMgrOtherList?pageNum=4" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }"/></li>
		    <li><label>考核时间</label><input name="assTime" type="text" class="scinput" value="${assTime }"/></li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(7)"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(8)"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel(4)" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="assTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="12">考核记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>考核时间</th>
	        <th>考核内容</th>
	        <th>考核时期</th>
	        <th>考核结果</th>
	        <th>考核评价</th>
	        <th>考核单位</th>
	        <th>备注</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${AssExt }" var="ass">
	        <tr>
	        <td><input name="assId" id="assId" type="checkbox" value="${ass.assKey }" data-id="${ass.assKey }"/></td>
	        <td>${ass.cmName }</td>
	        <td>${ass.assTime }</td>
	        <td>${ass.assSub }</td>
	        <td>${ass.assPeriod }</td>
	        <td>${ass.assResult }</td>
	        <td>${ass.assAppraisal }</td>
	        <td>${ass.assUnit }</td>
	        <td>${ass.assRemark }</td>
	        <td><a href="downLoadClientMgrOtherFile?fileName=${ass.assAttachment}">${ass.assAttachment }</a></td>
	        <td>${ass.assModiDate }</td>
	        <td>${ass.assModiPerson }</td>
	        </tr> 
	        </c:forEach>
	        </tbody>
	    </table></form>
	</div> 

    <!--学员培训记录  -->
  	<div id="tab5" class="tabson">
  	    <form action="getClientMgrOtherList?pageNum=5" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }"/></li>
		    <li><label>培训时间</label><input name="ltrDate" type="text" class="scinput" value="${ltrDate }"/></li>
		    <li><label>科目</label><input name="ltrSub" type="text" class="scinput" value="${ltrSub }"/></li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(9)"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(10)"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel(5)" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="ltrTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">学员培训记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>培训时间</th>
	        <th>科目</th>
	        <th>培训单位</th>
	        <th>开始日期</th>
	        <th>结束日期</th>
	        <th>学时</th>
	        <th>学分</th>
	        <th>成绩</th>
	        <th>附件依据</th>
	        <th>备注</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${LTRExt}" var="ltr">
	        <tr>
	        <td><input name="ltrId" id="ltrId" type="checkbox" value="${ltr.ltrKey }" data-id="${ltr.ltrKey }"/></td>
	        <td>${ltr.cmName }</td>
	        <td>${ltr.ltrDate }</td>
	        <td>${ltr.ltrSub }</td>
	        <td>${ltr.ltrUnit }</td>
	        <td>${ltr.ltrStartDate }</td>
	        <td>${ltr.ltrEndDate }</td>
	        <td>${ltr.ltrKnow }</td>
	        <td>${ltr.ltrCredit }</td>
	        <td>${ltr.ltrScore }</td>
	        <td><a href="downLoadClientMgrOtherFile?fileName=${ltr.ltrAttachment}">${ltr.ltrAttachment}</a></td>
	        <td>${ltr.ltrRemark }</td>
	        <td>${ltr.ltrModiDate}</td>
	        <td>${ltr.ltrModiPerson }</td>
	        
	        </tr> 
	        </c:forEach>
	        </tbody>
	    </table></form>
	</div> 
    <!--等级认定记录  -->
  	<div id="tab6" class="tabson">
  	   <form action="getClientMgrOtherList?pageNum=6" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }"/></li>
		    <li><label>认定时间</label><input name="leDate" type="text" class="scinput" value="${leDate }" /></li>
		    <li><label>认定级别</label><input name="leLevel" type="text" class="scinput" value="${leLevel }"/></li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(11)"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(12)"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel(6)" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="leTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">等级认定记录</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>认定时间</th>
	        <th>认定级别</th>
	        <th>认定类型</th>
	        <th>附件依据</th>
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${LevelExt}" var="lev">
	        <tr>
	        <td><input name="levelId" id="levelId" type="checkbox" value="${lev.leKey }" data-id="${lev.leKey }"/></td>
	        <td>${lev.cmName }</td>
	        <td>${lev.leDate }</td>
	        <td>${lev.leLevel }</td>
	        <td>${lev.leType }</td>
	        <td><a href="downLoadClientMgrOtherFile?fileName=${lev.leAttachment }">${lev.leAttachment }</a></td>
	        <td>${lev.leModiDate }</td>
	        <td>${lev.leModiPerson }</td>
	        <td>
	        </tr> 
	        </c:forEach>
	        
	        </tbody>
	    </table></form>
	</div> 
    <!--工作经历  -->
  	<div id="tab7" class="tabson">
  	  <form action="getClientMgrOtherList?pageNum=7" method="post">
	    <ul class="seachform">
		    <li><label>客户经理编号</label><input name="cmId" type="text" class="scinput" value="${cmId }"/></li>
		    <li><label>职务</label><input name="workPosition" type="text" class="scinput" value="${workPosition }" /></li>
		    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>
	    </ul>
	    <div class="tools">
	    	<ul class="toolbar1">
	        <li><a href="javascript:openWindow(13)"><span><img src="images/t01.png" /></span>添加</a></li>
	        <li><a href="javascript:openWindow(14)"><span><img src="images/t02.png" /></span>修改</a></li>
	        <li><a href="javascript:oWorkPerformDel(7)" ><span><img src="images/t03.png"/></span>删除</a></li>
	        </ul>
	    </div>

	    <table class="tablelist" id="workTable">
	    	<thead>
		    	<tr class="tablehead"><td colspan="14">工作经历</td></tr>
		   	</thead>
	    	<thead>
	    	<tr>
	        <th><input name="" type="checkbox" value=""/></th>
	        <th>姓名</th>
	        <th>任职日期</th>
	        <th>职务</th>
	        <th>单位</th>
	        <th>附件依据</th>
	        <th>工作经历</th>	        
	        <th>维护日期</th>
	        <th>维护人</th>
	        </tr>
	        </thead>
	        <tbody>
	        <c:forEach items="${WorkExt}" var="work">
	        <tr>
	        <td><input name="workId" type="checkbox" value="${work.workKey }" data-id="${work.workKey}"/></td>
	        <td>${work.cmName }</td>
            <td>${work.workDate }</td>
            <td>${work.workPosition }</td>
            <td>${work.workUnit }</td>	        
            <td><a href="downLoadClientMgrOtherFile?fileName=${work.workAttachment}">${work.workAttachment }</td>
	        <td>${work.workWork }</td>
	        <td>${work.workModiDate }</td>
	        <td>${work.workModiPerson }</td>
	        </tr> 
	        </c:forEach>
	        </tbody>
	    </table></form>
	</div> 	   	   
<script language="javascript">
	function openWindow(scanLog) {
		if (scanLog == 1) {
			document.getElementById('light1').style.display = 'block';
		}
		else if(scanLog == 2){
			var objs=document.getElementsByName("resultId");//获取复选框的工作经历key
			var selectObjs=[];
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked){		
					selectObjs.push(objs[i]);
				};
			}
			//只允许有一个选中
			if(selectObjs.length==1){
				document.getElementById('resultHidden').value=selectObjs[0].value;
				document.getElementById('light2').style.display = 'block';
			}else if(selectObjs.length==0){
				alert("必须选择一项纪录修改!");
			}else{
				alert("只能选择一项纪录修改!");
			}
			$.ajax({
		         //发送请求URL，可使用相对路径也可使用绝对路径
		         url:"<%=basePath%>/modifyCmr?cmrKey="+selectObjs[0].value,
		         //发送方式为GET，也可为POST，需要与后台对应
		         type:"GET",
		         //设置接收格式为JSON
		         dataType:"json",
		         //编码设置
		         contentType:"application/json;charset=utf-8",
		         //后台返回成功后处理数据，data为后台返回的json格式数据
		         success:function(data){
		        	 if(data.length>0){
		        		 
		        		 $("#resultCmrKey").val(data[0].cmrKey);
		        		 $("#resultCmId").val(data[0].cmId);
		        		 $("#resultCmrYear").val(data[0].cmrYear);
		        		 $("#resultCmrResult").val(data[0].cmrResult);
		        		 $("#resultCmrAttach").text(data[0].cmrAttachment);
		        		 $("#resultCmrModiDate").val(data[0].cmrModiDate);
		        		 $("#resultCmrPostion").val(data[0].cmrModiPerson);
		        		 
		        	 }
		         }
		   });
		
		}else if(scanLog == 3){
			document.getElementById('light3').style.display = 'block';
		}else if(scanLog == 4){
			var objs=document.getElementsByName("certificateId");//获取复选框的工作年度业绩key
			var selectObjs=[];
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked){		
					selectObjs.push(objs[i]);
				};
			}
			//只允许有一个选中
			if(selectObjs.length==1){
				document.getElementById('resultHidden').value=selectObjs[0].value;
				document.getElementById('light4').style.display = 'block';
			}else if(selectObjs.length==0){
				alert("必须选择一项纪录修改!");
			}else{
				alert("只能选择一项纪录修改!");
			}
			$.ajax({
		         //发送请求URL，可使用相对路径也可使用绝对路径
		         url:"<%=basePath%>/modifyCet?cetKey="+selectObjs[0].value,
		         //发送方式为GET，也可为POST，需要与后台对应
		         type:"GET",
		         //设置接收格式为JSON
		         dataType:"json",
		         //编码设置
		         contentType:"application/json;charset=utf-8",
		         //后台返回成功后处理数据，data为后台返回的json格式数据
		         success:function(data){
		        	 if(data.length>0){
		        		 $("#CetKey").val(data[0].cetKey);
		        		 $("#CetCmId").val(data[0].cmId);
		        		 $("#CetName").val(data[0].cetName);
		        		 $("#CetType").val(data[0].cetType);
		        		 $("#CetNo").val(data[0].cetNo);
		        		 $("#CetUnit").val(data[0].cetUnit);
		        		 $("#CetDate").val(data[0].cetDate);
		        		 $("#CetEndDate").val(data[0].cetEndDate);
		        		 $("#CetPeriod").val(data[0].cetPeriod);
		        		 $("#CetUrl").text(data[0].cetUrl);
		        		 $("#CetInvalid").val(data[0].cetInvalid);
		        		 $("#CetRemark").val(data[0].cetRemark);
		        		
		        	 }
		         }
		   });
		}else if(scanLog == 5){
			document.getElementById('light5').style.display = 'block';
		}else if(scanLog == 6){
			//修改奖惩记录
			var objs=document.getElementsByName("rprId");//获取复选框的奖惩记录key
			var selectObjs=[];
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked){		
					selectObjs.push(objs[i]);
				};
			}
			//只允许有一个选中
			if(selectObjs.length==1){
				document.getElementById('rprHidden').value=selectObjs[0].value;
				document.getElementById('light6').style.display = 'block';
			}else if(selectObjs.length==0){
				alert("必须选择一项纪录修改!");
			}else{
				alert("只能选择一项纪录修改!");
			}
			$.ajax({
		         //发送请求URL，可使用相对路径也可使用绝对路径
		         url:"<%=basePath%>/modifyOldRPR?rprKey="+selectObjs[0].value,
		         //发送方式为GET，也可为POST，需要与后台对应
		         type:"GET",
		         //设置接收格式为JSON
		         dataType:"json",
		         //编码设置
		         contentType:"application/json;charset=utf-8",
		         //后台返回成功后处理数据，data为后台返回的json格式数据
		         success:function(data){
		        	 if(data.length>0){
		        		 $("#PRPKey").val(data[0].rprKey);
		        		 $("#RPRCmId").val(data[0].cmId);
		        		 $("#RPRType").val(data[0].rprType);
		        		 $("#RPRSub").val(data[0].rprSub);
		        		 $("#RPRDate").val(data[0].rprDate);
		        		 $("#RPRUnit").val(data[0].rprUnit);
		        		 $("#RPRAperson").val(data[0].rprAperson);
		        		 $("#RPRRdate").val(data[0].rprRdate);
		        		 $("#RPRAreson").val(data[0].rprAreson);
		        		 $("#RPRRemark").text(data[0].rprRemark);
		        		 $("#RPRAttachment").val(data[0].rprAttachment);
		        		
		        	 }
		         }
		   });
		
		
		
		}else if(scanLog == 7){
			document.getElementById('light7').style.display = 'block';
		}else if(scanLog == 8){
			//修改考核记录
			var objs=document.getElementsByName("assId");//获取复选框的考核记录key
			var selectObjs=[];
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked){		
					selectObjs.push(objs[i]);
				};
			}
			//只允许有一个选中
			if(selectObjs.length==1){
				document.getElementById('assHidden').value=selectObjs[0].value;
				document.getElementById('light8').style.display = 'block';
			}else if(selectObjs.length==0){
				alert("必须选择一项纪录修改!");
			}else{
				alert("只能选择一项纪录修改!");
			}
			$.ajax({
		         //发送请求URL，可使用相对路径也可使用绝对路径
		         url:"<%=basePath%>/modifyAss?assKey="+selectObjs[0].value,
		         //发送方式为GET，也可为POST，需要与后台对应
		         type:"GET",
		         //设置接收格式为JSON
		         dataType:"json",
		         //编码设置
		         contentType:"application/json;charset=utf-8",
		         //后台返回成功后处理数据，data为后台返回的json格式数据
		         success:function(data){
		        	 if(data.length>0){
		        		 $("#ASSKey").val(data[0].assKey);
		        		 $("#ASSCmId").val(data[0].cmId);
		        		 $("#ASSTime").val(data[0].assTime);
		        		 $("#ASSSub").val(data[0].assSub);
		        		 $("#ASSPeriod").val(data[0].assPeriod);
		        		 $("#ASSResult").val(data[0].assResult);
		        		 $("#ASSAppraisal").val(data[0].assAppraisal);
		        		 $("#ASSUnit").val(data[0].assUnit);
		        		 $("#ASSRemark").val(data[0].assRemark);
		        		 $("#ASSAttachment").val(data[0].assAttachment);
		        		
		        	 }
		         }
		   });		
	    }else if(scanLog == 9){
			document.getElementById('light9').style.display = 'block';
		}else if(scanLog == 10){
			//修改学习培训记录
			var objs=document.getElementsByName("ltrId");//获取复选框的学习培训记录的key
			var selectObjs=[];
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked){		
					selectObjs.push(objs[i]);
				};
			}
			//只允许有一个选中
			if(selectObjs.length==1){
				document.getElementById('ltrHidden').value=selectObjs[0].value;
				document.getElementById('light10').style.display = 'block';
			}else if(selectObjs.length==0){
				alert("必须选择一项纪录修改!");
			}else{
				alert("只能选择一项纪录修改!");
			}
			$.ajax({
		         //发送请求URL，可使用相对路径也可使用绝对路径
		         url:"<%=basePath%>/modifyLearnTranRecord?ltrKey="+selectObjs[0].value,

		         //发送方式为GET，也可为POST，需要与后台对应
		         type:"GET",
		         //设置接收格式为JSON
		         dataType:"json",
		         //编码设置
		         contentType:"application/json;charset=utf-8",
		         //后台返回成功后处理数据，data为后台返回的json格式数据
		         success:function(data){
		        	 if(data.length>0){
		        		 $("#LTRKey").val(data[0].ltrKey);
		        		 $("#LTRCmId").val(data[0].cmId);
		        		 $("#LTRDate").val(data[0].ltrDate);
		        		 $("#LTRSub").val(data[0].ltrSub);
		        		 $("#LTRUnit").val(data[0].ltrUnit);
		        		 $("#LTRStartDate").val(data[0].ltrStartDate);
		        		 $("#LTREndDate").val(data[0].ltrEndDate);
		        		 $("#LTRKnow").val(data[0].ltrKnow);
		        		 $("#LTRCredit").val(data[0].ltrCredit);
		        		 $("#LTRScore").val(data[0].ltrScore);
		        		 $("#LTRAttachment").val(data[0].ltrAttachment);
		        		 $("#LTRRemark").val(data[0].ltrRemark);
		        		
		        	 }
		         }
		   });		
		}else if(scanLog == 11){
			document.getElementById('light11').style.display = 'block';
		}else if(scanLog == 12){
			//修改等级认定记录
			var objs=document.getElementsByName("levelId");//获取复选框的学习培训记录的key
			var selectObjs=[];
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked){		
					selectObjs.push(objs[i]);
				};
			}
			//只允许有一个选中
			if(selectObjs.length==1){
				document.getElementById('levelHidden').value=selectObjs[0].value;
				document.getElementById('light12').style.display = 'block';
			}else if(selectObjs.length==0){
				alert("必须选择一项纪录修改!");
			}else{
				alert("只能选择一项纪录修改!");
			}
			$.ajax({
		         //发送请求URL，可使用相对路径也可使用绝对路径
		         url:"<%=basePath%>/modifyOldLevel?leKey="+selectObjs[0].value,

		         //发送方式为GET，也可为POST，需要与后台对应
		         type:"GET",
		         //设置接收格式为JSON
		         dataType:"json",
		         //编码设置
		         contentType:"application/json;charset=utf-8",
		         //后台返回成功后处理数据，data为后台返回的json格式数据
		         success:function(data){
		        	 if(data.length>0){
		        		 $("#LEKey").val(data[0].leKey);
		        		 $("#LECmId").val(data[0].cmId);
		        		 $("#LEDate").val(data[0].leDate);
		        		 $("#LELevel").val(data[0].leLevel);
		        		 $("#LEType").val(data[0].leType);
		        		 $("#LEAttachment").val(data[0].leAttachment);
		        		
		        	 }
		         }
		   });				}else if(scanLog == 13){
			document.getElementById('light13').style.display = 'block';
		}else if(scanLog == 14){
			//修改工作经历
			var objs=document.getElementsByName("workId");//获取复选框的学习培训记录的key
			var selectObjs=[];
			for(var i=0;i<objs.length;i++){
				if(objs[i].checked){		
					selectObjs.push(objs[i]);
				};
			}
			//只允许有一个选中
			if(selectObjs.length==1){
				document.getElementById('workHidden').value=selectObjs[0].value;
				document.getElementById('light14').style.display = 'block';
			}else if(selectObjs.length==0){
				alert("必须选择一项纪录修改!");
			}else{
				alert("只能选择一项纪录修改!");
			}
			$.ajax({
		         //发送请求URL，可使用相对路径也可使用绝对路径
		         url:"<%=basePath%>/modifyOldWork?workKey="+selectObjs[0].value,

		         //发送方式为GET，也可为POST，需要与后台对应
		         type:"GET",
		         //设置接收格式为JSON
		         dataType:"json",
		         //编码设置
		         contentType:"application/json;charset=utf-8",
		         //后台返回成功后处理数据，data为后台返回的json格式数据
		         success:function(data){
		        	 if(data.length>0){
		        		 $("#WORKKey").val(data[0].workKey);
		        		 $("#WORKCmId").val(data[0].cmId);
		        		 $("#WORKDate").val(data[0].workDate);
		        		 $("#WORKPosition").val(data[0].workPosition);
		        		 $("#WORKUnit").val(data[0].workUnit);
		        		 $("#WORKWork").val(data[0].workWork);
		        		
		        	 }
		         }
		   });
			
		}
	}
	function closeWindow(id) {
		document.getElementById(id).style.display = 'none';
	}
</script>
<div id="light1" class="firstScan_main">
    <form action="addClientMgrResult" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加年度工作业绩</span></div>
    
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value=""/> </li>
    <li><label>工作年度</label><input name="cmrYear" type="text" class="dfinput" value=""/> </li>
    <li><label>工作业绩</label><input name="cmrResult" type="text" class="dfinput" value=""/> </li>
    <li><label>附件依据</label><input name="upload" type="file" class="dfinputfile"/></li>
    
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light1')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light2" class="firstScan_main">
    <form action="modifyCmrResult" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改年度工作业绩</span></div>
   <input type="hidden" name="cmrModiPerson" value="${user.username }"/>
    <input id="resultHidden" name="cmrKey" type="hidden" class="dfinput" value=""/> 
    <ul class="forminfo">
    <li><label>客户经理编号</label><input name="cmId" id="resultCmId" type="text" class="dfinput" value="" readonly /> </li>
    <li><label>工作年度</label><input name="cmrYear" id="resultCmrYear" type="text" class="dfinput" value=""/> </li>
    <li><label>工作业绩</label><input name="cmrResult" id="resultCmrResult" type="text" class="dfinput" value=""/> </li>
    <li><label>附件依据</label><input name="upload" type="file" class="dfinputfile" id="resultCmrAttach"/>
    <li>&nbsp;&nbsp;
    <input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light2')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light3" class="firstScan_main">
    <form action="addCertificate" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加证件</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="cetModiPerson" value="${user.username}"/>
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value=""/> </li>
    <li><label>证书名称</label><input name="cetName" type="text" class="dfinput" value=""/> </li>
    <li><label>证书类型</label>
    <div class="vocation">
    <select class="select1" name="cetType">
    <option value="">请选择</option>
    <c:forEach items="${certificateTypeParam}" var="cetType">
	   <option value="${cetType.key}">${cetType.value}</option>
	 </c:forEach>
    </select></div></li>
    <li><label>证书编号</label><input name="cetNo" type="text" class="dfinput" value=""/> </li>
    <li><label>发证单位</label><input name="cetUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>发证时间</label><input name="cetDate" type="text" class="dfinput" value=""/> </li>
    <li><label>失效时间</label><input name="cetEndDate" type="text" class="dfinput" value=""/> </li>
    <li><label>有效性</label>
    <input name="cetPeriod" type="radio" value="1" checked="checked" />有效&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="cetPeriod" type="radio" value="2" />无效</cite></li>
    <li><label>备注</label><input name="cetRemark" type="text" class="dfinput" value=""/> </li>
    <li><label>作废标识</label><input name="cetInvalid" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light3')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light4" class="firstScan_main">
    <form action="modifyCertificate" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改证件</span></div>
    
    <ul class="forminfo">
    <input id="CetKey" name="cetKey" type="hidden" class="dfinput" value=""/> 
    <input type="hidden" value="${user.username}" name="cetModiPerson" />
    <li><label>客户经理编号</label><input name="cmId" id="CetCmId" type="text" class="dfinput" value="" readonly/> </li>
    <li><label>证书名称</label><input name="cetName" id="CetName" type="text" class="dfinput" value=""/> </li>
    <li><label>证书类型</label><div class="vocation" >
    <select class="select1" name="cetType">
    <option value="">请选择</option>
       <c:forEach items="${certificateTypeParam}" var="cetType">
	   <option value="${cetType.key}" >${cetType.value}</option>
	 </c:forEach>
    </select></div></li>
    <li><label>证书编号</label><input name="cetNo" id="CetNo" type="text" class="dfinput" value=""/> </li>
    <li><label>发证单位</label><input name="cetUnit" id="CetUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>发证时间</label><input name="cetDate" id="CetDate" type="text" class="dfinput" value=""/> </li>
    <li><label>失效时间</label><input name="cetEndDate" id="CetEndDate" type="text" class="dfinput" value=""/> </li>
    <li><label>有效性</label>
    <input name="cetPeriod" type="radio" value="1" checked="checked" />有效&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="cetPeriod" type="radio" value="2" />无效</cite></li>
    <li><label>备注</label><input name="cetRemark" id="CetRemark" type="text" class="dfinput" value=""/> </li>
    <li><label>作废标识</label><input name="cetInvalid" id="CetInvalid" type="text" class="dfinput" value=""/> </li>    
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1" id="CetUrl"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light4')"/></li>
    </ul>
    </div>
    </form>
</div>
		        		
<div id="light5" class="firstScan_main">
    <form action="addRPR" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加奖惩记录</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="rprModiPerson" value="${user.username}"/> 
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩分类</label><input name="rprType" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩内容</label><input name="rprSub" type="text" class="dfinput" value=""/> </li>
    <li><label>生效日期</label><input name="rprDate" type="text" class="dfinput" value=""/> </li>
    <li><label>审批单位</label><input name="rprUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>审批人</label><input name="rprAperson" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销日期</label><input name="rprRdate" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销原因</label><input name="rprAreson" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="rprRemark" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light5')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light6" class="firstScan_main">
    <form action="modifyRPR" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改奖惩记录</span></div>
    
    <ul class="forminfo">
    <input name="rprModiPerson" type="hidden" value="${user.username }"/>
    <input id="rprHidden" name="rprKey" type="hidden" class="dfinput" value=""/> 
    <li><label>客户经理编号</label><input name="cmId" id="RPRCmId" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩分类</label><input name="rprType" id="RPRType" type="text" class="dfinput" value=""/> </li>
    <li><label>奖惩内容</label><input name="rprSub" id="RPRSub" type="text" class="dfinput" value=""/> </li>
    <li><label>生效日期</label><input name="rprDate" id="RPRDate" type="text" class="dfinput" value=""/> </li>
    <li><label>审批单位</label><input name="rprUnit" id="RPRUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>审批人</label><input name="rprAperson" id="RPRAperson" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销日期</label><input name="rprRdate" id="RPRRdate" type="text" class="dfinput" value=""/> </li>
    <li><label>撤销原因</label><input name="rprAreson" id="RPRAreson" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="rprRemark" id="RPRRemark" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light6')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light7" class="firstScan_main">
    <form action="addAssess" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加考核记录</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="assModiPerson" value="${user.username}"/>
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value=""/> </li>
    <li><label>考核时间</label><input name="assTime" type="text" class="dfinput" value=""/> </li>
    <li><label>考核内容</label><input name="assSub" type="text" class="dfinput" value=""/> </li>
    <li><label>考核期间</label><input name="assPeriod" type="text" class="dfinput" value=""/> </li>
    <li><label>考核结果</label><input name="assResult" type="text" class="dfinput" value=""/> </li>
    <li><label>考核评价</label><input name="assAppraisal" type="text" class="dfinput" value=""/> </li>
    <li><label>考核单位</label><input name="assUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="assRemark" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light7')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light8" class="firstScan_main">
    <form action="modifyAssess" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改考核记录</span></div>
    
    <ul class="forminfo">
    <input id="assHidden" name="assKey" type="hidden" class="dfinput" value=""/> 
    <input type="hidden" name="assModiPerson" value="${user.username}" /> 
    <li><label>客户经理编号</label><input name="cmId" id="ASSCmId" type="text" class="dfinput" value=""/> </li>
    <li><label>考核时间</label><input name="assTime" id="ASSTime" type="text" class="dfinput" value=""/> </li>
    <li><label>考核内容</label><input name="assSub" id="ASSSub" type="text" class="dfinput" value=""/> </li>
    <li><label>考核期间</label><input name="assPeriod" id="ASSPeriod" type="text" class="dfinput" value=""/> </li>
    
    <li><label>考核结果</label><input name="assResult" id="ASSResult" type="text" class="dfinput" value=""/> </li>
    <li><label>考核评价</label><input  name="assAppraisal" id="ASSAppraisal" type="text" class="dfinput" value=""/> </li>
    <li><label>考核单位</label><input  name="assUnit" type="text" id="ASSUnit" class="dfinput" value=""/> </li>
    <li><label>备注</label><input name="assRemark" id="ASSRemark" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light8')"/></li>
    </ul>
    </div>
    </form>
</div>	
<div id="light9" class="firstScan_main">
    <form action="addLTR" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加学习培训记录</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="ltrModiPerson" value="${user.username}"/>
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value=""/> </li>
    <li><label>培训时间</label><input name="ltrDate" type="text" class="dfinput" value=""/> </li>
    <li><label>科目</label><input name="ltrSub" type="text" class="dfinput" value=""/> </li>
    <li><label>培训单位</label><input name="ltrUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>开始日期</label><input name="ltrStartDate" type="text" class="dfinput" value=""/> </li>
    <li><label>结束日期</label><input name="ltrEndDate" type="text" class="dfinput" value=""/> </li>
    <li><label>学时</label><input name="ltrKnow" type="text" class="dfinput" value=""/> </li>
    <li><label>学分</label><input name="ltrCredit" type="text" class="dfinput" value=""/> </li>
    <li><label>成绩</label><input name="ltrScore" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li><label>备注</label><input name="ltrRemark" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light9')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light10" class="firstScan_main">
    <form action="modifyLTR" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改学习培训记录</span></div>
    
    <ul class="forminfo">
    <input id="ltrHidden" name="ltrKey" type="hidden" class="dfinput" value=""/> 
    <input type="hidden" name="ltrModiPerson" value="${user.username }" />
    <li><label>客户经理编号</label><input name="cmId" id="LTRCmId" type="text" class="dfinput" value="" readonly/> </li>
    <li><label>培训时间</label><input name="ltrDate" id="LTRDate" type="text" class="dfinput" value=""/> </li>
    <li><label>科目</label><input name="ltrSub" id="LTRSub" type="text" class="dfinput" value=""/> </li>
    <li><label>培训单位</label><input name="ltrUnit" id="LTRUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>开始日期</label><input name="ltrStartDate" id="LTRStartDate" type="text" class="dfinput" value=""/> </li>
    <li><label>结束日期</label><input name="ltrEndDate" id="LTREndDate" type="text" class="dfinput" value=""/> </li>
    <li><label>学时</label><input name="ltrKnow" id="LTRKnow" type="text" class="dfinput" value=""/> </li>
    <li><label>学分</label><input name="ltrCredit" id="LTRCredit" type="text" class="dfinput" value=""/> </li>
    <li><label>成绩</label><input name="ltrScore" id="LTRScore" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li><label>备注</label><input name="ltrRemark" id="LTRRemark" type="text" class="dfinput" value=""/> </li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light10')"/></li>
    </ul>
    </div>
    </form>
</div>

<div id="light11" class="firstScan_main">
    <form action="addLevel" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加等级认定记录</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="leModiPerson" value="${user.username}"/>
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value=""/> </li>
    <li><label>认定时间</label><input name="leDate" type="text" class="dfinput" value=""/> </li>
    <li><label>认定级别</label><input name="leLevel" type="text" class="dfinput" value=""/> </li>
    <li><label>认定类型</label><input name="leType" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light11')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light12" class="firstScan_main">
    <form action="modifyLevel" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改等级认定记录</span></div>
    
    <ul class="forminfo">
    <input id="levelHidden" name="leKey" type="hidden" class="dfinput" value=""/>
    <input type="hidden" name="leModiPerson" value="${user.username }"/>
    <li><label>客户经理编号</label><input name="cmId" id="LECmId" type="text" class="dfinput" value="" readonly/> </li>
    <li><label>认定时间</label><input name="leDate" id="LEDate" type="text" class="dfinput" value=""/> </li>
    <li><label>认定级别</label><input name="leLevel" id="LELevel" type="text" class="dfinput" value=""/> </li>
    <li><label>认定类型</label><input name="leType" id="LEType" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light12')"/></li>
    </ul>
    </div>
    </form>
</div>
<div id="light13" class="firstScan_main">
    <form action="addWork" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>添加工作经历</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="workModiPerson" value="${user.username }"/>
    <li><label>客户经理编号</label><input name="cmId" type="text" class="dfinput" value=""/> </li>
    <li><label>任职日期</label><input name="workDate" type="text" class="dfinput" value=""/> </li>
    <li><label>职务</label><input name="workPosition" type="text" class="dfinput" value=""/> </li>
    <li><label>单位</label><input name="workUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>工作经历</label><input name="workWork" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light13')"/></li>
    </ul>
    </div>
    </form>
</div> 
<div id="light14" class="firstScan_main">
    <form action="modifyWork" method="post" enctype="multipart/form-data">
    <div class="formbody">
    <div class="formtitle"><span>修改工作经历</span></div>
    
    <ul class="forminfo">
    <input type="hidden" name="workModiPerson" value="${user.username }"/>
    <input id="workHidden" name="workKey" type="hidden" class="dfinput" value=""/>
    <li><label>客户经理编号</label><input name="cmId" id="WORKCmId" type="text" class="dfinput" value=""/> </li>
    <li><label>任职日期</label><input name="workDate" id="WORKDate" type="text" class="dfinput" value=""/> </li>
    <li><label>职务</label><input name="workPosition" id="WORKPosition" type="text" class="dfinput" value=""/> </li>
    <li><label>单位</label><input name="workUnit" id="WORKUnit" type="text" class="dfinput" value=""/> </li>
    <li><label>工作经历</label><input name="workWork" id="WORKWork" type="text" class="dfinput" value=""/> </li>
    <li><label>附件上传</label><input name="upload" type="file" class="dfselect1"/></li>
    <li>&nbsp;&nbsp;<input name="" type="submit" class="btn" value="修改"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input name="" type="reset" class="btn" value="关闭" onclick="closeWindow('light14')"/></li>
    </ul>
    </div>
    </form> 
</div>   
	</div> 
 
	<script type="text/javascript"> 
      $("#usual1 ul").idTabs(); 
    </script>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
        
    </div>

</body>

</html>
