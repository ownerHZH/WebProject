package com.owner.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.owner.entity.MenuLevelOne;
import com.owner.entity.MenuLevelTwo;
import com.owner.service.IMenuService;

@Controller
@SessionAttributes
public class MenuController {
	
	@Resource(name = "menuService")
	private IMenuService menuService;
		
	//主界面
    @RequestMapping("/menu")
    public ModelAndView getMenu() 
    {
    	List<MenuLevelOne> menuLevelOneList=menuService.getMenuOneLevelByRoleCode(6);		
		return new ModelAndView("index1", "menuList", menuLevelOneList);
    }
    
    @RequestMapping("/content")
	public ModelAndView content() {
		return new ModelAndView("content");
	}
    
    //系统维护页面
    @RequestMapping("/ssystem-maintenance")
	public ModelAndView ssystem_maintenance() {			
		
    	List<MenuLevelTwo> menuLevelTwoList=menuService.getMenuLevelTwoAndThreeByMenuLevelOneCode(1);

		return new ModelAndView("systemmaintenance/ssystem-maintenance","menulist",menuLevelTwoList);
	}
	
    //课程体系页面
	@RequestMapping("/curriculum-system")
	public ModelAndView curriculum_system() {
		return new ModelAndView("curriculum-system");
	}
	
	//师资情况页面
	@RequestMapping("/teachers-qualification")
	public ModelAndView teachers_qualification() {
		return new ModelAndView("teachers-qualification");
	}
	
	//大纲页面
	@RequestMapping("/outline")
	public ModelAndView outline() {
		return new ModelAndView("outline");
	}
	
	//课件页面
	@RequestMapping("/courseware")
	public ModelAndView courseware() {
		return new ModelAndView("courseware");
	}
	
	//教辅资料页面
	@RequestMapping("/teaching-materials")
	public ModelAndView teaching_materials() {
		return new ModelAndView("teaching-materials");
	}
	
	//互动平台页面
	@RequestMapping("/interactive-platform")
	public ModelAndView interactive_platform() {
		return new ModelAndView("interactive-platform");
	}
	
	//教学录像页面
	@RequestMapping("/teaching-video")
	public ModelAndView teaching_video() {
		return new ModelAndView("teaching-video");
	}
	
	//作业页面
	@RequestMapping("/homework")
	public ModelAndView homework() {
		return new ModelAndView("homework");
	}
	
	//在线测试页面
	@RequestMapping("/online-testing")
	public ModelAndView online_testing() {
		return new ModelAndView("online-testing");
	}
	
	//实战演练页面
	@RequestMapping("/practicing")
	public ModelAndView practicing() {
		return new ModelAndView("practicing");
	}
	
	//系统维护 三级菜单所对应的页面
	@RequestMapping("/menu-content-add-role")
	public ModelAndView menu_content_add_role() {
		return new ModelAndView("systemmaintenance/menu-content-add-role");
	}
	@RequestMapping("/menu-content-role-setting")
	public ModelAndView menu_content_role_setting() {
		return new ModelAndView("systemmaintenance/menu-content-role-setting");
	}
	@RequestMapping("/menu-content-import-teachers")
	public ModelAndView menu_content_import_teachers() {
		return new ModelAndView("systemmaintenance/menu-content-import-teachers");
	}
	@RequestMapping("/menu-content-import-students")
	public ModelAndView menu_content_import_students() {
		return new ModelAndView("systemmaintenance/menu-content-import-students");
	}
	@RequestMapping("/menu-content-add-user")
	public ModelAndView menu_content_add_user() {
		return new ModelAndView("systemmaintenance/menu-content-add-user");
	}
	@RequestMapping("/menu-content-change-password")
	public ModelAndView menu_content_change_password() {
		return new ModelAndView("systemmaintenance/menu-content-change-password");
	}
	@RequestMapping("/menu-content-add-direction")
	public ModelAndView menu_content_add_direction() {
		return new ModelAndView("systemmaintenance/menu-content-add-direction");
	}
	@RequestMapping("/menu-content-change-direction")
	public ModelAndView menu_content_change_direction() {
		return new ModelAndView("systemmaintenance/menu-content-change-direction");
	}
	@RequestMapping("/menu-content-add-property")
	public ModelAndView menu_content_add_property() {
		return new ModelAndView("systemmaintenance/menu-content-add-property");
	}
	@RequestMapping("/menu-content-change-property")
	public ModelAndView menu_content_change_property() {
		return new ModelAndView("systemmaintenance/menu-content-change-property");
	}
	@RequestMapping("/menu-content-add-category")
	public ModelAndView menu_content_add_category() {
		return new ModelAndView("systemmaintenance/menu-content-add-category");
	}
	@RequestMapping("/menu-content-change-category")
	public ModelAndView menu_content_change_category() {
		return new ModelAndView("systemmaintenance/menu-content-change-category");
	}
}
