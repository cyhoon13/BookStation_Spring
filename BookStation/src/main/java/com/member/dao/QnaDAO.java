package com.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.member.domain.GradeVO;
import com.member.domain.MemberVO;
import com.member.domain.QnaVO;

public interface QnaDAO {

	// 회원 1명
	@Select("select * from member where member_id=#{member_id}")
	public List<MemberVO> getMemberList(String member_id);

	// 등급
	@Select("select * from grade")
	public List<GradeVO> getGradeList();
	
	// 문의 갯수
	@Select("select count(*) from qna where member_id=#{member_id}")
	public int getQnaCount(String member_id);
	
	// 문의내역 전체
	@Select("select * from qna where member_id=#{member_id} order by qna_date desc, qna_id desc")
	public List<QnaVO> getMypageQnaList(String member_id);
    
	// 문의내역 전체
    @Select("select * from ("+
            "select qna.*, ROW_NUMBER() over (ORDER BY qna_date DESC, qna_id DESC) as rnum from qna where member_id=#{member_id})"+
            "where rnum between #{start} and #{end}")
    public List<QnaVO> getAllQnaList(Map<String, Object> pageRange);
    
    // 문의내역 1개
    @Select("select * from qna where qna_id=#{qna_id}")
    public List<QnaVO> getQnaList(int qna_id);
    
    // 문의 insert
    @Insert("insert into qna(member_id,qna_type,qna_title,qna_content) values(#{member_id},#{qna_type},#{qna_title},#{qna_content})")
    public void insertQna(QnaVO qnaVO);
    
    // 문의 update
    @Update("update qna set qna_type=#{qna_type},qna_title=#{qna_title},qna_content=#{qna_content} where qna_id=#{qna_id}")
    public void updateQna(QnaVO qnaVO);
    
    // 문의 delete
    @Delete("delete from qna where qna_id=#{qna_id}")
    public void deleteQna(int qna_id);
	
}
