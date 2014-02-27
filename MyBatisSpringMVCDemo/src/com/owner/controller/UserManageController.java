package com.owner.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.owner.entity.Role;
import com.owner.service.IRoleService;
import com.owner.service.ITeacherService;

@Controller  
public class UserManageController { 
	
	@Resource(name="roleService")
	private IRoleService roleService;
	@Resource(name = "teacherService")
	private ITeacherService teacherService;
	
	private final String uploadLocation = "upload\\";
	//数据导入
	@RequestMapping(value = "/importTeacher", method = RequestMethod.POST)      
	public ModelAndView importData(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,HttpServletResponse response) 
	{     
		String path = request.getSession().getServletContext().getRealPath("/")+uploadLocation;	
		teacherService.uploadTeachersExcel(file, path);
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
		boolean flag=roleService.addRole(role); 
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
