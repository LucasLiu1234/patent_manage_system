<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业项目总览</title>
	
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
                idField: 'makerID',
                checkOnSelect:false, 
                method:'get',
                frozenColumns :[[
					{field :'ck',checkbox : true}, 
				]],
				columns: [[
				//{field : 'makerID', title : '编号',width :160,align:'center'},
				{field : 'loginName', title : '用户名称',width :336,align:'center'},
				{field : 'team',title : '团队名称',width : 208,align:'center',sortable:true},
				{field : 'phone',title : '联系方式',width : 160,align:'center'},  
				{field : 'email',title : '电子邮箱',width : 160,align:'center',sortable:true},
				 { field: 'opt', title: '详情了解', width: 160, align: 'center',
                    formatter: function (value,row,index) {
                    	return "<a href='<%=request.getContextPath()%>/makerinfo/makerInfoDetail?makerID="+row.makerID+"'>查看详情</a>";  
                    }
                }
              
          		]],
          		toolbar: [
                	  {
                		text: '<input  type="text" style="width:150px;" id="state"  name="state" form="Form1" placeholder="请输入企业名称查询">',
                	  },
                	  {
                		text: "搜索",
                  	  iconCls: "icon-search",
                  	  handler: function () {
                  		  sear();
                  	  }
                	  },{
                		  text:'<div style="float:right;width:600px;visibility:hidden"></div>'
                		  
                	  },
                	  {
                      	  text: "添加创客用户",
                      	  iconCls: "icon-add ",
                      	handler: function () {
                      		window.location.href='<%=request.getContextPath()%>/jsp/blackManage/userPageManage/addchuang.jsp';
                      	  }
                        },'-',
                	  {
                        	text: "删除创客用户",
                        	  iconCls: "icon-cut",
                        	  handler: function () {
                        		  var post= $('#roleList').datagrid('getChecked');
                        		  if(post.length==0){
                        			  alert("提示：\n\n请选择删除对象");
                        		  }
                        		  else{
                        		  var makerID = new Array(post.length);
                        		  for(var i=0;i<post.length;i++){
                        			  makerID[i]=post[i].makerID;
                        		  }              		
                              $.ajax({
                                  url:'<%=request.getContextPath()%>/makerinfo/deleteMakerInfo',
                                  data:{"remove":makerID},
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
                	var opts = $('#roleList').datagrid('options');
                	var page=opts.pageNumber;
                	var size=opts.pageSize;
                	var state=document.getElementById("state").value;
                	$.ajax({
                        url:'<%=request.getContextPath()%>/makerinfo/workList',
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
                url:'<%=request.getContextPath()%>/makerinfo/workList',
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
        url:'<%=request.getContextPath()%>/makerinfo/workList',
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
                url:'<%=request.getContextPath()%>/makerinfo/workList',
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
	
	
	
</head>

<body>

 <div>
 
     <div class="topnav"  >
	   <div  class="path" >
	      <span ><font>当前位置:</font></span>
	      <span ><font >用户信息管理&nbsp;&nbsp; &gt;&nbsp;&nbsp; 创客用户信息查看</font></span>
	   </div>
     </div> 
	<form action="#" name="Form1" id="Form1">
       	<input type="hidden" id="id" name="id">	 
    <div class="context" style="width:1085px">
     <div class="titlebox" style="width:100%; margin:0 auto;"><span class="title" >创客用户信息总览</span></div>
		<table id="roleList" style="width:100%;" >
	    
	    </table>
	   
	
   </div>   
 	 </form>     
 </div>
</body>
</html>