package com.owner.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileOperation {
	/**
	 * 保存上传的文件
	 * @param MultipartFile file 文件
	 * @param path 路径
	 * @return 保存到服务器之后的文件 File file
	 */
	public static File saveFile(MultipartFile file, String path) {
						
		String fileName = file.getOriginalFilename();  
        
        String fileExt = fileName.substring(  
        		fileName.lastIndexOf(".") + 1).toLowerCase();  

        // new file name  
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd_HHmmss");  
        String newFileName = df.format(new Date()) + "_"  
                + RandomNumber.getRandomNumber() + "." + fileExt;
        
        File targetFile = new File(path, newFileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
  
        //保存  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }
		return targetFile;
	}
}
