package com.owner.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.owner.dao.IMajorDAO;
import com.owner.entity.Major;

@Controller
public class MajorController {
	@Resource(name = "majorDAO")
	private IMajorDAO majorDAO;
	
	//获取专业列表
	@RequestMapping("/professional-introduction")
	public ModelAndView professional_introduction() {
		List<Major> majors=majorDAO.getAllMajor();
		return new ModelAndView("professional-introduction","majors",majors);
	}
	
	//专业静态页面请求
	@RequestMapping("/static-html")
	public ModelAndView static_html() {
		return new ModelAndView("static-html");
	}
}
