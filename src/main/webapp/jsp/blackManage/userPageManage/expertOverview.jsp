<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>专家用户信息总览</title>
	
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
                idField: 'RoleCode',
                checkOnSelect:false, 
                singleSelect:true, 
                method:'get',
                frozenColumns :[[
					{field :'ck',checkbox : true}, 
				]],
				columns: [[
				//{field : 'CODE', title : '编号',width :160,align:'center'},
				{field : 'Name', title : '专家姓名',width :336,align:'center'},
				{field : 'Major',title : '领域专长',width : 208,align:'center',sortable:true},
				{field : 'Telephone',title :'联系方式',width : 160,align:'center'},  
				{field : 'Email',title : '电子邮箱',width : 160,align:'center'},
				 { field: 'opt', title: '详情了解', width: 160, align: 'center',
                    formatter: function (value,row,index) {
                    	return "<a href='javascript:void(document.Form1.submit())' onclick='return sub("+index+")'>查看详情</a>";  
                    }
                }
              
          		]],
          		toolbar: [
                	  {
                		text: '<input  type="text" style="width:150px;margin-right:20px" id="state"  name="state" form="Form1" placeholder="请输入专家姓名查询">',
                	  },'-',
                	  {
                	  text: "搜索",
                	  border:true,
                  	  iconCls: "icon-search",
                  	  handler: function () {
                  		  sear();
                  	  }
                	  },{
                		  text:'<div style="float:right;width:600px;visibility:hidden"></div>'
                		  
                	  },
                	  {
                      	  text: "添加专家用户",
                      	  iconCls: "icon-add ",
                      	  handler: function () {
                      		window.location.href=""; 
                      	  }
                        },'-',
                	  {
                      	  text: "删除专家用户",
                      	  iconCls: "icon-cut",
                      	  handler: function () {
                      		  var post= $('#roleList').datagrid('getSelections');
                      		  var id = new Array([post.length]);
                      		  for(var i=0;i<post.length;i++){
                      			  id[i]=post[i].CODE;
                      			  alert(id[i]);
                      		  }
                      		var opts = $('#roleList').datagrid('options');
                        	var page=opts.pageNumber;
                        	var size=opts.pageSize;
                        	var sort=opts.sortName;
                        	var order=opts.sortOrder;
                            $.ajax({
                                url:'<%=request.getContextPath()%>/test/test9.json',
                                data:{"pageNum":page,"pageSize":size,"sort":sort,"order":order,"remove":id},
                                type: 'post',
                                dataType : "text",
                                traditional:true,
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
                            $('#roleList').datagrid('clearSelections').datagrid("clearChecked");
                      	  }                  
                        }
                  ],
                pagination: true,
                rownumbers: true,
                onSortColumn:function(sort, order){
                	var opts = $('#roleList').datagrid('options');
                	var page=opts.pageNumber;
                	var size=opts.pageSize;
                	var state=document.getElementById("state").value;
                	$.ajax({
                        url:'<%=request.getContextPath()%>/test/test10.json',
                        data:{"pageNum":page,"pageSize":size,"sort":sort,"order":order,"state":state},
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
                },
                onLoadSuccess: function () {
                	
                    $('.datagrid-toolbar').append($('#txtSearch'));
                    $('#txtSearch').show();
                }
            });
            var opts = $('#roleList').datagrid('options');
        	var page=opts.pageNumber;
        	var size=opts.pageSize;
        	var sort=opts.sortName;
        	var order=opts.sortOrder;
        	var state=document.getElementById("state").value;
            $.ajax({
                url:'<%=request.getContextPath()%>/test/test9.json',
                data:{"pageNum":page,"pageSize":size,"sort":sort,"order":order,"state":state},
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
					getDataUpdate(pageNum, pageSize);
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
        url:'<%=request.getContextPath()%>/test/test10.json',
        data:{"pageNum":page,"pageSize":size,"sort":sort,"order":order,"state":state},
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
        	var state=document.getElementById("state").value;
			$.ajax({
                url:'<%=request.getContextPath()%>/test/test10.json',
                data:{"pageNum":pageNum,"pageSize":pageSize,"sort":sort,"order":order,"state":state},
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
 
 <style type="text/css">
 
 .datagrid-toolbar  {
  height: auto;
  padding: 1px 2px;
  border-width: 0 0 1px 0;
  border-style: solid ; 
  height: 30px;
}

.datagrid-toolbar table{
    float: left;
}

 
 
 
 
 </style>
	
	
	
</head>

<body>

 <div>
 
     <div class="topnav"  >
	   <div  class="path" >
	      <span ><font>当前位置:</font></span>
	      <span ><font >用户信息管理&nbsp;&nbsp; &gt;&nbsp;&nbsp;专家信息总览</font></span>
	   </div>
     </div> 
	<form action="#" name="Form1" id="Form1">
       	<input type="hidden" id="id" name="id">	 
    <div class="context" style="width:1085px">
     <div class="titlebox" style="width:100%; margin:0 auto;"><span class="title" >专家用户信息总览</span></div>
		<table id="roleList" style="width:100%;" >
	    
	    </table>
	   
	
   </div>   
 	 </form>     
 </div>
</body>
</html>