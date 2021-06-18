<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%   
    String path = request.getContextPath();   
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
    %>   
    <base href="<%=basePath%>" >
<title>批量导入客户经理</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/jquery-form.js"></script>
<script type="text/javascript">
function checkData(){  
    var fileDir = $("#upfile").val();  
    var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
     if("" == fileDir){  
               alert("选择需要导入的Excel文件！");  
               return false;  
         }  
      if(".xls" != suffix && ".xlsx" != suffix ){  
               alert("选择Excel格式的文件导入！");  
                return false;  
           }  
      return true;  
  }
$(document).ready(function(){ 
    $("#btn").click(function(){ 
    if(checkData()){  
            $('#form1').ajaxSubmit({    
                        url:'<%=basePath %>uploadExcel',  
                        dataType: 'text',  
                        success: resutlMsg,  
                        error: errorMsg  
               });   
               function resutlMsg(msg){  
                     alert(msg);     
                     $("#upfile").val("");  
                }  
               function errorMsg(){   
                  alert("导入excel出错！");      
                }  
             }    
        }); 
      
});  
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">批量导入</a></li>
    </ul>
    </div>
     <div class="formbody">
      <div class="formtitle"><span>导入客户经理数据</span></div>
      <form action="" method="POST" enctype="multipart/form-data" id="form1">
	    <ul class="forminfo">
	    <li><label>选择文件路径:</label><input id="upfile" name="upfile" type="file" class="dfinputfile" /></li>
	     <li><label>&nbsp;</label><input name="" type="button" id="btn" class="btn" value="导入"/></li>
	    </ul>
    </form>
    
    </div>

</body>

</html>
