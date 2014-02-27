package com.owner.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.owner.dao.IMenuLevelOneDAO;
import com.owner.entity.MenuLevelOne;

@Repository(value = "menuLevelOneDAO")
@Transactional
public class MenuLevelOneDAOImpl implements IMenuLevelOneDAO {
	
	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public boolean addMenuLevelOne(MenuLevelOne menuLevelOne) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i1 = session.insert("addMenuLevelOne", menuLevelOne);
		session.close();
		return i1 != 0;
	}

	@Override
	public List<MenuLevelOne> getMenuLevelOne(MenuLevelOne menuLevelOne) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		List<MenuLevelOne> menuLevelOneList=null;
		menuLevelOneList = session.selectList("getMenuLevelOne", menuLevelOne);
		session.close();
		return menuLevelOneList;
	}

	@Override
	public boolean updateMenuLevelOne(MenuLevelOne menuLevelOne) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i = session.update("updateMenuLevelOne", menuLevelOne);
		return i != 0;
	}

}

