package com.owner.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.owner.dao.IMajorDAO;
import com.owner.dao.IRoleDAO;
import com.owner.dao.ITeacherDAO;
import com.owner.entity.Major;
import com.owner.entity.Role;
import com.owner.entity.Teacher;
import com.owner.util.ExcelToDb;
import com.owner.util.FileOperation;
import com.owner.util.RandomNumber;

@Controller  
public class UserManageController { 
	@Resource(name = "roleDAO")
	private IRoleDAO roleDAO;
	@Resource(name = "teacherDAO")
	private ITeacherDAO teacherDAO;
	
	private final String uploadLocation = "upload\\";
	//数据导入
	@RequestMapping(value = "/importTeacher", method = RequestMethod.POST)      
	public ModelAndView importData(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,HttpServletResponse response) 
	{     
		String path = request.getSession().getServletContext().getRealPath("/")+uploadLocation;
		//以日期创建文件夹
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");  
        String ymd = sdf.format(new Date());
        
        //保存文件
        File targetFile = FileOperation.saveFile(file, path+ymd+"/");
        
        //保存数据
		ExcelToDb e=new ExcelToDb(targetFile,"teacher");

		List<Teacher> teachers=(List<Teacher>) e.teacherExcelReading();
		for(int i=0;i<teachers.size();i++)
		{
			System.out.println("===="+teachers.get(i).toString());
		}
		if(teachers!=null)
		{
			teacherDAO.addTeacher(teachers);
		}		
		
		//向前台打印数据
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		out.print("success");
		return null;//new ModelAndView("menu-content-import-teachers");    
	}	
	
	//添加角色
	@RequestMapping(value = "/addRole", method = RequestMethod.POST)      
	public ModelAndView addRole(@ModelAttribute("role")Role role,HttpServletResponse response) {          
		boolean flag=roleDAO.addRole(role); 
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.print(flag);
		return null;    
		}
	
	
}
