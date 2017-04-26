<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业科技项目立项评审</title>
	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/table.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/themes/gray/easyui.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/jquery.easyui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery-easyui-1.4.4/locale/easyui-lang-zh_CN.js"></script>
	

<script type="text/javascript">
$(document).ready(function(){
	var k1="123";
	var k2="456";
	var k3="2100-1-1";
	$("#k1").textbox("setValue", k1);
	$("#k2").textbox("setValue", k2);
	$("#k3").datebox("setValue", k3); 
});
function check(){
	if(confirm("导出前须保存表单内容\n\n是否现在导出？")){
		return true;
	}
	else{
		return false;
	}
}
function save(){
	if(confirm("确认保存检查意见？")){
		document.getElementById("sort").value="save";
		return true;
	}
	else{
		return false;
	}
}
function sub(){
	var k3=$("#k3").datebox("getValue");
	var k2=document.getElementById("k2").value;
	var k1=document.getElementById("k1").value;
	var advice=document.getElementById("advice").value;
	if(k1==""){
		alert("提示：\n\n请填写编制单位！");
		return false;
	}
	if(k2==""){
		alert("提示：\n\n请填写评审单位！");
		return false;
	}
	if(k3==""){
		alert("提示：\n\n请填写评审日期！");
		return false;
	}
	if(advice==""){
		alert("提示：\n\n请填写专家意见！");
		return false;
	}
	if(confirm("确认提交回复？")){
		document.getElementById("sort").value="submit";
		return true;
	}
	else{
		return false;
	}
}
</script>
	
</head>

<body>
 <div class="commonPage">
 
     <div class="topnav"  >
	   <div  class="path" >
	      <span ><font>当前位置:</font></span>
	      <span ><font >项目评审&nbsp;&nbsp; &gt;&nbsp;&nbsp; 企业科技项目评审</font></span>
	   </div>
     </div> 
		 
    <div class="context">
       <div class="titlebox"><span class="title">科技项目立项评审</span></div>
	   	<form method="post" action="<%=request.getContextPath()%>/expert/commentEnterProject?workId=${detail.id}&type=项目立项评审" name="Form1" id="Form1">
	   	<input type="hidden" name="sort" id="sort">
	 
	   	<div class="easyui-tabs" style="width:100%">
	   	 <div title="申报扉页" style="width:100%">
       	<div style="width:100%">
	   	<table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
               <tr >
                    <td class="tdname">受理编号：</td>                    
                    <td class="tdcontent1">
                    	${detail.dealNumber}
                    </td>
                    <td class="tdname">负责处室：</td>
                    <td class="tdcontent2">
                        ${detail.department}
                    </td>
                </tr>
                <tr >
                    <td class="tdname">项目名称：</td>                    
                    <td class="tdcontent1">
                    	 ${detail.title}
                    </td>
                    <td class="tdname">计划类别：</td>
                    <td class="tdcontent2">
                         ${detail.type}
                    </td>
                </tr>
                <tr >
                    <td class="tdname">技术领域：</td>
                    <td class="tdcontent1">
                     ${detail.type}
                    </td>
                    <td class="tdname">承担单位：</td>
                    <td class="tdcontent2">
                      ${enterpriseInfo.name}
                    </td>                    
                </tr>
                <tr >
                    <td class="tdname">归口管理部门：</td>
                    <td class="tdcontent1">
                      ${detail.competentDepartment}
                    </td>
                    <td class="tdname">单位负责人：</td>
                    <td class="tdcontent2">
                      ${detail.contractor}
                    </td>                    
                </tr>
                <tr>
                    <td class="tdname">填报人：</td>
                    <td class="tdcontent1">
                       ${detail.contact}
                    </td>
                     <td class="tdname">联系电话：</td>
                    <td class="tdcontent1">
                      ${detail.contactPhoneNumber}
                    </td>
               
                </tr>
                <tr>
                 <td class="tdname">填报日期：</td>
                    <td class="tdcontent1">
                       ${applyDate}
                    </td>
                    <td class="tdname" colspan="2" >
                   	 <div align="center" ><a href="<%=request.getContextPath()%>/expert/enterpriseProjectSetProDownload?id=${detail.id}" class="easyui-linkbutton button" style="width:120px;height:25px">相关附件下载</a></div></td>
                </tr>
             </table>
             </div>
       </div>
       <div title="单位基本情况" style="width:100%">
       <div style="width:100%">

<!-- 一、项目基本情况	 -->
	   	<table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
	   			<tr>
	   			<td colspan="4" class="tdtitle" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一、项目基本情况</td>
	   			</tr>
                <tr >
                    <td class="tdname">单位名称：</td>                    
                    <td class="tdcontent1">
                     ${enterpriseInfo.name}
                    </td>
                    <td class="tdname">组织机构代码：</td>
                    <td class="tdcontent2">
                     ${enterpriseInfo.companyCode}
                    </td>
                </tr>
                <tr >
                    <td class="tdname">申报渠道：</td>
                    <td class="tdcontent1">
                      ${enterpriseInfo.applyType}
                    </td>
                    <td class="tdname">所在地区：</td>
                    <td class="tdcontent2">
                     ${enterpriseInfo.registeredCapital}
                    </td>                    
                </tr>
                 <tr >
                    <td class="tdname">通信地址：</td>
                    <td class="tdcontent1">
                    ${enterpriseInfo.address}
                    </td>
                    <td class="tdname">邮政编码：</td>
                    <td class="tdcontent2">
                     ${enterpriseInfo.postcode}
                    </td>                    
                </tr>
                 <tr >
                    <td class="tdname">联 系 人：</td>
                    <td class="tdcontent1">
                    ${enterpriseInfo.contact}
                    </td>
                    <td class="tdname">电   话：</td>
                    <td class="tdcontent2">
                     ${enterpriseInfo.cellPhone}
                    </td>                    
                </tr>
                <tr >
                    <td class="tdname">手    机：</td>
                    <td class="tdcontent1">
                    ${enterpriseInfo.mobilePhone}
                    </td>
                    <td class="tdname">传   真：</td>
                    <td class="tdcontent2">
                    ${enterpriseInfo.fax}
                    </td>                    
                </tr>
                <tr >
                    <td class="tdname">电子邮箱：</td>
                    <td class="tdcontent1">
                     ${enterpriseInfo.email}
                    </td>
                    <td class="tdname">开户银行：</td>
                    <td class="tdcontent2">
                     ${enterpriseInfo.bank}
                    </td>                    
                </tr>
                <tr >
                    <td class="tdname">信用等级：</td>
                    <td class="tdcontent1">
                     ${enterpriseInfo.creditRating}
                    </td>
                    <td class="tdname">账户：</td>
                    <td class="tdcontent2">
                     ${enterpriseInfo.account}
                    </td>                    
                </tr>
                 <tr >
                    <td class="tdname">单位性质：</td>
                    <td class="tdcontent1">
                     ${enterpriseInfo.property}
                    </td>
                    <td class="tdname">企业规模：</td>
                    <td class="tdcontent2">
                     ${enterpriseInfo.size}
                    </td>                    
                </tr>
                </table>
                
<!-- 企业主要股东  -->              
                <table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA" >
                <tr >
          
	   			<td  class="tdname" rowspan="5" style="width:11%" >企业主要股东</td>
	   			</tr>
	   			 <tr >
	   			 	<th class="tdname">投资类型</th>
                    <th class="tdname">企业主要股东</th>                    
                    <th class="tdname">投资比例</th>
                </tr>
                <tr >
                	<td class="tdname">
                	${shareHolers[0].investType}
                	</td>
                    <td class="tdname">
                    ${shareHolers[0].name}
                    </td>                    
                    <td class="tdcontent2" >
                    ${shareHolers[0].percentage}
                    </td>
                    
                </tr>
                 <tr >
                	<td class="tdname">
                	${shareHolers[1].investType}
                	</td>
                    <td class="tdname">
                    ${shareHolers[1].name}
                    </td>                    
                    <td class="tdcontent2" >
                    ${shareHolers[1].percentage}
                    </td>
                    
                </tr>
                 <tr >
                	<td class="tdname">
                	${shareHolers[2].investType}
                	</td>
                    <td class="tdname">
                    ${shareHolers[2].name}
                    </td>                    
                    <td class="tdcontent2" >
                    ${shareHolers[2].percentage}
                    </td>
                    
                </tr>
                </table>
                
                
<!-- 注册时间     -->
             <table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA" >
	   			<tr >
	   			 	<td class="tdname" >注册时间</td>
                    <td class="tdname" colspan="3">
                    ${enterpriseInfo.registrationTime}
                    </td>                     
                    <td class="tdname">注册资金</td>                    
                    <td class="tdname" colspan="3">
                     ${enterpriseInfo.registrationMoney}
                    </td>
               
                </tr>
                <tr >
                	<td class="tdname" rowspan="2">单位负责人情况</td>
                    <td class="tdname" style="width:10%">姓名</td>                    
                    <td class="tdname" style="width:10%">性别</td>
                    <td class="tdname" style="width:10%">出生日期</td>
                    <td class="tdname" style="width:10%">最高学历</td>                    
                    <td class="tdname" style="width:10%">身份证号码</td>
                    <td class="tdname" style="width:10%">固定电话</td>                    
                    <td class="tdname" style="width:10%">移话动电话</td>
                    
                </tr>
                
                 <tr align="center">
                    <td class="tdname1" >
                      ${peopleInCharge.name}
                    </td>                    
                    <td class="tdname1">
                      ${peopleInCharge.gender}
                    </td>
                    <td class="tdname1">
                      ${peopleInCharge.birthday}
					</td>
                    <td class="tdname1">
                      ${peopleInCharge.education}
                    </td>                    
                    <td class="tdname1">
	                    ${peopleInCharge.idCard}
	                </td>
                    <td class="tdname1">
                      ${peopleInCharge.cellPhone}
                    </td>                    
                    <td class="tdname1">
                      ${peopleInCharge.mobilePhone}
                    </td>
                    
 				</tr>
 				
                <tr align="center">
                	<td class="tdname1" rowspan="2">单位人员</td>
                    <td class="tdname1" rowspan="2">
                    ${enterpriseInfo.peoleNumber}
                    </td>                    
                    <td class="tdname1">大专以上技术人员</td>
                    <td class="tdname1">
                     ${enterpriseInfo.juniorCollege}
					</td>
                    <td class="tdname1">博士</td>                    
                    <td class="tdname1">
                     ${enterpriseInfo.doctor}
                    </td>
                    <td class="tdname1">硕士</td>                    
                    <td class="tdname1">
                     ${enterpriseInfo.master}
                    </td>
                    
                </tr>
                <tr align="center">
                	
                    <td class="tdname1" >高级职称</td>                    
                    <td class="tdname1">
                     ${enterpriseInfo.highPosition}
					</td>
                    <td class="tdname1">中级职称</td>
                    <td class="tdname1">
                     ${enterpriseInfo.midPostion}
					</td>                    
                    <td class="tdname1">留学人员</td>
                    <td class="tdname1">
                     ${enterpriseInfo.overseas}
					</td>                    
 
                </tr>
              
             </table>
                
           
           
                
<!-- 近两年企业财务状况   -->     

       
            <table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
                <tr>
	   			<td colspan="4" class="tdtitle" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;近两年企业财务状况</td>
	   		    </tr>
	   			 <tr >
	   			 
                 <th style="width:200px;" class="tdname3">
					<div class="out" style="font-size:14px">
						<b>时&nbsp;&nbsp;间</b> <em>指&nbsp;&nbsp;标</em>
					</div>
				</th>
                    <th class="tdname2"> 前 年:&nbsp;&nbsp;
                    ${yearBeforeLastYear.year}
                    </th>
                    <th class="tdname2">上 一 年度:&nbsp;&nbsp;
                    ${lastyear.year}
                </tr>
                
                
				<tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">总 产 值（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.totalProduction}
                	</td>
                	<td style="text-align:center;">
                	  ${lastyear.totalProduction}
                	</td>
                	
                </tr>
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">总 销 售 额（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.totalSales}
                	</td>
                	<td style="text-align:center;">
                	 ${lastyear.totalSales}
                	</td>
                	
                </tr>
                
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">净 利 润（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.profit}
                	</td>
                	<td style="text-align:center;">
                	 ${lastyear.profit}
                	</td>
                
                </tr>
                
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">纳 税 总 额（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.totalTaxPayment}
                	</td>
                	<td style="text-align:center;">
                	 ${lastyear.totalTaxPayment}
                	</td>
                	
                </tr>
                
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">&nbsp;&nbsp;企 业 所 得 税（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.corporateTax}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.corporateTax}
                	</td>
                	
                </tr>
                <tr> 
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">&nbsp;&nbsp;增 值 税（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.valueAddedTax}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.valueAddedTax}
                	</td>
                	
                </tr>
                
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">&nbsp;&nbsp;营 业 税（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.salesTax}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.salesTax}
                	</td>
                	
                
                </tr>
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">&nbsp;&nbsp;个 人 所 得 税（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.personalIncomeTax}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.personalIncomeTax}
                	</td>
                	
                
                </tr>
                
                 <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">研 发 支 出 费 用（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.RDexpense}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.RDexpense}
                	</td>
                	
                </tr>
                
          		<tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">支出费用总额（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.totalExpenditure}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.totalExpenditure}
                	</td>
                	
                </tr>
                
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">创 汇 总 额 （ 万 美 元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.foreignExchangeEarnings}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.foreignExchangeEarnings}
                	</td>
                	
                </tr>
                 <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">固 定 资 产 原 值（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.fixedAssert}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.fixedAssert}
                	</td>
                	
                </tr>
                
                <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">总 资 产（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.totalAssert}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.totalAssert}
                	</td>
                	
                </tr>
                
                 <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">总 负 债（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.totalLiabilities}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.totalLiabilities}
                	</td>
                	
                </tr>
                
                 <tr>
                	<td style="height:35px;text-align:center;background-color:#F2F2F2;">净 资 产（万元）</td>
                	<td style="text-align:center;">
                	${yearBeforeLastYear.netAssert}
                	</td>
                	<td style="text-align:center;">
                	${lastyear.netAssert}
                	</td>
                </tr>
                
                
             </table>           
                
                
<!-- 主营业务、主要产品与服务                 -->

              <table class="persional" align="center" border="1"  cellpadding="0"  cellspacing="0"  bordercolor="#DEE5EA">
	   			 <tr>
	   			 <td class="tdname3" >主营业务、主要产品与服务</td>                    
                    <td class="tdname" colspan="5">
                   ${enterpriseInfo.productAndService}
                    </td> 
                 </tr> 
                 
                <tr>
                    <td class="tdname">单位性质</td>                    
                    <td class="tdname" colspan="5">
                    ${enterpriseInfo.property}
                    </td>   
                 
                </tr>
                
                 <tr >
                    <td class="tdname" rowspan="2">拥有知识产权（项）</td>                    
                    <td class="tdname">发明专利</td>   
                    <td class="tdname">实用新型</td>
                    <td class="tdname">软件著作权</td>                    
                    <td class="tdname">PCT专利</td>   
                    <td class="tdname">其它</td>
                    
                </tr>
                
                  <tr >
                                  
                    <td class="tdname">
                     ${enterpriseInfo.patents}
                    </td>   
                    <td class="tdname">
                     ${enterpriseInfo.utilityModel}
                    </td>
                    <td class="tdname">
                     ${enterpriseInfo.utilityModel}
                    </td>              
                   <td class="tdname">
                     ${enterpriseInfo.utilityModel}
                    </td>
                   <td class="tdname">
                    ${enterpriseInfo.others}
                    </td>
                </tr>
               
                 
                <tr >
                    <td class="tdname">创新基地建设情况</td>                    
                    <td class="tdname" colspan="5">
                     ${enterpriseInfo.innovationBaseConstruction}
					</td>   
                  
                </tr>
                
                  <tr >
                    <td class="tdname">获科技计划支持情况</td>                    
                    <td class="tdname" colspan="5">
                     ${enterpriseInfo.supportedByST}
						
					</td>   
                            
                </tr>
                
                  <tr >
                    <td class="tdname">获科技奖励及认定情况</td>                    
                    <td class="tdname" colspan="5">
                     ${enterpriseInfo.techAward}
						
					</td>   
                            
                </tr>

              </table>
        
          </div>
      
       </div>
       
       
       
<!-- 项目基本情况      -->  
       <div title="项目基本情况" style="width:100%">
	   <div style="width:100%">
	   	
	   	<input type="hidden" name="sort" id="sort">
	   	
	   	<table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
                <tr >
                    <td class="tdname">项目名称</td>                    
                    <td class="tdcontent1" colspan="3">
                    ${detail.title}
                    </td>
                    <td class="tdname">计划类别</td>
                    <td class="tdcontent2" colspan="2">
                     ${detail.type}
                    </td>
                    
                    
                </tr>
        
          		<tr >
                    <td rowspan="5" class="tdname">项目负责人情况</td>
                    <td class="tdname">姓名</td>
                    <td class="tdname"> 
                    ${leader.name}
                     </td>
                    <td class="tdname">性别</td>
                    <td class="tdname"> 
                     ${leader.gender}
                    </td>
                    <td class="tdname">出生日期</td>
                    <td class="tdname"> 
                     ${leader.birthday}
                    </td>
                </tr>
                
                
                <tr>
                    <td  class="tdname">职称</td>
                    <td  class="tdname">
                     ${leader.title}
                    </td>
                    <td  class="tdname">证件类型</td>
                    <td  class="tdname">
                     ${leader.cardType}
                    </td>
                    <td  class="tdname">证件号码</td>
                    <td  class="tdname">
                     ${leader.cardnumber}
                    </td>
                </tr>
                
                
                 
                 <tr>
                	<td class="tdname">职务</td>
                    <td class="tdname">
                     ${leader.position}
                    </td>
                    <td class="tdname">学历</td>
                    <td class="tdname">
                     ${leader.degree}
                    </td>
                    <td class="tdname">学位</td>
                    <td class="tdname">
                     ${leader.qualifications}
                    </td>
                          
                </tr>      
                 <tr>
                	<td class="tdname">专业</td>
                    <td class="tdname">
                     ${leader.major}
                    </td>
                    <td class="tdname">固定电话</td>
                    <td class="tdname">
                     ${leader.cellPhone}
                    </td>
                    <td class="tdname">传真</td>
                    <td class="tdname">
                     ${leader.fax}
                    </td>
                          
                </tr>      
                
                    
             <tr>             
             	 	<td class="tdname">移动电话</td>
                    <td class="tdname">
                     ${leader.mobilePhone}
                    </td>
                    <td class="tdname">电子邮箱</td>
                    <td class="tdname">
                     ${leader.email}
                    </td>
                    <td class="tdname"></td>
                    <td class="tdname"></td>
             </tr>
             
             
                
             <tr>
             	 <td  class="tdname" colspan="7">项目主要参加人员</td>
             </tr>
             
             
             <tr>
	             <td class="tdname">姓名</td>
                 <td class="tdname">性别</td>
                 <td class="tdname">年龄</td>
                 <td class="tdname">职务、职称</td>
                 <td class="tdname">业务专业</td>
                 <td class="tdname">承担任务</td>
                 <td class="tdname">所在单位</td>
	        </tr>
	        <tr>
	             <td class="tdname">
	             ${members[0].name}
	             </td>
                 
                 <td class="tdname">
                 ${members[0].gender}
                 </td>
         
                 <td class="tdname">
                 ${members[0].age}
                 </td>
                 
                 <td class="tdname">
                 ${members[0].position}
				 </td>
                 <td class="tdname">
                 ${members[0].major}
                 </td>
                 <td class="tdname">
                  ${members[0].task}
                 </td>
                 <td class="tdname">
                  ${members[0].company}
                 </td>
                 
	        </tr>
	          
	        <tr>
	             <td class="tdname">
	             ${members[1].name}
	             </td>
                 
                 <td class="tdname">
                 ${members[1].gender}
                 </td>
         
                 <td class="tdname">
                 ${members[1].age}
                 </td>
                 
                 <td class="tdname">
                 ${members[1].position}
				 </td>
                 <td class="tdname">
                 ${members[1].major}
                 </td>
                 <td class="tdname">
                  ${members[1].task}
                 </td>
                 <td class="tdname">
                  ${members[1].company}
                 </td>
                 
	        </tr>
	        
	       <tr>
	             <td class="tdname">
	             ${members[2].name}
	             </td>
                 
                 <td class="tdname">
                 ${members[2].gender}
                 </td>
         
                 <td class="tdname">
                 ${members[2].age}
                 </td>
                 
                 <td class="tdname">
                 ${members[2].position}
				 </td>
                 <td class="tdname">
                 ${members[2].major}
                 </td>
                 <td class="tdname">
                  ${members[2].task}
                 </td>
                 <td class="tdname">
                  ${members[2].company}
                 </td>
                 
	        </tr>
	        
	        <tr>
	             <td class="tdname">
	             ${members[3].name}
	             </td>
                 
                 <td class="tdname">
                 ${members[3].gender}
                 </td>
         
                 <td class="tdname">
                 ${members[3].age}
                 </td>
                 
                 <td class="tdname">
                 ${members[3].position}
				 </td>
                 <td class="tdname">
                 ${members[3].major}
                 </td>
                 <td class="tdname">
                  ${members[3].task}
                 </td>
                 <td class="tdname">
                  ${members[3].company}
                 </td>
                 
	        </tr>
	        
	        <tr>
	             <td class="tdname">
	             ${members[4].name}
	             </td>
                 
                 <td class="tdname">
                 ${members[4].gender}
                 </td>
         
                 <td class="tdname">
                 ${members[4].age}
                 </td>
                 
                 <td class="tdname">
                 ${members[4].position}
				 </td>
                 <td class="tdname">
                 ${members[4].major}
                 </td>
                 <td class="tdname">
                  ${members[4].task}
                 </td>
                 <td class="tdname">
                  ${members[4].company}
                 </td>
                 
	        </tr>  
	        
           </table>
           
           
<!-- 项目现处阶段    -->        
           <table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
             <tr>
             <td >项目现处阶段</td>
             <td colspan="5" class="tdname">
            	   ${detail.state}
             </td>
             </tr>
             
             <tr>
              <td class="tdname">技术领域</td>
              <td class="tdname">
             	${detail.field}
             </td>
              <td class="tdname">行业领域</td>
              <td class="tdname">
                ${detail.industryField}
             </td>
              <td class="tdname">项目对应学科代码</td>
              <td class="tdname">
                ${detail.subjectCode}
             </td>
             </tr>
               <tr>
               <td class="tdname">项目来源</td>
               <td class="tdname" colspan="2">
               ${detail.projectOrigin}
             </td>
               <td class="tdname">技术来源</td>
               <td class="tdname" colspan="2">
               ${detail.techOrigin}
             </td>
           
             </tr>
              <tr>
               <td class="tdname" >开发形式</td>
          	 <td class="tdname"  colspan="2">
          	   ${detail.developType}
             </td>
             
               <td class="tdname">产品采标形式</td>
 				<td class="tdname" colspan="2">
 				${detail.productAdoption}
             </td>       
             </tr>
            
              <tr>
               <td class="tdname">项目知识产权情况</td>
              <td colspan="5" class="tdname">
              ${detail.IPRstatement}
             </td>
             </tr>
             
             <tr>
               <td class="tdname">科技奖励获奖情况</td>
              <td colspan="5" class="tdname">
            ${detail.award}
             </td>
             </tr>
             
             <tr>
               <td class="tdname" class="tdname">技术权益及使用方式说明</td>
              <td colspan="5" class="tdname">
               ${detail.techRightsandUsage}
             </td>
             </tr>
            
            
             <tr>
             
               <td class="tdname">项目执行期</td>
          		<td class="tdcontent2" colspan="2">
                    ${detail.startTime}
             </td>
               <td class="tdname"> 至</td>
          	   <td class="tdcontent2" colspan="2">
                   ${detail.endtime}
             </td>
            
             </tr>
             
             
              <tr>
               <td class="tdname">合作单位1</td>
           	   <td colspan="2" class="tdname">
           	     ${corporators[0].name}
             </td>
             
               <td class="tdname">组织机构代码</td>
               <td colspan="2" class="tdname">
                 ${corporators[0].companyCode}
             </td>
            </tr>
            
             <tr>
               <td class="tdname">负责人</td>
           		<td colspan="2" class="tdname">
           		 ${corporators[0].peopleInCharge}
             
               <td class="tdname">联系电话</td>
                <td colspan="2" class="tdname">
           		  ${corporators[0].phone}
             </td>
             </tr>
             
             
             <tr>
               <td class="tdname">合作单位2</td>
           		<td colspan="2" class="tdname">
           		 ${corporators[1].name}
             </td>
             
               <td class="tdname">组织机构代码</td>
          		 <td colspan="2" class="tdname">
          		  ${corporators[1].companyCode}
          		 </td>
             <tr>
               <td class="tdname">负责人</td>
          		 <td colspan="2" class="tdname">
          		${corporators[1].peopleInCharge}
          		</td>
             
               <td class="tdname">联系电话</td>
           		<td colspan="2" class="tdname">
           		${corporators[1].phone}
          		</td>
             </tr>
            
             <tr>
              <td rowspan="4" class="tdname">国际科技合作信 息</td>
              <td colspan="1" class="tdname">合作协议类别及名称</td>   
              
              <td colspan="5" class="tdname">
             ${detail.corTypeAndName}
          		</td>
             </tr>

              <tr>
              <td colspan="1" class="tdname">合作目标及外方投入</td>   
              <td colspan="5" class="tdname">
             	${detail.corGoalsandInvest}
          	</td>
             </tr>
             
             	 <tr>
              <td colspan="1" class="tdname">合作外方机构及负责人</td>   
              <td colspan="5" class="tdname">
              ${detail.corDepartmentandPerson}
          		</td>
             </tr>
            
                 
           	 <tr>
              <td colspan="1" class="tdname">电子邮箱与通信地址</td>   
              <td colspan="5" class="tdname">
              ${detail.corEmailandAddress}
          		</td>
             </tr>
             
             
              <tr>
              <td rowspan="3" class="tdname">科技服务机构信息</td>
              <td colspan="1" class="tdname">服务方式</td>   
              
              <td colspan="5" class="tdname">
             ${detail.serviceType}
          		</td>
             </tr>
             
             <tr>
              <td colspan="1" class="tdname">已经服务企业数量</td>   
           		<td colspan="1" class="tdname">
           		 ${detail.serviceNumber}
          		</td>
              <td colspan="2" class="tdname">项目完成预计服务企业数量</td>
          		 <td colspan="2" class="tdname">
          		 ${detail.numberToserve}
          		</td>
             </tr>
               <tr>
              <td colspan="1"class="tdname">已经提供服务种类或 平 台</td>   
           		<td colspan="1" class="tdname">
           		 ${detail.servicetypeorplatform}
          		</td>
              <td colspan="2"class="tdname">项目完成预计提供服务种类或平台</td>
          		 <td colspan="2" class="tdname">
          		 ${detail.planServicetypeorplatform}
          		</td>
             </tr>
              
                
            <tr>
             <td class="tdname">项 目 简介 及 总体 目 标</td>
             <td colspan="6" class="tdname">
             ${detail.descriptionAndGoals}
          		</td>
            </tr>
            
            <tr>
              <td class="tdname">主要研究内容及技术指 标</td>
             <td colspan="6" class="tdname">
             ${detail.contentAndIndication}
          		</td>
            </tr>
            
            
            <tr>
             <td class="tdname">主要创新点</td>
             <td colspan="6" class="tdname">
            ${detail.createPoints}
          		</td>
            </tr>
            
            
             <tr>
             <td class="tdname">工作基础</td>
             <td colspan="6" class="tdname">
             ${detail.workBasis}
          		</td>
            </tr>
            
            <tr>
             <td class="tdname">计划进度及阶段性目标</td>
             <td colspan="6" class="tdname">
                  ${detail.schedule}
          		</td>
            </tr>
             
           
           </table>
         
	   	</div>
	   	</div>
	   	
	   	
<!-- 项目投入资金预算（万元） -->	
   	
	  <div title="项目投入资金预算（万元）" style="width:100%">
	   <div style="width:100%l;">
	   	<input type="hidden" name="sort" id="sort">
	   	<table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
                <tr>
                    <td class="tdname">预算科目名称</td>                    
                    <td class="tdcontent1-1">合计</td>
                    <td class="tdname">市财政经费</td>
                    <td class="tdcontent2-2">自筹经费</td>
                </tr>
               
                <tr>
                    <td class="tdname">一、经费支出合计</td>
                    <td class="tdname">
                      ${fromGov.total+fromSelf.total}
          			</td>
                    <td class="tdname">
                      ${fromGov.total}
          			</td>
                   <td class="tdname">
                       ${fromSelf.total}
          			</td>          
                </tr>
               
                     
           <tr>
                    <td class="tdname">1、研发设备费</td>
                    <td class="tdname">
                       ${fromGov.totalRDequimentFee+fromSelf.totalRDequimentFee}
          			</td>
                    <td class="tdname">
                         ${fromGov.totalRDequimentFee}
          			</td>
                   <td class="tdname">
                        ${fromSelf.totalRDequimentFee}
          			</td>            
                </tr>
                <tr>
                    <td class="tdname">（1）购置研发设备费</td>
                    <td class="tdname">
                       ${fromGov.equimentBuyFee+fromSelf.equimentBuyFee}
          			</td>
                    <td class="tdname">
                      ${fromGov.equimentBuyFee}
          			</td>
                   <td class="tdname">
                       ${fromSelf.equimentBuyFee}
          			</td>           
                </tr>
                
              	 <tr>
                    <td class="tdname">（2）试制研发设备费</td>
                    <td class="tdname">
                        ${fromGov.equimentMakeFee+fromSelf.equimentMakeFee}
          			</td>
                    <td class="tdname">
                        ${fromGov.equimentMakeFee}
          			</td>
                   <td class="tdname">
                        ${fromSelf.equimentMakeFee}
          			</td>            
                </tr>
             	 <tr>
                    <td class="tdname">（3）软件系统开发费</td>
                    <td class="tdname">
                       ${fromGov.softwareMakeFee+fromSelf.softwareMakeFee}
          			</td>
                    <td class="tdname">
                        ${fromGov.softwareMakeFee}
          			</td>
                   <td class="tdname">
                     ${fromSelf.softwareMakeFee}
          			</td>         
                </tr>
             
               <tr>
                    <td class="tdname">2、合作研发费</td>
                    <td class="tdname">
                       ${fromGov.corRDFee+fromSelf.corRDFee}
          			</td>
                    <td class="tdname">
                      ${fromGov.corRDFee}
          			</td>
                   <td class="tdname">
                      ${fromSelf.corRDFee}
          			</td>         
                </tr>
             
              
               <tr>
                    <td class="tdname">（1）引进人才、团队费</td>
                    <td class="tdname">
                         ${fromGov.peopleTeamFee+fromSelf.peopleTeamFee}
          			</td>
                    <td class="tdname">
                        ${fromGov.peopleTeamFee}
          			</td>
                   <td class="tdname">
                      ${fromSelf.peopleTeamFee}
          			</td>         
                </tr>
               
               <tr>
                    <td class="tdname">（2）购置技术、专利及成果费</td>
                    <td class="tdname">
                        ${fromGov.techPatentResBuyFee+fromSelf.techPatentResBuyFee}
          			</td>
                    <td class="tdname">
                      ${fromGov.techPatentResBuyFee}
          			</td>
                   <td class="tdname">
                      ${fromSelf.techPatentResBuyFee}
          			</td>           
                </tr>
	        
	          
               <tr>
                    <td class="tdname">（3）产学研合作经费</td>
                    <td class="tdname">
                       ${fromGov.researchCooperationFee+fromSelf.researchCooperationFee}
          			</td>
                    <td class="tdname">
                       ${fromGov.researchCooperationFee}
          			</td>
                   <td class="tdname">
                        ${fromSelf.researchCooperationFee}
          			</td>          
                </tr>
	        
	         <tr>
                    <td class="tdname">3、材料费</td>
                    <td class="tdname">
                       ${fromGov.materialFee+fromSelf.materialFee}
          			</td>
                    <td class="tdname">
                       ${fromGov.materialFee}
          			</td>
                   <td class="tdname">
                       ${fromSelf.materialFee}
          			</td>            
                </tr>
                
                 <tr>
                    <td class="tdname">4、测试化验加工费</td>
                    <td class="tdname">
                        ${fromGov.testLabProcessingFee+fromSelf.testLabProcessingFee}
          			</td>      
                    <td class="tdname">
                       ${fromGov.testLabProcessingFee}
          			</td>      
                   <td class="tdname">
                       ${fromSelf.testLabProcessingFee}
          			</td>                 
                </tr>
                
                <tr>
                    <td class="tdname">5、燃料动力费</td>
                    <td class="tdname">
                      ${fromGov.fuelPowerCost+fromSelf.fuelPowerCost}
          			</td>      
                    <td class="tdname">
                        ${fromGov.fuelPowerCost}
          			</td>      
                   <td class="tdname">
                       ${fromSelf.fuelPowerCost}
          			</td>              
                </tr>
                
                <tr>
                    <td class="tdname">6、差旅费</td>
                    <td class="tdname">
                      ${fromGov.travelFee+fromSelf.travelFee}
          			</td>      
                    <td class="tdname">
                      ${fromGov.travelFee}
          			</td>      
                   <td class="tdname">
                      ${fromSelf.travelFee}
          			</td>                
                </tr>
                 <tr>
                    <td class="tdname">7、会议费 </td>
                    <td class="tdname">
                        ${fromGov.conferenceFee+fromSelf.conferenceFee}
          			</td>      
                    <td class="tdname">
                        ${fromGov.conferenceFee}
          			</td>
                   <td class="tdname">
                       ${fromSelf.conferenceFee}
          			</td>            
                </tr>
                
                <tr>
                    <td class="tdname">8、国际合作与交流费</td>
                    <td class="tdname">
                       ${fromGov.cooperationAndExchangeFee+fromSelf.cooperationAndExchangeFee}
          			</td>
                    <td class="tdname">
                       ${fromGov.cooperationAndExchangeFee}
          			</td>
                   <td class="tdname">
                        ${fromSelf.cooperationAndExchangeFee}
          			</td>            
                </tr>
                
                 <tr>
                    <td class="tdname">9、出版/文献/信息传播/知识产权事务费</td>
                    <td class="tdname">
                      ${fromGov.publicationFee+fromSelf.publicationFee}
          			</td>
                    <td class="tdname">
                       ${fromGov.publicationFee}
          			</td>
                   <td class="tdname">
                       ${fromSelf.publicationFee}
          			</td>           
                </tr>
                 <tr>
                    <td class="tdname">10、劳务费</td>
                    <td class="tdname">
                       ${fromGov.serviceFee+fromSelf.serviceFee}
          			</td>
                    <td class="tdname">
                        ${fromGov.serviceFee}
          			</td>
                   <td class="tdname">
                         ${fromSelf.serviceFee}
          			</td>          
                </tr>
                
                <tr>
                    <td class="tdname">11、专家咨询费</td>
                     <td class="tdname">
                       ${fromGov.expertConsultationFee+fromSelf.expertConsultationFee}
          			</td>
                    <td class="tdname">
                        ${fromGov.expertConsultationFee}
          			</td>
                   <td class="tdname">
                         ${fromSelf.expertConsultationFee}
          			</td>                  
                </tr>            
                
                 <tr>
                    <td class="tdname">12、管理费</td>
                    <td class="tdname">
                       ${fromGov.managementFee+fromSelf.managementFee}
          			</td>
                    <td class="tdname">
                        ${fromGov.managementFee}
          			</td>
                   <td class="tdname">
                         ${fromSelf.managementFee}
          			</td>             
                </tr>
                
                
                <tr>
                    <td class="tdname">二、经费来源合计</td>
                    <td class="tdname">
                       ${fromGov.totalSourcesFunds+fromSelf.totalSourcesFunds}
          			</td>
                    <td class="tdname">
                        ${fromGov.totalSourcesFunds}
          			</td>
                   <td class="tdname">
                         ${fromSelf.totalSourcesFunds}
          			</td>                   
                </tr>
                
                 <tr>
                    <td class="tdname">1、申请从市财政经费获得的资助</td>
                    <td class="tdname">
                       ${fromGov.applyFromGov+fromSelf.applyFromGov}
          			</td>
                    <td class="tdname">
                        ${fromGov.applyFromGov}
          			</td>
                   <td class="tdname">
                         ${fromSelf.applyFromGov}
          			</td>              
                </tr>
                 <tr>
                    <td class="tdname">2、自筹经费来源</td>
                   <td class="tdname">
                       ${fromGov.selfFounding+fromSelf.selfFounding}
          			</td>
                    <td class="tdname">
                        ${fromGov.selfFounding}
          			</td>
                   <td class="tdname">
                         ${fromSelf.selfFounding}
          			</td>                
                </tr>
                
                <tr>
                    <td class="tdname">（1）其他财政拨款</td>
                    <td class="tdname">
                       ${fromGov.otherFinancialAllocations+fromSelf.otherFinancialAllocations}
          			</td>
                    <td class="tdname">
                        ${fromGov.otherFinancialAllocations}
          			</td>
                   <td class="tdname">
                         ${fromSelf.otherFinancialAllocations}
          			</td>             
                </tr>
                
                
                 <tr>
                    <td class="tdname">（2）单位自有货币资金</td>
                   <td class="tdname">
                       ${fromGov.ownFound+fromSelf.ownFound}
          			</td>
                    <td class="tdname">
                        ${fromGov.ownFound}
          			</td>
                   <td class="tdname">
                         ${fromSelf.ownFound}
          			</td>               
                </tr>
                 <tr>
                    <td class="tdname">（3）其他资金</td>
                    <td class="tdname">
                       ${fromGov.otherFound+fromSelf.otherFound}
          			</td>
                    <td class="tdname">
                        ${fromGov.otherFound}
          			</td>
                   <td class="tdname">
                         ${fromSelf.otherFound}
          			</td>              
                </tr>  
           

           </table>
 
 
<!--  其中：研发设备费预算明细表       -->    

           	<table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
                <tr >
                <td class="tdname" colspan="6">其中：研发设备费预算明细表</td>
                </tr>
                
                <tr >
	                <td class="tdname">设备名称</td>
	                <td class="tdname">单价 (万元/台件)</td>
	                <td class="tdname">数量（台件）</td>
	                <td class="tdname">金额（单位：万元）</td>
	                <td class="tdname">购置设备生产国别与地区</td>
	                <td class="tdname">与项目关系</td>
                </tr>
                <tr>
                 <td class="tdname">
                       ${equipments[0].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[0].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[0].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[0].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[0].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[0].relationship}
          			</td> 
                </tr>
                
               <tr>
                 <td class="tdname">
                       ${equipments[1].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[1].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[1].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[1].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[1].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[1].relationship}
          			</td> 
                </tr>
               <tr>
                 <td class="tdname">
                       ${equipments[2].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[2].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[2].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[2].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[2].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[2].relationship}
          			</td> 
                </tr>
                
                <tr>
                 <td class="tdname">
                       ${equipments[3].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[3].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[3].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[3].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[3].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[3].relationship}
          			</td> 
                </tr>
                
               <tr>
                 <td class="tdname">
                       ${equipments[4].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[4].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[4].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[4].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[4].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[4].relationship}
          			</td> 
                </tr>
                
                <tr>
                 <td class="tdname">
                       ${equipments[5].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[5].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[5].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[5].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[5].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[5].relationship}
          			</td> 
                </tr>
                
               <tr>
                 <td class="tdname">
                       ${equipments[6].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[6].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[6].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[6].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[6].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[6].relationship}
          			</td> 
                </tr>
                
                <tr>
                 <td class="tdname">
                       ${equipments[7].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[7].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[7].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[7].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[7].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[7].relationship}
          			</td> 
                </tr>
                
                <tr>
                 <td class="tdname">
                       ${equipments[8].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[8].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[8].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[8].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[8].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[8].relationship}
          			</td> 
                </tr>
                
                 <tr>
                 <td class="tdname">
                       ${equipments[9].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[9].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[9].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[9].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[9].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[9].relationship}
          			</td> 
                </tr>
                
               <tr>
                 <td class="tdname">
                       ${equipments[10].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[10].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[10].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[10].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[10].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[10].relationship}
          			</td> 
                </tr>
                
                <tr>
                 <td class="tdname">
                       ${equipments[11].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[11].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[11].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[11].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[11].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[11].relationship}
          			</td> 
                </tr>
                
               <tr>
                 <td class="tdname">
                       ${equipments[12].name}
          			</td>    
                 <td class="tdname">
                       ${equipments[12].singlePrice}
          			</td> 
                  <td class="tdname">
                       ${equipments[12].number}
          			</td>   
                 <td class="tdname">
                      ${equipments[12].totalPrice}
          			</td> 
                 <td class="tdname">
                     ${equipments[12].location}
          			</td>   
                 <td class="tdname">
                      ${equipments[12].relationship}
          			</td> 
                </tr>
           </table>
         
	   	</div>
	   	</div>
	   	
	   	
	     	
	  <div title="附件清单" style="width:100%">
	   <div style="width:100%">
	   	
	   	<input type="hidden" name="sort" id="sort">
	   	<table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">                 
             <tr>             
            	 <td  align="center" height="400px" >
	            	 <div class="tdcontent4">
		                ${detail.fujianDescription}
          			
		             </div>
		         </td>
             </tr>      
           </table>
         
	   	</div>
	   	</div>
       <div title="项目立项意见表" style="width:100%">
       	<div style="width:100%">
	   	<table class="persional" align="center" border="1" cellpadding="0" cellspacing="0" bordercolor="#DEE5EA">
                <tr >
                    <td class="tdname">项目名称：</td>                    
                    <td class="tdcontent1">
                       ${detail.title}
                    </td>
                    <td class="tdname">承担单位：</td>
                    <td class="tdcontent2">
                       ${enterpriseInfo.name}
                    </td>
                </tr>
                <tr >
                    <td class="tdname">计划文号：</td>
                    <td class="tdcontent1">
                                                                                                         还没写！！！
                    </td>
                    <td class="tdname">项目编号：</td>
                    <td class="tdcontent2">
                       ${detail.dealNumber}
                    </td>                    
                </tr>
                <tr >
                    <td class="tdname">编制单位：</td>
                    <td class="tdcontent1">
                        <input class="easyui-textbox mydatebox" type="text" name="k1" id="k1" >
                    </td>
                    <td class="tdname">评审单位：</td>
                    <td class="tdcontent2">
                       <input class="easyui-textbox mydatebox" type="text" name="k2" id="k2" >
                    </td>                    
                </tr>
                <tr>
                    <td class="tdname">评审日期：</td>
                    <td class="tdcontent1">
                      <input class="easyui-datebox mydatebox" type="text" name="k3" id="k3" editable="false" panelHeight="260" panelWidth="200" >
                    </td>
                    <td style="background-color:#F2F2F2;width:15%"colspan="2" >
                   	 <div align="center" ><a href="#" class="easyui-linkbutton button" style="width:120px;height:25px">相关附件下载</a></div></td>                    
                </tr>             
             <tr>
             	 <td  class="tdname" align="center" >专家意见</td>
            	 <td  align="center" height="500px" colspan="3">
	            	 <div class="tdcontent3">
		               <textarea id="advice" name="advice" cols="40" rows="12" style="width:90%;height:100%;">${comment.comment}</textarea>
		             </div> 
             </td>
             </tr>
             
            <tr>
	             <td align="center" colspan="4">
	             	<div style="margin-top:20px; left:40%; margin-bottom:20px;float:left; position:relative" ><a href="javascript:void(document.Form1.submit())" style="height:35px;width:70px;font-size:16px;" class="easyui-linkbutton button" onclick="return sub();">提&nbsp;&nbsp;交</a>
	             	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <a href="javascript:void(document.Form1.submit())" style="height:35px;width:70px;font-size:16px" class="easyui-linkbutton button" onclick="return save();">保&nbsp;&nbsp;存</a></div>
		            <div style="margin-top:20px; margin-bottom:20px;float:right; position:relative; right:20px"><a href="javascript:void(document.Form1.submit())" style="height:35px;width:100px;font-size:16px" class="easyui-linkbutton button" onclick="return check();">导出为word</a></div>
		            
		        </td>
	        </tr>
	        
           </table>
           </div>
           </div>
           </div>
          </form>
	
   </div>   
 	     
 </div>
</body>
</html>