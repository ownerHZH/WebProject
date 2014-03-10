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
    @RequestMapping("/ssystem-maintenance")
	public ModelAndView ssystem_maintenance() {			
		
    	List<MenuLevelTwo> menuLevelTwoList=menuService.getMenuLevelTwoAndThreeByMenuLevelOneCode(1);

		return new ModelAndView("systemmaintenance/ssystem-maintenance","menulist",menuLevelTwoList);
	}
	
	@RequestMapping("/curriculum-system")
	public ModelAndView curriculum_system() {
		return new ModelAndView("curriculum-system");
	}
	@RequestMapping("/teachers-qualification")
	public ModelAndView teachers_qualification() {
		return new ModelAndView("teachers-qualification");
	}
	@RequestMapping("/outline")
	public ModelAndView outline() {
		return new ModelAndView("outline");
	}
	@RequestMapping("/courseware")
	public ModelAndView courseware() {
		return new ModelAndView("courseware");
	}
	@RequestMapping("/teaching-materials")
	public ModelAndView teaching_materials() {
		return new ModelAndView("teaching-materials");
	}
	@RequestMapping("/interactive-platform")
	public ModelAndView interactive_platform() {
		return new ModelAndView("interactive-platform");
	}
	@RequestMapping("/teaching-video")
	public ModelAndView teaching_video() {
		return new ModelAndView("teaching-video");
	}
	@RequestMapping("/homework")
	public ModelAndView homework() {
		return new ModelAndView("homework");
	}
	@RequestMapping("/online-testing")
	public ModelAndView online_testing() {
		return new ModelAndView("online-testing");
	}
	@RequestMapping("/practicing")
	public ModelAndView practicing() {
		return new ModelAndView("practicing");
	}
	
	//三级菜单所对应的页面
	@RequestMapping("/menu-content-add-role")
	public ModelAndView menu_content_add_role() {
		return new ModelAndView("menu-content-add-role");
	}
	@RequestMapping("/menu-content-role-setting")
	public ModelAndView menu_content_role_setting() {
		return new ModelAndView("menu-content-role-setting");
	}
	@RequestMapping("/menu-content-import-teachers")
	public ModelAndView menu_content_import_teachers() {
		return new ModelAndView("menu-content-import-teachers");
	}
	@RequestMapping("/menu-content-import-students")
	public ModelAndView menu_content_import_students() {
		return new ModelAndView("menu-content-import-students");
	}
	@RequestMapping("/menu-content-add-user")
	public ModelAndView menu_content_add_user() {
		return new ModelAndView("menu-content-add-user");
	}
	@RequestMapping("/menu-content-change-password")
	public ModelAndView menu_content_change_password() {
		return new ModelAndView("menu-content-change-password");
	}
	@RequestMapping("/menu-content-add-direction")
	public ModelAndView menu_content_add_direction() {
		return new ModelAndView("menu-content-add-direction");
	}
	@RequestMapping("/menu-content-change-direction")
	public ModelAndView menu_content_change_direction() {
		return new ModelAndView("menu-content-change-direction");
	}
	@RequestMapping("/menu-content-add-property")
	public ModelAndView menu_content_add_property() {
		return new ModelAndView("menu-content-add-property");
	}
	@RequestMapping("/menu-content-change-property")
	public ModelAndView menu_content_change_property() {
		return new ModelAndView("menu-content-change-property");
	}
	@RequestMapping("/menu-content-add-category")
	public ModelAndView menu_content_add_category() {
		return new ModelAndView("menu-content-add-category");
	}
	@RequestMapping("/menu-content-change-category")
	public ModelAndView menu_content_change_category() {
		return new ModelAndView("menu-content-change-category");
	}
}
