package com.owner.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.owner.dao.IMenuLevelTwoDAO;
import com.owner.entity.MenuLevelTwo;

@Repository(value = "menuLevelTwoDAO")
@Transactional
public class MenuLevelTwoDAOImpl implements IMenuLevelTwoDAO {
	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public boolean addMenuLevelTwo(MenuLevelTwo menuLevelTwo) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i1 = session.insert("addMenuLevelTwo", menuLevelTwo);
		session.close();
		return i1 != 0;
	}

	@Override
	public List<MenuLevelTwo> getMenuLevelTwo(MenuLevelTwo menuLevelTwo) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		List<MenuLevelTwo> menuLevelTwoList=null;
		menuLevelTwoList = session.selectList("getMenuLevelTwo", menuLevelTwo);
		session.close();
		return menuLevelTwoList;
	}

	@Override
	public boolean updateMenuLevelTwo(MenuLevelTwo menuLevelTwo) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i = session.update("updateMenuLevelTwo", menuLevelTwo);
		return i != 0;
	}

}

