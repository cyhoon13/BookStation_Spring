package com.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.member.domain.AdminMemVO;
import com.member.domain.CartVO;
import com.member.domain.DataChangeLogVO;
import com.member.domain.LoginVO;
import com.member.domain.MemberVO;
import com.member.domain.QnaVO;
import com.member.domain.logTryLogVO;
import com.member.domain.pageMoveLogVO;

public interface AdminDAO {
	/*
	 * 1. 관리
	 * 1-1. 회원 관리
	 * 		- 기본적으로 가입 날짜 순으로 정렬
	 * 		- 멤버의 모든 상세 정보 조회 가능(JSP에서 펼쳐보기로 상세 조회 - faq.jsp 참고)
	 * 		- 탈퇴한 멤버는 로그인 테이블에서 사라지고 멤버에만 남아있으므로 로그인 테이블 유무로 탈퇴 판단
	 * 		- 회원 조회, 삭제 가능
	 * 		- 전체 회원 목록, 활동 회원 목록, 탈퇴 회원 목록 나눠 보기
	 * 		- 페이징 처리
	 */
	// 모든 Member 리스트 - 날짜순, 페이징처리 적용
	@Select("select * from ("
			+ "	select rownum rnum, mem.* from ("
			+ "		select * from member order by reg_date desc"
			+ "	) mem"
			+ ") where rnum between #{start} and #{end}")
	public List<AdminMemVO> getAllMemberList(Map<String, Object> map);
	
	// 모든 Member 수(활동+탈퇴)
	@Select("select count(*) from member")
	public int getAllMemberCount();
	
	// 활동 중인 Member 리스트 - 날짜순, 페이징처리 적용
	@Select("select * from ("
			+ "	select rownum rnum, mem.* from ("
			+ "		select * from member where grade_name!='Inactive' order by reg_date desc"
			+ "	) mem"
			+ ") where rnum between #{start} and #{end}")
	public List<AdminMemVO> getActiveMemberList(Map<String, Object> map);
	
	// 활동 중인 Member 수(로그인 테이블 수 = 활동 중인 회원 수)
	@Select("select count(*) from login")
	public int getActiveMemCount();
	
	// 탈퇴한 Member 리스트 - 날짜순, 페이징처리 적용
	@Select("select * from ("
			+ "	select rownum rnum, mem.* from ("
			+ "		select * from member where grade_name='Inactive' order by reg_date desc"
			+ "	) mem"
			+ ") where rnum between #{start} and #{end}")
	public List<AdminMemVO> getInactiveMemberList(Map<String, Object> map);
	
	// 탈퇴한 Member 수
	@Select("select count(*) from member where grade_name='Inactive'")
	public int getInactiveMemCount();
	
	// 모든 Login 리스트(탈퇴 검사용)
	@Select("select member_id from login")
	public List<String> getAllLoginList();
	
	// 회원 삭제
	@Delete("delete from member where member_id = #{member_id}")
    public void deleteMember(String member_Id);
	
	// 회원정보 상세 조회
	@Select("select * from member where member_id = #{member_id}")
    public AdminMemVO getMemberInfo(String member_Id);
	
	
	/* 1-2. 로그 관리
	 * 		- 로그 try 로그, 페이지 이동 로그, 데이터 변경 로그로 구분
	 * 		- 로그ID 명명 규칙은 노션 참고
	 * 		- 기본적으로 모두 시간 순
	 * 		- 테이블에는 Date로 모두 저장되어 있지만, 페이지에서는 일자와 시간으로 구분하여 따로 표기
	 * 	로그 try 로그
	 * 		- 화면에 띄울 정보 : 순번, 로그ID, 시도일자, 시도시간, 사용자ID, 시도구분(login, logout), 성공여부, 실패 원인(실패했을 때만)
	 * 		- 로그인, 로그아웃 시도 전부 기록 - 로그아웃, 로그인 실패, 로그인 성공 기록만 볼 수 있는 필터 적용
	 * 		- 로그인이 되지 않았을 경우 '성공 여부'를 N로 기록 - 실패 원인 기록
	 * 	화면 이동 로그
	 * 		- 화면에 띄울 정보 : 순번, 로그ID, 접속일자, 접속시간, 사용자ID, 화면ID, 화면이름
	 * 		- 비회원일 경우 아이디를 anonymous로 표기
	 * 		- 이동한 화면ID는 JSP파일(view)의 이름, 화면 이름은 논리적 이름(ex: 메인, 마이페이지 등등)
	 * 	데이터 변경 로그
	 * 		- 화면에 띄울 정보 : 순번, 로그ID, 변경일자, 변경시간, 사용자ID, 화면ID, 변경테이블, 변경속성, 변경구분, 변경내용
	 * 		- 화면ID : 데이터 변경을 시도한 페이지
	 * 		- 변경테이블, 변경속성 : 데이터 변경이 일어난 테이블과 속성명 기록. 여러개일 경우에도 전부 기록
	 * 		- 변경구분 : 삽입(insert), 수정(update), 삭제(delete)
	 * 		- 변경내용 : 삽입과 수정시에만 새로이 입력된 내용 기록
	 * 		- 화면ID, 변경 구분에 따른 필터 적용
	 * 		- 변경 테이블에 따른 필터 적용?? (필요한 거 같긴 한데 할게 너무 많을까봐...)
	 */
	
	// 회원 접속 로그 테이블 저장 - 로그인 성공
	@Insert("insert into logTryLog values('LG-${member_id}-LIN-' || to_char(sysdate, 'YYMMDDHH24MISS'), #{member_id}, 'LogIn', sysdate, 'Y', null)")
	public void insLogTryInSuccess(Map<String, Object> map);
	// 회원 접속 로그 테이블 저장 - 로그인 실패
	@Insert("insert into logTryLog values('LG-${member_id}-LIN-' || to_char(sysdate, 'YYMMDDHH24MISS'), #{member_id}, 'LogIn', sysdate, 'N', #{failMsg})")
	public void insLogTryInFail(Map<String, Object> map);
	// 회원 접속 로그 테이블 저장 - 로그아웃
	@Insert("insert into logTryLog values('LG-${member_id}-LOT-' || to_char(sysdate, 'YYMMDDHH24MISS'), #{member_id}, 'LogOut', sysdate, 'Y', null)")
	public void insLogTryOut(Map<String, Object> map);
	
	// 로그try로그 리스트 - 시간순, 페이징처리
	@Select("select * from ("
			+ "	select rownum rnum, logs.* from ("
			+ "		select * from logTryLog"
			+ "		order by logTime desc"
			+ "	) logs"
			+ ") where rnum between #{start} and #{end}")
	public List<logTryLogVO> getAllLogTryList(Map<String, Object> map);
	// 로그try로그 개수
	@Select("select count(*) from logTryLog")
	public int getAllLogTryCount();
	
	// 페이지 이름과 일치하는 페이지 아이디 가져오기
	@Select("select pageID from pages where pageJsp=#{viewname}")
	public String getPageID(String viewname);
	// 페이지 이동 로그 저장 logID, member_id, logTime, pageID
	@Insert("insert into pageMoveLog values('PG-${member_id}-${pageID}-' || to_char(sysdate, 'YYMMDDHH24MISS'),#{member_id},sysdate,#{pageID})")
	public void insPageMoveLog(Map<String, Object> map);
	
	// 페이지 ID에 따른 페이지
	// 페이지 이동 로그 리스트 - 시간순, 페이징처리
	@Select("select * from ("
			+ "    select rownum rnum, logs.* from ("
			+ "        select logs.*, pgs.pageJsp, pgs.pageName from ("
			+ "            select * from pageMoveLog"
			+ "        ) logs, ("
			+ "            select * from pages"
			+ "        ) pgs"
			+ "        where logs.pageID=pgs.pageID"
			+ "        order by logTime desc"
			+ "    ) logs"
			+ ") where rnum between #{start} and #{end}")
	public List<pageMoveLogVO> getAllPageMoveList(Map<String, Object> map);
	// 페이지 이동 로그 개수
	@Select("select count(*) from pageMoveLog")
	public int getAllPageMoveCount();

	// 데이터 변경 로그 저장 - 로그ID, 회원ID, 시간, 페이지ID, 변경테이블, 변경 속성, 변경코드, 변경내용
	@Insert("insert into dataChangeLog values('DT-${member_id}-${chngCode}-' || to_char(sysdate, 'YYMMDDHH24MISS'),"
			+ "#{member_id},sysdate,#{pageID},#{targetTable},#{targetColumn},#{chngCode},#{chngValue})")
	public void insDataChangeLog(Map<String, Object> map);
	
	// 회원 한 명 불러오기 - member
	@Select("select * from member where member_id=#{member_id}")
	public MemberVO getOneMem(String member_id);
	// 회원 한 명 불러오기 - login
	@Select("select * from login where member_id=#{member_id}")
	public LoginVO getOneLogin(String member_id);
	
	// 방금 들어간 카트 테이블 가져오기
	@Select("select * from (select * from cart where member_id=#{member_id} order by cart_id desc) where rownum=1")
	public CartVO getRecentMyCart(String member_id);
	
	// 현재 회원의 비밀번호 가져오기
	@Select("select member_password from login where member_id=#{member_id}")
	public String getThisMemberPassword(String member_id);
	
	// 방금 들어간 문의 불러오기
	@Select("select * from (select * from qna where member_id=#{member_id} order by qna_date desc) where rownum=1")
	public QnaVO getRecentMyQnA(String member_id);
	
	// 데이터 변경 로그 리스트 - 시간순, 페이징처리
	@Select("select * from ("
			+ "    select rownum rnum, logs.* from ("
			+ "        select dataChangeLog.*, pages.pageJsp from dataChangeLog, pages "
			+ "        where dataChangeLog.pageID=pages.pageID"
			+ "        order by logTime desc"
			+ "    ) logs"
			+ ") where rnum between #{start} and #{end}")
	public List<DataChangeLogVO> getAllDataChangeList(Map<String, Object> map);
	// 데이터 변경 로그 개수
	@Select("select count(*) from dataChangeLog")
	public int getAllDataChangeCount();
	
	/* 2. 상품 및 거래
	 * 2-1. 상품 관리
	 * 		- 화면에 띄울 정보 : isbn, 카테고리ID, 제목, 발행일, 재고, 할인율, 판매량, 평점 - 내용 많을 시 펼쳐보기 적용
	 * 		- 최초 등록되지 않은 상품은 재고가 0임. 등록 후 발주를 통해 재고 확보
	 * 		- 등록 시 관리자가 할인율 등록
	 * 		- 할인율 수정 가능
	 * 		- 전체 목록, 등록된 목록, 등록되지 않은 목록 탭 적용
	 * 		- 기본적으로 발행일 순(최신순)
	 * 		- 발주를 위해 재고 적은 순으로 정렬 가능
	 * 		- 발주 버튼 클릭 시 100권 즉시 입고 및 새로고침
	 * 		- 등록된 상품은 삭제, 등록되지 않은 상품은 등록 버튼
	 * 2-2. 거래 내역
	 * 		- 화면에 띄울 정보 : 주문번호(order_id), 결제일, 구매자ID, isbn, 책 제목, 권수, 수량, 상태
	 * 		- ordersPrint의 정보를 불러올 예정(판매된 상품 단위)
	 * 		- 관리자가 수정할 부분 없음
	 * 		- 기간별 조회 필터 추가
	 */
	
	
	/* 3. 게시판
	 * 3-1. 공지사항
	 * 		- 화면에 띄울 정보 : 사용자가 보는 공지사항과 동일 + 수정 및 삭제 버튼
	 * 		- 공지사항 등록 가능
	 * 		- 등록, 수정 시 임시보관함으로 이동 가능. 수정 시 임시보관함으로 넣을 경우 사용자 쪽에서는 확인할 수 없음
	 * 		- 등록된 공지사항 목록, 임시보관함 목록 탭 적용
	 * 		- 모두 등록일 순으로 정렬
	 * 3-2. 문의내역
	 * 		- 화면에 띄울 정보 : 사용자가 보는 내역과 동일 + 답변 버튼(답변하지 않았을 경우)
	 * 		- 답변한 문의, 답변하지 않은 문의 탭 적용
	 * 		- 기본적으로 문의 일시 정렬
	 * 		- 답변 수정 가능
	 */
	
	
	
}
