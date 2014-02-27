package com.owner.service;

import java.util.List;

import com.owner.entity.Major;

public interface IMajorService {
	/**
	 * 获取所有的专业名称
	 * @return
	 */
  public List<Major> getMajorList();
}
