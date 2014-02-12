package com.owner.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.owner.dao.IMenuLevelOneDAO;
import com.owner.dao.IMenuLevelThreeDAO;
import com.owner.dao.IMenuLevelTwoDAO;
import com.owner.dao.IUserDAO;
import com.owner.dao.impl.UserDAOImpl;
import com.owner.entity.Contact;
import com.owner.entity.MenuLevelOne;
import com.owner.entity.MenuLevelThree;
import com.owner.entity.MenuLevelTwo;
import com.owner.entity.UserTable;

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
    public String getMenu() 
    {
    	List<MenuLevelOne> menuLevelOneList=null;
    	List<MenuLevelTwo> menuLevelTwoList=null;
    	List<MenuLevelThree> menuLevelThreeList=null;
    	MenuLevelOne menuLevelOne=new MenuLevelOne();
    	menuLevelOne.setRole_code(6);
		menuLevelOneList=menuLevelOneDAO.getMenuLevelOne(menuLevelOne);
		if(menuLevelOneList!=null&&menuLevelOneList.size()>0)
		{
			for(int i=0;i<menuLevelOneList.size();i++)
			{
				MenuLevelTwo menuLevelTwo=new MenuLevelTwo();
				menuLevelTwo.setMenu_level_one_id(menuLevelOneList.get(i).getMenu_level_one_id());
				menuLevelTwoList=menuLevelTwoDAO.getMenuLevelTwo(menuLevelTwo);
				menuLevelOneList.get(i).setMenuLevelTwoList(menuLevelTwoList);
			}
			if(menuLevelTwoList!=null&&menuLevelTwoList.size()>0)
			{	
				for(int i=0;i<menuLevelTwoList.size();i++)
				{
					MenuLevelThree menuLevelThree=new MenuLevelThree();
					menuLevelThree.setMenu_level_two_id(menuLevelTwoList.get(i).getMenu_level_two_id());
					menuLevelThreeList=menuLevelThreeDAO.getMenuLevelThree(menuLevelThree);
					for(int j=0;j<menuLevelThreeList.size();j++)
					{
						System.out.println("---three---"+menuLevelThreeList.get(j).toString());
					}
					menuLevelTwoList.get(i).setMenuLevelThreeList(menuLevelThreeList);
				}
			}
		}
		for(int i=0;i<menuLevelOneList.size();i++)
		{
			System.out.println("==++++++==="+menuLevelOneList.get(i).toString());
		}
        return "";
    }
      
}
