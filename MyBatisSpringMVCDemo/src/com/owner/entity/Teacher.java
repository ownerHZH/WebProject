package com.owner.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jxl.DateCell;

public class Teacher {
	private String user_name;
	private String teacher_code;
	private int role_code;
	private String user_password;
	private String teacher_name;
	private String teacher_sex;
	private Date teacher_birthday;
	private String teacher_academic;
	private String teacher_degree;
	private String teacher_title;
	private int teacher_character;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTeacher_code() {
		return teacher_code;
	}
	public void setTeacher_code(String teacher_code) {
		this.teacher_code = teacher_code;
	}
	public int getRole_code() {
		return role_code;
	}
	public void setRole_code(String role_code) {
		if(role_code.contains("."))
		{
			this.role_code=(int) Double.parseDouble(role_code);
		}else
		{
			this.role_code = Integer.parseInt(role_code);
		}
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getTeacher_sex() {
		return teacher_sex;
	}
	public void setTeacher_sex(String teacher_sex) {
		this.teacher_sex = teacher_sex;
	}
	public String getTeacher_academic() {
		return teacher_academic;
	}
	public void setTeacher_academic(String teacher_academic) {
		this.teacher_academic = teacher_academic;
	}
	public String getTeacher_degree() {
		return teacher_degree;
	}
	public void setTeacher_degree(String teacher_degree) {
		this.teacher_degree = teacher_degree;
	}
	public String getTeacher_title() {
		return teacher_title;
	}
	public void setTeacher_title(String teacher_title) {
		this.teacher_title = teacher_title;
	}
	public int getTeacher_character() {
		return teacher_character;
	}
	public void setTeacher_character(String teacher_character) {
		if(teacher_character.contains("."))
		{
			this.teacher_character=(int) Double.parseDouble(teacher_character);
		}else
		{
			this.teacher_character = Integer.parseInt(teacher_character);
		}
	}
	public Date getTeacher_birthday() {
		return teacher_birthday;
	}
	public void setTeacher_birthday(String teacher_birthday) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");		
		try {
			this.teacher_birthday = format.parse(teacher_birthday);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public String toString() {
		return "Teacher [user_name=" + user_name + ", teacher_code="
				+ teacher_code + ", role_code=" + role_code
				+ ", user_password=" + user_password + ", teacher_name="
				+ teacher_name + ", teacher_sex=" + teacher_sex
				+ ", teacher_birthday=" + teacher_birthday
				+ ", teacher_academic=" + teacher_academic
				+ ", teacher_degree=" + teacher_degree + ", teacher_title="
				+ teacher_title + ", teacher_character=" + teacher_character
				+ "]";
	}

}
