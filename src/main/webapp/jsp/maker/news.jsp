<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻与通告</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/news.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/themes/icon.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/themes/gray/easyui.css" />
<script
	src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/jquery.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/jquery.easyui.min.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var hid;
	if("${detail.fujianName}"==""){
		hid=1;
	}
	if(hid==1){
		$('#attach').hide();
	}
});
</script>
</head>
<body>
	<div>
		<div class="topnav">
			<div class="path">
				<span><font>当前位置:</font></span> <span><font>信息与公告&nbsp;&nbsp;
						&gt;&nbsp;&nbsp;${detail.type}</font></span>
			</div>
		</div>
		<div class="context" style="width: 90%">
			<div style="margin: 0px auto; width: 100%">
				<h2 style="margin: 0px auto; text-align: center; font-size: 30px">${detail.title}</h2>
				<div style="margin: 0px auto; text-align: center; color: #C1C1C1;">${detail.time}</div>
			</div>
			<div style="height: 30px">&nbsp;</div>
			<div
				style="word-wrap: break-word; word-break: break-all; margin: 0 auto; width: 100%;">
				<pre style="width: 100%; white-space: pre-wrap; font-size: 16px">${detail.content} </pre>
			</div>
			<div style="height: 30px">&nbsp;</div>
			<div>
				<a href="javascript:void(document.Form1.submit())" id="attach"
					name="attach" style="height: 25px; width: 150px; font-size: 14px;"
					class="easyui-linkbutton" onclick="return sub();">相&nbsp;关&nbsp;附&nbsp;件&nbsp;下&nbsp;载</a>
			</div>
		</div>
	</div>
</body>
</html>