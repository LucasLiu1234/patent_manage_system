<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科技项目结题总览</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/table.css">
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

$(function () {
            
            
            
            $('#roleList').datagrid({
            	
                title: '',
                loadMsg: "数据加载中，请稍后……",
                nowrap: false,
                striped: true,
                collapsible: true,
               	
                pageList: [10, 20,30,50],
                pageSize: 10,
                sortName: 'project',
                sortOrder: 'asc',
                remoteSort: true,
                idField: 'CODE',
                checkOnSelect:false, 
                method:'get',
                frozenColumns :[[
					{field :'ck',checkbox : true}, 
				]],
				columns: [[    
				//{field : 'state', title : '审核进度',width :160,align:'center'},
				//{field : 'CODE', title : '编号',width :160,align:'center'},
				{field : 'title', title : '科技项目名称',width :336,align:'center'},
				{field : 'project', title : '计划类别',width :336,align:'center',sortable:true},
				{field : 'field', title : '技术领域',width :160,align:'center'},
				{field : 'year',title : '计划年度',width : 160,align:'center',sortable:true},
				 { field: 'opt', title: '详情了解', width: 160, align: 'center',
                    formatter: function (value,row,index) {
                    	return "<a href='#' onclick='alert("+index+")'>查看详情</a>";  
                    }
                },
                { field: 'exp', title: '专家评审', width: 160, align: 'center',
                    formatter: function (value,row,index) {
                    	if(row.state=="1"){
                    		return "<a href='#' onclick='alert("+index+")'>评审专家分配</a>";  
                    	}
                    }
                },
          		]],
                pagination: true,
                rownumbers: true,
                onSortColumn:function(sort, order){
                	sear();
                },
                onLoadSuccess: function () {
                	
                    $('.datagrid-toolbar').append($('#txtSearch'));
                    $('#txtSearch').show();
                }
            });
            sear();
        	$('#roleList').datagrid('getPager').pagination( {
        		pageList: [10, 20,30,50],
                pageSize: 10,
				beforePageText : '第',
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示从{from}到{to}共{total}记录',
				onBeforeRefresh : function(pageNumber, pageSize) {
					$('#roleList').datagrid('clearSelections').datagrid("clearChecked");
					
				},
				onSelectPage:function(pageNum, pageSize){
					var gridOpts = $('#roleList').datagrid('options');
					gridOpts.pageNumber = pageNum; 
					gridOpts.pageSize = pageSize;
					sear();
				}
				

			});
                                                 
            });
        function getSelections() {
            var ids = [];
            var rows = $('#roleList').datagrid('getSelections');
            for (var i = 0; i < rows.length; i++) {
                ids.push(rows[i].RoleCode);
            }
            return ids.join(',');
        }
        function sear(){
        	var opts = $('#roleList').datagrid('options');
        	var page=opts.pageNumber;
        	var size=opts.pageSize;
        	var sort=opts.sortName;
        	var order=opts.sortOrder;
            $.ajax({
                url:'<%=request.getContextPath()%>/test/test9.json',
                data:{"pageNum":page,"pageSize":size,"sort":sort,"order":order},
                type: 'post',
                dataType : "text",
            	error: function(XMLHttpRequest, textStatus, errorThrown) {
	       			alert(XMLHttpRequest.status);
	       			alert(XMLHttpRequest.readyState);
	       			alert(textStatus);
	       		},
       			   
                success: function (msg) {
                	
                	var result = eval("("+msg+")");
					
 						$("#roleList").datagrid("loadData",result);
 					
                    
             
                }
            });
        }
 </script>



</head>

<body>

	<div>
		<div class="topnav">
			<div class="path">
				<span><font>当前位置:</font></span> <span><font>科技项目管理&nbsp;&nbsp;
						&gt;&nbsp;&nbsp;结题评审</font></span>
			</div>
		</div>

		<div class="context" style="width: 1200px;">
			<div class="titlebox" style="width: 100%; margin: 0 auto;">
				<span class="title">结题项目总览</span>
			</div>
			<!-- 显示总览 -->
			<table id="roleList" style="width: 100%;">

			</table>


		</div>

	</div>
</body>
</html>