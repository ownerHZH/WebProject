package com.owner.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.owner.dao.impl.MajorDAOImpl;
import com.owner.entity.Major;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcelToDB {

	private File sourcefile;
	public ExcelToDB(File filename)
	{
		this.sourcefile=filename;
	}
	public static void main(String[] args) {
		ExcelToDB e=new ExcelToDB(new File("D:/list.xls"));
		List<Major> majors=e.excelReading();
		MajorDAOImpl majorDAO=new MajorDAOImpl();
		majorDAO.addMajor(majors);
	}
	
	public  List<Major> excelReading()
	{
		//构建Workbook对象, 只读Workbook对象 
	    //直接从本地文件创建Workbook //从输入流创建Workbook 
		Workbook rwb=null;
		try {
			InputStream is=new FileInputStream(sourcefile);
			rwb = Workbook.getWorkbook(is);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//获取第一张Sheet表 
		Sheet sheet=rwb.getSheet(0);
		//行数
		int rows=sheet.getRows();
		//列数
		//int cols=sheet.getColumns();
		List<Major> majors=new ArrayList<Major>();
		for(int i=0;i<rows;i++)
		{
			Major major=new Major();
			Cell[] rowCell=sheet.getRow(i);
			major.setMajor_code(Integer.parseInt(getValue(rowCell[0])));
			major.setMajor_name(getValue(rowCell[1]));
			major.setMajor_introduction(getValue(rowCell[2]));
			majors.add(major);
		}
        return majors;
	}
	
	public String getValue(Cell c00)
	{
		/*Object object=null;
		if(c00!=null)
		{
			if(c00.getType()==CellType.LABEL)
			{
				object=((LabelCell) c00).getString();
			}
			else if(c00.getType()==CellType.NUMBER)
			{
				object=((NumberCell) c00).getValue();
			}
			else if(c00.getType()==CellType.DATE)
			{
				object=((DateCell) c00).getDate();
			}
		}*/
		
		String s=null;
		if(c00!=null)
		{
			s=c00.getContents();
		}		
		return s;
	}

}
