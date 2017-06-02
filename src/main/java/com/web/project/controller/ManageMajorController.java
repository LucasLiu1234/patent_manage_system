package com.web.project.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.*;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.project.model.BackManage.Field;
import com.web.project.model.BackManage.Major;
import com.web.project.service.BackManage.ManageFieldService;
import com.web.project.service.BackManage.MajorService;
import com.web.project.vo.MajorVo;
import com.web.project.vo.ManageFieldVo;


/**
 * @author 瀛愭櫒
 *
 */
@RequestMapping("manageMajor")
@Controller
public class ManageMajorController {

	@Autowired
	MajorService majorService;
	@Autowired
	ManageFieldService manageFieldService;
	/**
	 * 鍒涘椤圭洰浣滃搧鍒楄〃
	 */
	@RequestMapping("MajorList")
	@ResponseBody
	public String getExpertInfoList(
			@RequestParam(value = "state") final String state,
			@RequestParam(value = "pageNum") final int pageId,
			@RequestParam(value = "pageSize") final int pageSize,ModelMap model){
		String result;
		ArrayList<Major> MajorInfo ;
		ArrayList<Field> field;
		
		if(state.equals("m"))
		{
			MajorInfo = majorService.getMajorByName();
			int start = (pageId - 1) * pageSize;
			int end = Math.min(MajorInfo.size(), start + pageSize);
			ArrayList<MajorVo> MajorVos = new ArrayList<MajorVo>();
			for (int i = start; i < end; i++) {
				MajorVo MajorVo = new MajorVo();
				MajorVo.transfer(MajorInfo.get(i));
				MajorVos.add(MajorVo);
			}
			HashMap hashMap = new HashMap();
			hashMap.put("total", MajorInfo.size());
			hashMap.put("rows", MajorVos);
			String result1 = JSONArray.fromObject(hashMap).toString();
		    result = result1.substring(1, result1.length() - 1);
		}
		else{
			field = manageFieldService.getField();
			int start = (pageId - 1) * pageSize;
			int end = Math.min(field.size(), start + pageSize);
			ArrayList<ManageFieldVo> MajorVos = new ArrayList<ManageFieldVo>();
			for (int i = start; i < end; i++) {
				ManageFieldVo MajorVo = new ManageFieldVo();
				MajorVo.transfer(field.get(i));
				MajorVos.add(MajorVo);
			}
			HashMap hashMap = new HashMap();
			hashMap.put("total", field.size());
			hashMap.put("rows", MajorVos);
			String result1 = JSONArray.fromObject(hashMap).toString();
		    result = result1.substring(1, result1.length() - 1);
		}

		return result;
	}	
	
	/**
	 * 璺宠浆鍒伴」鐩綔鍝佸垪琛�	 */
	@RequestMapping("toMajorList")
	public String toMajorIfoList(){
		return "blackManage/sysManagement/shujuweihuOverview";
	}
	
	
	/**
	 * 鍒涘椤圭洰浣滃搧璇︾粏淇℃伅
	 */
//	@RequestMapping("expertInfoDetail")
//	public String getmanageEnterpriseDetail(@RequestParam(value="id")final int id,ModelMap model){
////		ExpertInfo expertInfo = expertInfoService.getInfoById(id);
//		ExpertInfoVo expertInfoVo = new ExpertInfoVo();
////		expertInfoVo.transfer(expertInfo);
//		model.put("detail", expertInfoVo);
//		String result1 = JSONArray.fromObject(expertInfoVo).toString();
//		String result = result1.substring(1, result1.length() - 1);
//		System.out.println(result);
//		return "blackManage/userPageManage/expertInfo";
//	}
//	
//
	@RequestMapping("insertMajorInfo")
	public String insertExpertInfo(
			@RequestParam(value="name")String name,
			@RequestParam(value="state")String state,ModelMap model) throws UnsupportedEncodingException{
		
		if(state.equals("m"))
		{
		   name = new String(name.getBytes("iso-8859-1"), "utf-8");
		   majorService.insertMajorInfo(name);
		}
		else{
			name = new String(name.getBytes("iso-8859-1"), "utf-8");
			manageFieldService.insertFieldInfo(name);
		}
		return "blackManage/sysManagement/shujuweihuOverview";
    }
	
	@RequestMapping("deleteMajorList")	
	@ResponseBody
	public void deleteMajorInfo(
			@RequestParam(value = "remove") final int[] id,
			@RequestParam(value="state")String state) {
		ArrayList<Integer> remove=new ArrayList<Integer>();
		for(int i=0;i<id.length;i++){
		   remove.add(id[i]);
		}

		if(state.equals("m")){

			majorService.deleteMajorInfoById(remove);

		}else{
			manageFieldService.deleteFieldInfoById(remove);
		}
	}
}