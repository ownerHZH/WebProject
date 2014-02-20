package com.owner.entity;

public class Major{
	private int major_code;
	private String major_name;
	private String major_introduction;
	
	public int getMajor_code() {
		return major_code;
	}
	public void setMajor_code(String major_code) {
		if(major_code.contains("."))
		{
			this.major_code=(int) Double.parseDouble(major_code);
		}else
		{
			this.major_code = Integer.parseInt(major_code);
		}		
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public String getMajor_introduction() {
		return major_introduction;
	}
	public void setMajor_introduction(String major_introduction) {
		this.major_introduction = major_introduction;
	}
	@Override
	public String toString() {
		return "Major [major_code=" + major_code + ", major_name=" + major_name
				+ ", major_introduction=" + major_introduction + "]";
	}

}
