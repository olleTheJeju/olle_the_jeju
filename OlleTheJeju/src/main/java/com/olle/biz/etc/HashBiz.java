package com.olle.biz.etc;

import java.util.List;

import com.olle.dto.etc.HashtagDto;

public interface HashBiz {
	public int insert(HashtagDto dto);
	public int maxNum();
	public List<HashtagDto> selectList(int board_num);
}
