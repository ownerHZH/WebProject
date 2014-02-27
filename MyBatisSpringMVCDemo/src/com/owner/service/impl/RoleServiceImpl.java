package com.owner.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.owner.dao.IRoleDAO;
import com.owner.entity.Role;
import com.owner.service.IRoleService;

@Service(value="roleService")
public class RoleServiceImpl implements IRoleService {

	@Resource(name = "roleDAO")
	private IRoleDAO roleDAO;
	
	@Override
	public boolean addRole(Role role) {
		boolean flag=roleDAO.addRole(role);
		return flag;
	}

}
