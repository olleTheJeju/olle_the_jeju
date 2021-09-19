package com.olle.biz.pagination;

import java.util.ArrayList;
import java.util.List;

import com.olle.dto.etc.ImgDto;
import com.olle.dto.jejusituation.JejuDto;
import com.olle.dto.jejusituation.MenuDto;

public interface JejuPageBiz {
	//전체 요소 갯수 가져오기
	int getTotalElements();
	//전체 페이지수계산-unit개씩 끊어서 계산
	int getTotalPages(int unit);
	//시작인덱스,끝인덱스 계산하기
	int[] getStartAndEndIdx(int unit,int page);
	//시작인덱스, 끝인덱스로 해당 페이지 가져오기
	List<JejuDto> getStoreElementsPerPage(int startIdx,int endIdx,int page);
	List<ImgDto> getImgElementsPerPage(int startIdx,int endIdx,int page);
	ArrayList<ArrayList<MenuDto>> getMenuListElementsPerPage(int startIdx,int endIdx,int page);
}