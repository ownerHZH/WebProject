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

import com.owner.dao.ITeacherDAO;
import com.owner.entity.Teacher;

@Repository(value = "teacherDAO")
@Transactional
public class TeacherDAOImpl implements ITeacherDAO {

	@Resource(name="sqlSessionFactory")
	private SqlSessionFactory sqlSessionFactory;

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	@Override
	public boolean addTeacher(Teacher teacher) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i1=0;
		try{
			i1 = session.insert("addTeacher", teacher);
			session.commit();
		}finally
		{
			session.close();
		}				
		return i1 != 0;
	}

	@Override
	public Teacher getTeacherByCode(Teacher teacher) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		Teacher r=null;
		try{
			r = session.selectOne("getTeacherByCode", teacher);
		}finally
		{
			session.close();
		}				
		return r;
	}

	@Override
	public List<Teacher> getAllTeacher() {
		SqlSession session = this.getSqlSessionFactory().openSession();
		List<Teacher> teacherList= null;
		try {
			teacherList = session.selectList("getAllTeacher");
		} finally
		{
			session.close();
		}		
		return teacherList;
	}

	@Override
	public boolean updateTeacher(Teacher teacher) {
		SqlSession session = this.getSqlSessionFactory().openSession();
		int i=0;
		try {
			i = session.update("updateTeacher", teacher);
			session.commit();
		} finally {
			session.close();
		}		
		return i != 0;
	}

	@Override
	public void addTeacher(List<Teacher> teachers) {
		SqlSession sqlSession=null;
		try {
			sqlSession = this.getSqlSessionFactory().openSession(ExecutorType.BATCH, false);
			for(int i=0;i<teachers.size();i++)
			{
				if(teachers.get(i).equals(null))
				{
					teachers.remove(i);
				}
			}
			Map<String, List<Teacher>> tmp = new HashMap<String, List<Teacher>>();
			tmp.put("teachers", teachers);
			sqlSession.insert("addTeacherBatch", tmp);
			sqlSession.commit();
		}finally
		{
			sqlSession.close();
		}
	}


}
