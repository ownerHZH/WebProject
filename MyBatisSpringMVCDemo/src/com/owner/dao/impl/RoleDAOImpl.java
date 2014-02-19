package com.owner.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.owner.dao.IRoleDAO;
import com.owner.entity.Role;

@Repository(value = "roleDAO")
@Transactional
public class RoleDAOImpl implements IRoleDAO {

	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	@Override
	public boolean addRole(Role role) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i1=0;
		try{
			i1 = session.insert("addRole", role);
			session.commit();
		}finally
		{
			session.close();
		}				
		return i1 != 0;
	}

	@Override
	public Role getRoleById(Role role) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		Role r=null;
		try{
			r = session.selectOne("getRoleById", role);
		}finally
		{
			session.close();
		}				
		return r;
	}

	@Override
	public List<Role> getAllRole() {
		SqlSession session = this.getSqlSessionFactory().openSession();
		List<Role> roleList= null;
		try {
			roleList = session.selectList("getAllRole");
		} finally
		{
			session.close();
		}		
		return roleList;
	}

	@Override
	public boolean updateRole(Role role) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i=0;
		try {
			i = session.update("updateRole", role);
			session.commit();
		} finally {
			session.close();
		}		
		return i != 0;
	}


}
