package com.member.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.member.domain.ReviewVO;

public interface ReviewDAO {

    // 리뷰 목록 리스트 갯수 가져오기
    // 전체 기간 리뷰 갯수(디폴트)
    @Select("SELECT COUNT(*) FROM review where isReview=#{isReview} and member_id=#{memID}")
    public int getReviewCount(Map<String, Object> map);
    // 필터 - 하루, 일주일, 한달, 3개월에 따라 다른 갯수를 반환하는 메서드
    @Select("select count(*)\r\n"
            + "from review, (\r\n"
            + "    select * from ordersPrint\r\n"
            + "    where ordersPrint_date>=sysdate-#{filter}\r\n"
            + "    and ordersPrint_date<=sysdate\r\n"
            + "    and member_id=#{memID}\r\n"
            + ") books\r\n"
            + "where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id")
    public int getReviewCountByFilter(Map<String, Object> map); 
    // from-todate에 따른 리뷰 갯수
    @Select("select count(*)\r\n"
            + "from review, (\r\n"
            + "    select * from ordersPrint\r\n"
            + "    where ordersPrint_date>=#{fromDate}\r\n"
            + "    and ordersPrint_date<=#{toDate}\r\n"
            + "    and member_id=#{memID}\r\n"
            + ") books\r\n"
            + "where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id")
    public int getReviewCountByCalendar(Map<String, Object> map);

    // 리뷰 목록 리스트 가져오기 - 날짜순으로 정렬해야 함
    // 전체 기간 리뷰 목록(디폴트)
    @Select("select * from (\r\n"
            + "    select rownum rnum, rev.* from(\r\n"
            + "        select review.*\r\n"
            + "        from review, (\r\n"
            + "            select * from ordersPrint\r\n"
            + "            where member_id=#{memID}\r\n"
            + "               and ordersPrint_date<=sysdate"
            + "        ) books\r\n"
            + "        where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id\r\n"
            + "        order by review.ordersPrint_id desc\r\n"
            + "    ) rev\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<ReviewVO> getReviewList(Map<String, Object> map);
    // 전체 기간 책 목록(디폴트)
    @Select("select book_name from (\r\n"
            + "    select rownum rnum, rev.* from(\r\n"
            + "        select book_name from book, (\r\n"
            + "            select review.isbn\r\n"
            + "            from review, (\r\n"
            + "                select * from ordersPrint\r\n"
            + "                where member_id=#{memID}\r\n"
            + "                and ordersPrint_date<=sysdate\r\n"
            + "            ) books\r\n"
            + "            where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id\r\n"
            + "            order by review.ordersPrint_id desc\r\n"
            + "            ) a\r\n"
            + "        where a.isbn=book.isbn\r\n"
            + "    ) rev\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<String> getBookList(Map<String, Object> map);
    // 전체 기간 주문일 목록(디폴트)
    @Select("select ordersPrint_date from (\r\n"
            + "    select rownum rnum, reviews.ordersPrint_date from (\r\n"
            + "        select books.ordersPrint_date\r\n"
            + "        from review, (\r\n"
            + "            select * from ordersPrint\r\n"
            + "            where member_id=#{memID}\r\n"
            + "               and ordersPrint_date<=sysdate"
            + "        ) books\r\n"
            + "        where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id\r\n"
            + "        order by review.ordersPrint_id desc\r\n"
            + "    ) reviews\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<Date> getOrdersDateList(Map<String, Object> map);

    // 필터 - 하루, 일주일, 한달, 3개월에 따라 다른 리스트를 반환하는 메서드
    @Select("select * from (\r\n"
            + "    select rownum rnum, rev.* from(\r\n"
            + "        select review.*\r\n"
            + "        from review, (\r\n"
            + "            select * from ordersPrint\r\n"
            + "            where ordersPrint_date>=sysdate-#{filter}\r\n"
            + "            and ordersPrint_date<=sysdate\r\n"
            + "            and member_id=#{memID}\r\n"
            + "        ) books\r\n"
            + "        where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id\r\n"
            + "        order by books.ordersPrint_date desc\r\n"
            + "    ) rev\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<ReviewVO> getReviewListByFilter(Map<String, Object> map); 

    // 필터 적용된 책 목록 조회 메서드
    @Select("select book_name from (\r\n"
            + "    select rownum rnum, rev.* from(\r\n"
            + "        select book_name from book, (\r\n"
            + "            select review.isbn\r\n"
            + "            from review, (\r\n"
            + "                select * from ordersPrint\r\n"
            + "                where ordersPrint_date>=sysdate-#{filter}\r\n"
            + "                and ordersPrint_date<=sysdate\r\n"
            + "                and member_id=#{memID}\r\n"
            + "            ) books\r\n"
            + "            where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id\r\n"
            + "            order by review.ordersPrint_id desc\r\n"
            + "            ) a\r\n"
            + "        where a.isbn=book.isbn\r\n"
            + "    ) rev\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<String> getBookListByFilter(Map<String, Object> map);

    // 필터 적용된 주문일 목록 조회 메서드
    @Select("select ordersPrint_date from (\r\n"
            + "    select rownum rnum, reviews.ordersPrint_date from (\r\n"
            + "        select books.ordersPrint_date\r\n"
            + "        from review, (\r\n"
            + "            select * from ordersPrint\r\n"
            + "            where ordersPrint_date>=sysdate-#{filter}\r\n"
            + "            and ordersPrint_date<=sysdate\r\n"
            + "            and member_id=#{memID}\r\n"
            + "        ) books\r\n"
            + "        where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id\r\n"
            + "        order by review.ordersPrint_id desc\r\n"
            + "    ) reviews\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<Date> getOrdersDateListByFilter(Map<String, Object> map);

    // from-todate에 따른 리뷰 리스트
    @Select("select * from (\r\n"
            + "    select rownum rnum, rev.* from(\r\n"
            + "        select review.*\r\n"
            + "        from review, (\r\n"
            + "            select * from ordersPrint\r\n"
            + "            where ordersPrint_date>=#{fromDate}\r\n"
            + "            and ordersPrint_date<=#{toDate}\r\n"
            + "            and member_id=#{memID}\r\n"
            + "        ) books\r\n"
            + "        where isReview=#{isReview} and review.ordersPrint_id=books.ordersPrint_id\r\n"
            + "        order by books.ordersPrint_date desc\r\n"
            + "    ) rev\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<ReviewVO> getReviewListByCalendar(Map<String, Object> map);
    
    
    //추가1
    @Select("select book_name from (\r\n"
            + "    select rownum rnum, rev.* from(\r\n"
            + "        select book.book_name\r\n"
            + "        from book, (\r\n"
            + "            select review.isbn\r\n"
            + "            from review, (\r\n"
            + "                select * from ordersPrint\r\n"
            + "                where ordersPrint_date >= #{fromDate}\r\n"
            + "                and ordersPrint_date <= #{toDate}\r\n"
            + "                and member_id = #{memID}\r\n"
            + "            ) books\r\n"
            + "            where isReview = #{isReview} and review.ordersPrint_id = books.ordersPrint_id\r\n"
            + "            order by review.ordersPrint_id desc\r\n"
            + "        ) a\r\n"
            + "        where a.isbn = book.isbn\r\n"
            + "    ) rev\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<String> getBookListByCalendar(Map<String, Object> map);
    
    //추가2
    @Select("select ordersPrint_date from (\r\n"
            + "    select rownum rnum, reviews.ordersPrint_date from (\r\n"
            + "        select books.ordersPrint_date\r\n"
            + "        from review, (\r\n"
            + "            select * from ordersPrint\r\n"
            + "            where ordersPrint_date >= #{fromDate}\r\n"
            + "            and ordersPrint_date <= #{toDate}\r\n"
            + "            and member_id = #{memID}\r\n"
            + "        ) books\r\n"
            + "        where review.ordersPrint_id = books.ordersPrint_id\r\n"
            + "        and isReview = #{isReview}\r\n"
            + "        order by books.ordersPrint_date desc\r\n"
            + "    ) reviews\r\n"
            + ") where rnum between #{start} and #{end}")
    public List<java.sql.Date> getOrdersDateListByCalendar(Map<String, Object> map);
    
    //최대값을 구해주는 메서드 작성
    @Select("select max(review_id) from review")
    public int getMaxReview();
    
    //글 작성하기
    @Insert("INSERT INTO review (review_id, member_id, isbn, review_content, review_score, isReview, ordersPrint_id) " +
            "VALUES (#{review_id}, #{member_id}, #{isbn}, #{review_content,jdbcType=VARCHAR}, #{review_score}, #{isReview}, #{ordersPrint_id})")
    void insertReview(ReviewVO review);
    
    
    // 특정 리뷰 조회
    @Select("SELECT * FROM review WHERE review_id = #{review_id}")
    List<ReviewVO> getReviewById(int review_id);

    // 리뷰 작성
    @Update("UPDATE review " +
            "SET review_content=#{review_content}, " +
            "    review_score=#{review_score}, " +
            "     review_date=sysdate, " + 
            "    isReview=1 " + 
            "WHERE review_id=#{review_id}")
    void writeReview(Map<String, Object> review);
    
    //글 수정하기
    @Update("UPDATE review " +
            "SET review_content=#{review_content, jdbcType=VARCHAR}, " +
            "    review_score=#{review_score, jdbcType=INTEGER} " +
            "WHERE review_id=#{review_id, jdbcType=INTEGER}")
    void updateReview(ReviewVO reviewVo);
    
    //글 삭제하기
    @Delete("DELETE FROM review WHERE review_id=#{review_id, jdbcType=INTEGER}")
    void deleteReview(int review_id);
    
    // 작성 가능한 리뷰 페이징 목록
    @Select("SELECT * FROM (SELECT a.*, rownum rnum FROM "
            + "(SELECT * FROM review WHERE isreview = 0 ORDER BY review_id DESC) a) "
            + "WHERE rnum >= #{start} AND rnum <= #{end}")
    List<ReviewVO> getReviewListNotReviewed(Map<String, Object> map);
    
//    // 작성 가능한 리뷰 갯수
//    @Select("SELECT count(*) FROM (SELECT a.*, rownum rnum FROM "
//            + "(SELECT * FROM review WHERE isreview = 0 ORDER BY review_id DESC) a) ")
//    List<ReviewVo> getReviewCountNotReviewed(Map<String, Object> map);

    
    // 작성한 리뷰 페이징 목록
    @Select("SELECT * FROM (SELECT a.*, rownum rnum FROM "
            + "(SELECT * FROM review WHERE isreview = 1 ORDER BY review_id DESC) a) "
            + "WHERE rnum >= #{start} AND rnum <= #{end}")
    List<ReviewVO> getReviewListReviewed(Map<String, Object> map);
    
//    // 작성한 리뷰 갯수 
//    @Select("SELECT count(*) FROM (SELECT a.*, rownum rnum FROM "
//            + "(SELECT * FROM review WHERE isreview = 1 ORDER BY review_id DESC) a) ")
//    List<ReviewVo> getReviewCountReviewed(Map<String, Object> map);
    
    //기간별 조회
    @Select("SELECT * FROM review WHERE review_date BETWEEN #{startDate, jdbcType=DATE} AND #{endDate, jdbcType=DATE}")
    List<ReviewVO> getReviewsByDateRange(Map<String, Object> dateRange);
    
//    @Select("SELECT * FROM (SELECT a.*, rownum rnum FROM "
//            + "(SELECT * FROM review where isreview=0 ORDER BY review_id DESC) a) "
//            + "WHERE rnum >= #{start} AND rnum <= #{end}")
//    List<ReviewVo> getReviewList(Map<String, Object> map);

    // 필터 적용된 리뷰 갯수
    @Select("select count(*) from ")
    public int getFilterReivewCount(Map<String, Object> map);
}
