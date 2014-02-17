package com.owner.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.owner.dao.IMenuLevelOneDAO;
import com.owner.dao.IMenuLevelThreeDAO;
import com.owner.dao.IMenuLevelTwoDAO;
import com.owner.entity.MenuLevelOne;
import com.owner.entity.MenuLevelThree;
import com.owner.entity.MenuLevelTwo;

@Controller
@SessionAttributes
public class MenuController {
	@Resource(name = "menuLevelOneDAO")
	private IMenuLevelOneDAO menuLevelOneDAO;
	@Resource(name = "menuLevelTwoDAO")
	private IMenuLevelTwoDAO menuLevelTwoDAO;
	@Resource(name = "menuLevelThreeDAO")
	private IMenuLevelThreeDAO menuLevelThreeDAO;
	
    @RequestMapping("/menu")
    public ModelAndView getMenu() 
    {
    	List<MenuLevelOne> menuLevelOneList=null;
    	
    	MenuLevelOne menuLevelOne=new MenuLevelOne();
    	menuLevelOne.setRole_code(6);
		menuLevelOneList=menuLevelOneDAO.getMenuLevelOne(menuLevelOne);
		
		return new ModelAndView("index1", "menuList", menuLevelOneList);
    }
    
    @RequestMapping("/content")
	public ModelAndView content() {
		return new ModelAndView("content");
	}
    @RequestMapping("/ssystem_maintenance")
	public ModelAndView ssystem_maintenance() {			
		List<MenuLevelTwo> menuLevelTwoList=null;
		MenuLevelTwo menuLevelTwo=new MenuLevelTwo();
		menuLevelTwo.setMenu_level_one_id(1);		
		menuLevelTwoList=menuLevelTwoDAO.getMenuLevelTwo(menuLevelTwo);
		
		if(menuLevelTwoList!=null&&menuLevelTwoList.size()>0)
		{	
			for(int i1=0;i1<menuLevelTwoList.size();i1++)
			{
				List<MenuLevelThree> threeList=new ArrayList<MenuLevelThree>();
				MenuLevelThree menuLevelThree=new MenuLevelThree();
				menuLevelThree.setMenu_level_two_id(menuLevelTwoList.get(i1).getMenu_level_two_id());
				threeList=menuLevelThreeDAO.getMenuLevelThree(menuLevelThree);
				menuLevelTwoList.get(i1).setMenuLevelThreeList(threeList);
			}
		}
		for (int i = 0; i < menuLevelTwoList.size(); i++) {
			System.out.println("==================="+menuLevelTwoList.get(i).toString());
		}
		return new ModelAndView("ssystem_maintenance","menulist",menuLevelTwoList);
	}
	@RequestMapping("/professional_introduction")
	public ModelAndView professional_introduction() {
		return new ModelAndView("professional_introduction");
	}
	@RequestMapping("/curriculum_system")
	public ModelAndView curriculum_system() {
		return new ModelAndView("curriculum_system");
	}
	@RequestMapping("/teachers_qualification")
	public ModelAndView teachers_qualification() {
		return new ModelAndView("teachers_qualification");
	}
	@RequestMapping("/outline")
	public ModelAndView outline() {
		return new ModelAndView("outline");
	}
	@RequestMapping("/courseware")
	public ModelAndView courseware() {
		return new ModelAndView("courseware");
	}
	@RequestMapping("/teaching_materials")
	public ModelAndView teaching_materials() {
		return new ModelAndView("teaching_materials");
	}
	@RequestMapping("/interactive_platform")
	public ModelAndView interactive_platform() {
		return new ModelAndView("interactive_platform");
	}
	@RequestMapping("/teaching_video")
	public ModelAndView teaching_video() {
		return new ModelAndView("teaching_video");
	}
	@RequestMapping("/homework")
	public ModelAndView homework() {
		return new ModelAndView("homework");
	}
	@RequestMapping("/online_testing")
	public ModelAndView online_testing() {
		return new ModelAndView("online_testing");
	}
	@RequestMapping("/practicing")
	public ModelAndView practicing() {
		return new ModelAndView("practicing");
	}
}
