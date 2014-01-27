package com.owner.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.owner.dao.IUserDAO;
import com.owner.entity.UserTable;

/*@Repository(value = "userDAO")
@Transactional*/
public class UserDAOImpl implements IUserDAO {
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public boolean addUser(UserTable userTable) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i1 = session.insert("addUser", userTable);
		session.close();
		return i1 != 0;
	}

	public boolean updateUser(UserTable userTable) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i = session.update("updateUser", userTable);
		return i != 0;
	}

	public boolean checkUser(UserTable userTable) {
		return false;
	}

}

