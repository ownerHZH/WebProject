package com.owner.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.owner.entity.Major;
import com.owner.service.IMajorService;

@Controller
public class MajorController {
	
	@Resource(name = "majorService")
	private IMajorService majorService;
	
	//获取专业列表
	@RequestMapping("/professional-introduction")
	public ModelAndView professional_introduction() {
		List<Major> majors=majorService.getMajorList();
		return new ModelAndView("professional-introduction","majors",majors);
	}
	
	//专业静态页面请求
	@RequestMapping("/static-html")
	public ModelAndView static_html() {
		return new ModelAndView("static-html");
	}
}
