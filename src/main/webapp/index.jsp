<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
<!-- Math.floor() 返回小于或等于一个给定数字的最大整数。 -->
<script type="text/javascript">
  function init(){
	  var dom = document.getElementById("container");
	  // 基于准备好的dom，初始化echarts实例
	  var myChart = echarts.init(dom);
	  var option = null;
	 $.ajax({
			url:"<%=basePath%>userStat",
			dataType : "json",
			//编码设置
			contentType : "application/json;charset=utf-8",
			success : function(data) {
				var len = data.length;
			    var type = new Array(len);
			    var count= new Array(len);
				for(var i=0;i<len;i++){
					type[i]= data[i].type=='F'?"女性":"男性";
					count[i]= data[i].count;
				}
			   var option = {
					  title:{
						  text:'用户性别统计柱状图'
					  },
					  tooltip:{
						  
					  },
				      xAxis: {
				          type: 'category',
				          data: type
				      },
				      yAxis: {
				          type: 'value'
				      },
				      series: [{
				          data: count,
				          type: 'bar',
				          itemStyle: {
							normal: {
								// 随机显示
								color: function(d) {
									return "#" + Math.floor(Math.random() * (256 * 256 * 256 - 1)).toString(16);
								}
							},
						}
				      }]
				  };
			   myChart.setOption(option);
			},
			error:function(){
				alert("后台服务器出错，请联系系统管理员！");
			}
		})
  }

</script>
</head>


<body onload="init()">

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="images/sun.png" alt="天气" /></span>
    <b>${userCheck.username }早上好，欢迎访问客户经理信息管理系统</b>
    
    </div>
     <!--按照用户的性别生成一个柱状图 -->
      <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="container" style="width:800px;height:500px">
       
    </div>
    
    

</body>

</html>
