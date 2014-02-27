package com.owner.service;

import org.springframework.web.multipart.MultipartFile;

public interface ITeacherService {
	/**
	 * 把Excel数据导入到数据库 以数据库表字段为Excel表头格式
	 * @param file
	 * @param path
	 */
   public void uploadTeachersExcel(MultipartFile file, String path);
}
