package com.owner.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import com.owner.entity.Major;
import com.owner.entity.Role;
import com.owner.util.ExcelToDB;

@Controller  
public class UserManageController { 
	@Resource(name = "roleDAO")
	private IRoleDAO roleDAO;
	@Resource(name = "majorDAO")
	private IMajorDAO majorDAO;
	
	//数据导入
	@RequestMapping(value = "/importData", method = RequestMethod.POST)      
	public ModelAndView importData(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) 
	{     
		String path = request.getSession().getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
//        String fileName = new Date().getTime()+".jpg";  
        System.out.println("路径==="+path);  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }
        
		ExcelToDB e=new ExcelToDB(targetFile);
		List<Major> majors=e.excelReading();
		majorDAO.addMajor(majors);
		return new ModelAndView("menu-content-import-teachers");    
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
