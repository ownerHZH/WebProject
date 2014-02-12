package com.owner.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.owner.dao.IMenuLevelThreeDAO;
import com.owner.entity.MenuLevelThree;

@Repository(value = "menuLevelThreeDAO")
@Transactional
public class MenuLevelThreeDAOImpl implements IMenuLevelThreeDAO {
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	@Override
	public boolean addMenuLevelThree(MenuLevelThree menuLevelThree) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i1 = session.insert("addMenuLevelThree", menuLevelThree);
		session.close();
		return i1 != 0;
	}

	@Override
	public List<MenuLevelThree> getMenuLevelThree(MenuLevelThree menuLevelThree) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		List<MenuLevelThree> menuLevelThreeList=null;
		menuLevelThreeList = session.selectList("getMenuLevelThree", menuLevelThree);
		session.close();
		return menuLevelThreeList;
	}

	@Override
	public boolean updateMenuLevelThree(MenuLevelThree menuLevelThree) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i = session.update("updateMenuLevelThree", menuLevelThree);
		return i != 0;
	}

}

