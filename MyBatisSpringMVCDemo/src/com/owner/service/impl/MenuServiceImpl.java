package com.owner.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.owner.dao.IMenuLevelOneDAO;
import com.owner.dao.IMenuLevelThreeDAO;
import com.owner.dao.IMenuLevelTwoDAO;
import com.owner.entity.MenuLevelOne;
import com.owner.entity.MenuLevelThree;
import com.owner.entity.MenuLevelTwo;
import com.owner.service.IMenuService;

@Service(value="menuService")
public class MenuServiceImpl implements IMenuService {
	
	@Resource(name = "menuLevelOneDAO")
	private IMenuLevelOneDAO menuLevelOneDAO;
	@Resource(name = "menuLevelTwoDAO")
	private IMenuLevelTwoDAO menuLevelTwoDAO;
	@Resource(name = "menuLevelThreeDAO")
	private IMenuLevelThreeDAO menuLevelThreeDAO;

	@Override
	public List<MenuLevelOne> getMenuOneLevelByRoleCode(int code) {
		
        List<MenuLevelOne> menuLevelOneList=null;
    	
    	MenuLevelOne menuLevelOne=new MenuLevelOne();
    	menuLevelOne.setRole_code(code);
		menuLevelOneList=menuLevelOneDAO.getMenuLevelOne(menuLevelOne);
		return menuLevelOneList;
	}

	@Override
	public List<MenuLevelTwo> getMenuLevelTwoAndThreeByMenuLevelOneCode(int code) {
		
		List<MenuLevelTwo> menuLevelTwoList=null;
		MenuLevelTwo menuLevelTwo=new MenuLevelTwo();
		menuLevelTwo.setMenu_level_one_id(code);		
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
		return menuLevelTwoList;
	}

}
