package com.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.member.domain.CategorydetailVO;
import com.member.domain.CategorymainVO;

public interface CategoryDAO {
	// 1. 선택한 메인 카테고리 가져오기
	@Select("select * from categorymain where category_mainid=#{ctgrMain}")
	public CategorymainVO getOneMainCategory(String ctgrMain);
	
	// 2. 선택한 서브 카테고리 가져오기
	@Select("select * from categorydetail where category_id=#{ctgrDetail}")
	public CategorydetailVO getOneSubCategory(String ctgrDetail);
	
	// 3. 메인 카테고리 목록 가져오기
	@Select("select * from categorymain")
	public List<CategorymainVO> getAllMainCategory();
	
	// 4. 모든 서브 카테고리 목록 가져오기
	@Select("select * from categorydetail")
	public List<CategorydetailVO> getAllDetailCategory();
	
	// 5. 메인 카테고리에 해당하는 서브 카테고리 목록 가져오기
	@Select("select * from categorydetail where category_mainID=#{ctgrMain}")
	public List<CategorydetailVO> getDetailCategory(String ctgrMain);
}
