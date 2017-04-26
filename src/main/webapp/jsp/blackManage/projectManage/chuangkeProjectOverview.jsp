<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创客作品总览</title>
	
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
                sortName: 'DATE',
                sortOrder: 'asc',
                remoteSort: true,
                idField: 'id',
                checkOnSelect:false, 
                singleSelect:true, 
                method:'get',
                frozenColumns :[[
					{field :'ck',checkbox : true}, 
				]],
				columns: [[
				//{field : 'id', title : '编号',width :160,align:'center'},
				{field : 'title', title : '创客项目名称',width :336,align:'center'},
				{field : 'team',title : '团队名称',width : 208,align:'center'},
				{field : 'field',title : '项目领域',width : 160,align:'center'},
				{field : 'contack',title : '联系人',width : 160,align:'center'},
				{field: 'opt', title: '操作', width: 160, align: 'center',
                    formatter: function (value,row,index) {
                    	return "<a href='<%=request.getContextPath()%>/maker/getMakerCommonWorkDetailAndComments?id="+ row.id +"'>项目详情查看</a>";  
                    }
                }
          		]],
          		toolbar: [
                	  {
                		  text: '<select style="width:230px;" id="state"  name="state"><option value="0">待回复作品</option><option value="1">已回复作品</option></select>',
                	  },
                	  {
                		text: "搜索",
                  	  iconCls: "icon-search",
                  	  handler: function () {
                  		var gridOpts = $('#roleList').datagrid('options');
    					gridOpts.pageNumber = 1; 
                  		sear();
                  	  }
                	  }
                  ],
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
function sub(rowIndex){  
    $('#roleList').datagrid('selectRow',rowIndex);  
   var row = $('#roleList').datagrid('getSelected'); 
   document.getElementById("id").value=row.CODE;
   return true;     
}
function sear(){
	var opts = $('#roleList').datagrid('options');
	var page=opts.pageNumber;
	var size=opts.pageSize;
	var sort=opts.sortName;
	var order=opts.sortOrder;
	var state=document.getElementById("state").value;
    $.ajax({
        url:'<%=request.getContextPath()%>/maker/getMakerCommonWorkListForAdminByState',
        data:{"pageNum":page,"pageSize":size,"pageSort":sort,"pageOrder":order,"state":state},
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
	      <span ><font >项目管理&nbsp;&nbsp; &gt;&nbsp;&nbsp;创客原创管理</font></span>
	   </div>
     </div> 
	<form action="#" name="Form1" id="Form1">
       	<input type="hidden" id="id" name="id">	 
    <div class="context" style="width:1085px">
     <div class="titlebox" style="width:100%; margin:0 auto;"><span class="title" >创客原创作品一览表</span></div>
		<table id="roleList" style="width:100%;" >
	    
	    </table>
	   
	
   </div>   
 	 </form>     
 </div>
</body>
</html>