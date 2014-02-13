package com.owner.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
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
    public String getMenu() 
    {
    	List<MenuLevelOne> menuLevelOneList=null;
    	
    	MenuLevelOne menuLevelOne=new MenuLevelOne();
    	menuLevelOne.setRole_code(6);
		menuLevelOneList=menuLevelOneDAO.getMenuLevelOne(menuLevelOne);
		if(menuLevelOneList!=null&&menuLevelOneList.size()>0)
		{			
			for(int i=0;i<menuLevelOneList.size();i++)
			{
				List<MenuLevelTwo> menuLevelTwoList=null;
				MenuLevelTwo menuLevelTwo=new MenuLevelTwo();
				menuLevelTwo.setMenu_level_one_id(menuLevelOneList.get(i).getMenu_level_one_id());		
				menuLevelTwoList=menuLevelTwoDAO.getMenuLevelTwo(menuLevelTwo);
				menuLevelOneList.get(i).setMenuLevelTwoList(menuLevelTwoList);
				
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
			}
			
		}
		for(int i=0;i<menuLevelOneList.size();i++)
		{
			System.out.println("==++++++==="+menuLevelOneList.get(i).toString());
		}
        return "";
    }
      
}
