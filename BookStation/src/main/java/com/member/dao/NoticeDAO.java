package com.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.member.domain.NoticeVO;

public interface NoticeDAO {
	
	// 공지사항 전체
	@Select("SELECT * FROM notice ORDER BY notice_date DESC")
    List<NoticeVO> getAllNoticeList();
	
	// 공지사항 상세보기
    @Select("SELECT * FROM notice WHERE notice_id = #{notice_id}")
    List<NoticeVO> getNoticeById(int notice_id);
    
    // 조회수 증가
    @Update("UPDATE notice SET notice_views = notice_views + 1 WHERE notice_id = #{notice_id}")
    void increaseNoticeViews(int notice_id);

    
}
