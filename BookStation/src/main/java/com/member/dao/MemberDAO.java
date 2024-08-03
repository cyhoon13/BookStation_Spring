package com.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.member.domain.LoginVO;
import com.member.domain.MemberVO;

public interface MemberDAO {
	 
	//로그인
	@Select("select * from login where member_id=#{member_id}")
	public LoginVO memberLogin(String member_id);
		 
	 //회원가입
	 @Insert("insert into member(member_id,member_password,member_name,member_gender,member_email,member_phone,member_zipcode,member_address1,member_address2,member_birthday,reg_date)"
			 	+"values(#{member_id},#{member_password},#{member_name},#{member_gender},#{member_email},#{member_phone},#{member_zipcode},#{member_address1},#{member_address2},#{member_birthday},sysdate)")
	 public void memberRegister(MemberVO memberVO);
	 
	 //계정정보찾기
	 @Select("select * from member where member_name=#{member_name} and member_email=#{member_email}")
	 public MemberVO memberFind(@Param("member_name") String member_name,@Param("member_email") String member_email);
	 
	 //비밀번호 재설정
	 @Update("update member set member_password=#{member_password} where member_id=#{member_id}")
	 public void passwordChange(@Param("member_password") String member_password, @Param("member_id") String member_id);
	 
	 //아이디 중복체크
	 @Select("select * from member where member_id=#{member_id}")
	 public MemberVO idCheck(String member_id);
	 
	 //회원탈퇴
	 @Delete("delete from login WHERE member_id=#{member_id}")
	 public void memberLeave(String member_id);
	 
	 //회원탈퇴 시 회원등급을 Inactive로 변경
	 @Update("update member set grade_name='Inactive' where member_id=#{member_id}")
	 public void gradeUpdate(String member_id);
	 
	 //회원정보 수정
	 @Update("update member set member_name=#{member_name}, member_email=#{member_email}, member_zipcode=#{member_zipcode},"
	 		      +"member_address1=#{member_address1}, member_address2=#{member_address2}, member_phone=#{member_phone} where member_id=#{member_id}")
	 public void infoChange(MemberVO memberVO);
}
