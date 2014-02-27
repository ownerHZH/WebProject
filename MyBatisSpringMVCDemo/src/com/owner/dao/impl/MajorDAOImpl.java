package com.owner.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.owner.dao.IMajorDAO;
import com.owner.entity.Major;

@Repository(value = "majorDAO")
@Transactional
public class MajorDAOImpl implements IMajorDAO {

	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	@Override
	public boolean addMajor(Major major) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i1=0;
		try{
			i1 = session.insert("addMajor", major);
			session.commit();
		}finally
		{
			session.close();
		}				
		return i1 != 0;
	}

	@Override
	public Major getMajorById(Major major) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		Major r=null;
		try{
			r = session.selectOne("getMajorById", major);
		}finally
		{
			session.close();
		}				
		return r;
	}

	@Override
	public List<Major> getAllMajor() {
		SqlSession session = this.getSqlSessionFactory().openSession();
		List<Major> majorList= null;
		try {
			majorList = session.selectList("getAllMajor");
		} finally
		{
			session.close();
		}		
		return majorList;
	}

	@Override
	public boolean updateMajor(Major major) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i=0;
		try {
			i = session.update("updateMajor", major);
			session.commit();
		} finally {
			session.close();
		}		
		return i != 0;
	}

	@Override
	public void addMajor(List<Major> majors) {
		SqlSession sqlSession=null;
		try {
			sqlSession = this.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);
			Map<String, List<Major>> tmp = new HashMap<String, List<Major>>();
			tmp.put("majors", majors);
			sqlSession.insert("addMajorBatch", tmp);
			sqlSession.commit();
		}finally
		{
			sqlSession.close();
		}
	}


}
