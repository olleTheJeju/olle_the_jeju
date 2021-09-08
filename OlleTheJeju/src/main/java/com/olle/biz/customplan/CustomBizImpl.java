package com.olle.biz.customplan;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olle.dao.customplan.CustomDao;
import com.olle.dto.customplan.CustomDto;

@Service
public class CustomBizImpl implements CustomBiz{

	@Autowired
	private CustomDao dao;
	
	@Override
	public List<CustomDto> selectList() {
		return dao.selectList();
	}

	@Override
	public CustomDto selectOne(int plan_num) {
		return dao.selectOne(plan_num);
	}

	@Override
	public int insert(CustomDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(CustomDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int plan_num) {
		return dao.delete(plan_num);
	}
	
}
