<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统公告总览</title>
	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/themes/gray/easyui.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/jquery.easyui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
	
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
                sortName: 'type',
                sortOrder: 'asc',
                remoteSort: true,
                idField: 'id',
                checkOnSelect:false, 
                method:'get',
                frozenColumns :[[
					{field :'ck',checkbox : true}, 
				]],
				columns: [[
				//{field : 'id', title : '编号',width :160,align:'center'},
				{field : 'title', title : '标题',width :336,align:'center'},
				{field : 'time',title : '发布时间',width : 160,align:'center'},
				{field : 'type',title : '新闻类型',width : 160,align:'center'},
				 { field: 'opt', title: '操作', width: 160, align: 'center',
                    formatter: function (value,row,index) {
                    	return "<a href='<%=request.getContextPath()%>/ManageNews/detail?id="+row.id+"'>查看详情</a>";  
                    }
                }
              
          		]],
          		toolbar: [{//在dategrid表单的头部添加按钮
              	  text: "新建系统公告",
              	  iconCls: "icon-add",
              	  handler: function () {
              		window.location.href='<%=request.getContextPath()%>/jsp/blackManage/sysManagement/sysgonggaoDeliver.jsp'; 
              	  }
                },'-',
                {
                	text: "删除系统公告",
              	  iconCls: "icon-cut",
              	  handler: function () {
              		  var post= $('#roleList').datagrid('getChecked');
              		  if(post.length==0){
              			  alert("提示：\n\n请选择删除对象");
              		  }
              		  else{
              		  var id = new Array(post.length);
              		  for(var i=0;i<post.length;i++){
              			  id[i]=post[i].id;
              		  }              		
                    $.ajax({
                        url:'<%=request.getContextPath()%>/ManageNews/deleteNewsInfo',
                        data:{"remove":id},
                        type: 'post',
                        dataType : "text",
                        traditional:true,
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	       			alert(XMLHttpRequest.status);
        	       			alert(XMLHttpRequest.readyState);
        	       			alert(textStatus);
        	       		},
               			   
                        success: function (msg) {
                        	
                        	sear();
         				
                        }
                    });
                    $('#roleList').datagrid('clearSelections').datagrid("clearChecked");
              	  }
              	  }                  
                }],
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
                url:'<%=request.getContextPath()%>/ManageNews/list',
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
        
        function getDataUpdate(pageNum, pageSize){
			var opts = $('#roleList').datagrid('options');
        	var sort=opts.sortName;
        	var order=opts.sortOrder;
			$.ajax({
                url:'<%=request.getContextPath()%>/ManageNews/list',
                data:{"pageNum":pageNum,"pageSize":pageSize,"sort":sort,"order":order},
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
     <div class="topnav"  >
	   <div  class="path" >
	      <span ><font>当前位置:</font></span>
	      <span ><font >系统管理&nbsp;&nbsp; &gt;&nbsp;&nbsp;系统公告</font></span>
	   </div>
     </div> 
		 
    <div class="context" style="width:870px;">
     <div class="titlebox" style="width:100%; margin:0 auto;"><span class="title" >系统公告总览</span></div>
       	<!-- 显示总览 -->
		<table id="roleList" style="width:100%;" >
	    
	    </table>
	    
	
   </div>   
 	     
 </div>
</body>
</html>