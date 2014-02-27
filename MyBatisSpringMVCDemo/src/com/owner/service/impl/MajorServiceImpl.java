package com.owner.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.owner.dao.IMajorDAO;
import com.owner.entity.Major;
import com.owner.service.IMajorService;

@Service(value="majorService")
public class MajorServiceImpl implements IMajorService {

	@Resource(name = "majorDAO")
	private IMajorDAO majorDAO;
	
	@Override
	public List<Major> getMajorList() {
		List<Major> majors=majorDAO.getAllMajor();
		return majors;
	}

}
