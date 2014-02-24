package com.owner.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.owner.entity.Major;
import com.owner.entity.Teacher;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.LabelCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcelToDb {

	private File sourcefile;
	private String name;
	public ExcelToDb(File filename,String name)
	{
		this.sourcefile=filename;
		this.name=name;		
	}
	
	public static void main(String[] args) {
		ExcelToDb e=new ExcelToDb(new File("D:/teachers.xls"),"teacher");
		try {
			@SuppressWarnings("unchecked")
			List<Teacher> majors = (List<Teacher>) e.getList();
			for(int i=0;i<majors.size();i++)
			{
				System.out.println(majors.get(i).toString());
			}
		} catch (NullPointerException e1) {
			e1.printStackTrace();
		}
				
		/*MajorDAOImpl majorDAO=new MajorDAOImpl();
		majorDAO.addMajor(majors);*/
	}
	
	public List<?> getList() throws NullPointerException
	{
		List<?> list=null;
		if(name.equals("major"))
		{
			list=(List<Major>) excelReading();
		}else if(name.equals("teacher"))
		{
			list=(List<Teacher>) teacherExcelReading();
		}
		return list;		
	}
	
	/**
	 * 读取excel表单中sheet1的数据，保存到Major列表
	 * excel必须有第一行的与数据库表一一对应的字段标题
	 * 实体的setter参数必须全为String
	 * @return Major列表
	 */
	public List<Teacher> teacherExcelReading()
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
		Cell[] titleCell=sheet.getRow(0);

		List<Teacher> teachers=new ArrayList<Teacher>();
		for(int i=1;i<rows;i++)
		{
			Teacher teacher=new Teacher();
			Cell[] rowCell=sheet.getRow(i);
			if(judgeCell(rowCell))
			{
				continue;
			}else
			{
				for(int t=0;t<titleCell.length;t++)
				{									
					setValueT(rowCell[t],titleCell[t],teacher);					
				}	
			}			
			teachers.add(teacher);							
		}
		return teachers;
	}
	
	
	/**
	 * 判断rowCell是否为空
	 * @param rowCell
	 * @return true 空  false 不为空
	 */
	private boolean judgeCell(Cell[] rowCell) {
		int f=0;
		for(int i=0;i<rowCell.length;i++)
		{
			if(rowCell[i].getContents().trim().equals(null)||rowCell[i].getContents().trim().equals(""))
			{
				f++;
			}
		}
		if(f==rowCell.length)
		{
			return true;
		}
		return false;
	}

	/**
	 * 读取excel表单中sheet1的数据，保存到Major列表
	 * excel必须有第一行的与数据库表一一对应的字段标题
	 * 实体的setter参数必须全为String
	 * @return Major列表
	 */
	private List<Major> excelReading()
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
		Cell[] titleCell=sheet.getRow(0);

		List<Major> majors=new ArrayList<Major>();
		for(int i=1;i<rows;i++)
		{
			Cell[] rowCell=sheet.getRow(i);
			if(judgeCell(rowCell))
			{
				continue;
			}else
			{
				Major major=new Major();			
				for(int t=0;t<titleCell.length;t++)
				{			
					setValue(rowCell[t],titleCell[t],major);								
				}
				majors.add(major);
			}
										
		}
		return majors;
	}
	
	/**
	 * 根据excel表中第一行的标头保存相应的数据库字段
	 * @param c00 excel第一行的字段
	 * @param titleCell 第一行的字段
	 * @param major 保存入的实体
	 */
	public void setValueT(Cell c00,Cell titleCell,Teacher teacher)
	{
		String object=null;
		
		String title=titleCell.getContents().trim();
		char adtypeOld=title.charAt(0);
		char adtypeNew=(adtypeOld+"").toUpperCase().charAt(0);
		String setMethod="set"+adtypeNew+title.substring(1);
		if(c00!=null)
		{			
			if(c00.getType()==CellType.LABEL)
			{
				object=((LabelCell) c00).getString();				
			}
			else if(c00.getType()==CellType.NUMBER)
			{
				object=((NumberCell) c00).getValue()+"";
			}
			else if(c00.getType()==CellType.DATE)
			{
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				object=format.format(((DateCell) c00).getDate());
			}
		}
		
		try {
			Method me = teacher.getClass().getMethod(setMethod,String.class);
			me.invoke(teacher, object.trim());
		} catch (SecurityException e) {
			
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			
			e.printStackTrace();
		} catch (IllegalArgumentException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (InvocationTargetException e) {

			e.printStackTrace();
		}
		
	}
	
	public void setValue(Cell c00,Cell titleCell,Major major)
	{
		String object=null;
		
		String title=titleCell.getContents().trim();
		char adtypeOld=title.charAt(0);
		char adtypeNew=(adtypeOld+"").toUpperCase().charAt(0);
		String setMethod="set"+adtypeNew+title.substring(1);

		if(c00!=null)
		{			
			if(c00.getType()==CellType.LABEL)
			{
				object=((LabelCell) c00).getString();				
			}
			else if(c00.getType()==CellType.NUMBER)
			{
				object=((NumberCell) c00).getValue()+"";
			}
			else if(c00.getType()==CellType.DATE)
			{
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				object=format.format(((DateCell) c00).getDate());
			}
		}
		
		try {
			Method me = major.getClass().getMethod(setMethod,String.class);
			me.invoke(major, object.trim());
		} catch (SecurityException e) {
			
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			
			e.printStackTrace();
		} catch (IllegalArgumentException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} catch (InvocationTargetException e) {

			e.printStackTrace();
		}
		
	}

}
