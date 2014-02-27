package com.owner.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.owner.dao.ITeacherDAO;
import com.owner.entity.Teacher;
import com.owner.service.ITeacherService;
import com.owner.util.ExcelToDB;
import com.owner.util.FileOperation;

@Service(value="teacherService")
public class TeacherServiceImpl implements ITeacherService {

	@Resource(name = "teacherDAO")
	private ITeacherDAO teacherDAO;
	
	@Override
	public void uploadTeachersExcel(MultipartFile file, String path) {
		//以日期创建文件夹
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");  
        String ymd = sdf.format(new Date());
        
        //保存文件
        File targetFile = FileOperation.saveFile(file, path+ymd+"/");
        
        //保存数据
		ExcelToDB e=new ExcelToDB(targetFile,"teacher");

		@SuppressWarnings("unchecked")
		List<Teacher> teachers=(List<Teacher>) e.getList();
		if(teachers!=null)
		{
			teacherDAO.addTeacher(teachers);
		}
	}

}
