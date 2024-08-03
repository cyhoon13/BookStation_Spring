package com.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.member.domain.BookVO;
import com.member.domain.ReviewVO;
import com.member.domain.weeksVO;

/*
 * 작성자 - 이지은
 * 해당 페이지 - top, main, bottom, category, bestseller, newbook, searchbook
 */

public interface BookDAO {
	
	@Select("SELECT review.review_id, review.review_content, review.review_score " +
	        "FROM review " +
	        "JOIN book ON review.isbn = book.isbn " +
	        "WHERE book.isbn = #{isbn} AND review.isReview = 1")
	List<ReviewVO> getDetailReviewsByIsbn(String isbn); 
	
	@Select("SELECT * FROM book WHERE category = #{category}")
    List<BookVO> getBooksByCategory(String category); 
	/////////////////////////////////////////////////////////////////
	
	// 한 권 가져오기
		@Select("select * from book where isbn=#{isbn}")
		public BookVO getOneBook(String isbn);
		
		@Select("select * from ("
				+ "    select book.isbn, book_name, book_author, book_publisher"
				+ "    from ("
				+ "        select * from book"
				+ "        where category_id=#{category_id}" // 수정된 부분
				+ "    ) book, ("
				+ "        SELECT isbn, sum(ordersPrint_count) as cnt"
				+ "        FROM ordersprint"
				+ "        WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate"
				+ "        group by isbn"
				+ "        ORDER BY cnt DESC"
				+ "    ) records"
				+ "    where book.isbn=records.isbn"
				+ "    order by records.cnt desc"
				+ ")"
				+ "where rownum<=8")
		public List<BookVO> getdetailbookList(@Param("category_id") String category_id);

		// 전체 책 수
		@Select("selct count(*) from book")
		public int getTotalBooksCount();
		
		// 1. 메인페이지 관련	
		// 1-1. 베스트셀러
		// 1. 주간 베스트 상위 10권
		@Select("select * from ("
				+ "	select book.isbn, book_name, book_author, book_publisher"
				+ "	from book, ("
				+ "		SELECT isbn, sum(ordersPrint_count) as cnt"
				+ "		FROM ordersprint"
				+ "		WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate"
				+ "		group by isbn"
				+ "		ORDER BY cnt DESC"
				+ "	) records"
				+ "	where book.isbn=records.isbn"
				+ "	order by records.cnt desc"
				+ ")"
				+ "where rownum<=10")
		public List<BookVO> getWeeklyBestTenList();
		
		// 2. 어제 베스트 상위 10권
		@Select("select * from ("
				+ "    select book.isbn, book_name, book_author, book_publisher"
				+ "    from book, ("
				+ "        SELECT isbn, sum(ordersPrint_count) as cnt"
				+ "        FROM ordersprint"
				+ "        WHERE ordersPrint_date >= sysdate-1 AND ordersPrint_date <= sysdate"
				+ "        group by isbn"
				+ "        ORDER BY cnt DESC"
				+ "    ) records"
				+ "    where book.isbn=records.isbn"
				+ "    order by records.cnt desc"
				+ ")"
				+ "where rownum<=10")
		public List<BookVO> getYesterdayBestTenList();
		
		// 3. 월간 베스트 상위 10권
		@Select("select * from ("
				+ "    select book.isbn, book_name, book_author, book_publisher"
				+ "    from book, ("
				+ "        SELECT isbn, sum(ordersPrint_count) as cnt"
				+ "        FROM ordersprint"
				+ "        WHERE ordersPrint_date >= sysdate-30 AND ordersPrint_date <= sysdate"
				+ "        group by isbn"
				+ "        ORDER BY cnt DESC"
				+ "    ) records"
				+ "    where book.isbn=records.isbn"
				+ "    order by records.cnt desc"
				+ ")"
				+ "where rownum<=10")
		public List<BookVO> getMonthlyBestTenList();
		
		// 4. 스테디 - 발행일이 2년 이상 지난 책들 중에서 저번주에 가장 많이 팔린 책
		@Select("select * from (\r\n"
				+ "    select book.isbn, book_name, book_author, book_publisher"
				+ "    from ("
				+ "        select * from book"
				+ "        where book_pubdate <= (sysdate - (interval '2' year))"
				+ "    ) book, ("
				+ "        SELECT isbn, sum(ordersPrint_count) as cnt"
				+ "        FROM ordersprint"
				+ "        WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate"
				+ "        group by isbn"
				+ "        ORDER BY cnt DESC"
				+ "    ) records"
				+ "    where book.isbn=records.isbn"
				+ "    order by records.cnt desc"
				+ ")"
				+ "where rownum<=10")
		public List<BookVO> getSteadyBestTenList();
		
		
		// 1-2. 회원님을 위한 추천
		// 할인베스트 - 할인율이 높은 것들 중에서 저번주에 가장 많이 팔린 책
		@Select("select * from (\r\n"
				+ "    select book.isbn, book_name, book_author, book_publisher, book_pubdate"
				+ "    from (\r\n"
				+ "        select * from book where book_discount=10\r\n"
				+ "    ) book, (\r\n"
				+ "        SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "        FROM ordersprint\r\n"
				+ "        WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate\r\n"
				+ "        group by isbn\r\n"
				+ "        ORDER BY cnt DESC\r\n"
				+ "    ) records\r\n"
				+ "    where book.isbn=records.isbn\r\n"
				+ "    order by records.cnt desc\r\n"
				+ ")\r\n"
				+ "where rownum<=10")
		public List<BookVO> getDiscountBestList();
		
		// 1-3. 신간도서
		@Select("select * from(\r\n"
				+ "    select isbn, category_id, book_name, book_author, book_publisher, book_pubdate\r\n"
				+ "    from book\r\n"
				+ "    where category_id like #{category_id} and book_pubdate <= sysdate\r\n"
				+ "    order by book_pubdate desc\r\n"
				+ ")\r\n"
				+ "where rownum<=10")
		public List<BookVO> getMainpageNewbooksList(String category_id);

		
		// 2. 책 목록 페이지 관련
		// 2-1. 카테고리
		// 카테고리 전체 책 수
		@Select("SELECT category_id FROM book WHERE isbn = #{isbn}")
		public String getCategoryIdByIsbn(@Param("isbn") String isbn);
		
		// 카테고리 페이지
		@Select("select * from ("
				+ "	select rownum rnum, books.* from ("
				+ "		select * from book where category_id like #{category} order by ${sort}) books"
				+ "	) where rnum between #{start} and #{end}")
		public List<BookVO> getCategoryBooksList(Map<String,Object> map);
		// 선택된 카테고리의 전체 갯수 가져오기
		@Select("select count(*) from book where category_id like #{category}")
		public int getCategoryBookListCount(String category);
		
		// 2-2. 베스트셀러
		// 주간 베스트 - 카테고리 필터 적용
		// 2020-01-01부터 현재까지 모든 주차 가져오기
		@Select("select * from(\r\n"
				+ "    with ISO as(\r\n"
				+ "        select\r\n"
				+ "        to_char(WEEK_START, 'YYYY-MM-DD') week_start\r\n"
				+ "        ,to_char(WEEK_END, 'YYYY-MM-DD') week_end\r\n"
				+ "        ,to_char(WEEK_START, 'YYYY') thisyear\r\n"
				+ "        ,to_char(WEEK_START, 'MM') thismonth\r\n"
				+ "        ,to_char(WEEK_START, 'W') week_of_month\r\n"
				+ "        from (\r\n"
				+ "            select\r\n"
				+ "            trunc(START_DT + LEVEL, 'D') WEEK_START\r\n"
				+ "            ,trunc(START_DT + LEVEL, 'D') + 6 WEEK_END\r\n"
				+ "            from (\r\n"
				+ "                select\r\n"
				+ "                to_date('20200101', 'YYYYMMDD') - 1 START_DT\r\n"
				+ "                ,to_date('20241231', 'YYYYMMDD') END_DT\r\n"
				+ "                from DUAL\r\n"
				+ "            )\r\n"
				+ "            connect by LEVEL <= END_DT - START_DT\r\n"
				+ "        )\r\n"
				+ "        group by WEEK_START, WEEK_END\r\n"
				+ "        order by week_start\r\n"
				+ "    ) select a.* from ISO a\r\n"
				+ ") where WEEK_END <= sysdate")
		public List<weeksVO> getTotalWeeksList();
		
		// 선택된 년-월의 모든 주차 가져오기
		@Select("select * from(\r\n"
				+ "    with ISO as(\r\n"
				+ "        select\r\n"
				+ "        to_char(WEEK_START, 'YYYY-MM-DD') week_start\r\n"
				+ "        ,to_char(WEEK_END, 'YYYY-MM-DD') week_end\r\n"
				+ "        ,to_char(WEEK_START, 'YYYY') thisyear\r\n"
				+ "        ,to_char(WEEK_START, 'MM') thismonth\r\n"
				+ "        ,to_char(WEEK_START, 'W') week_of_month\r\n"
				+ "        from (\r\n"
				+ "            select\r\n"
				+ "            trunc(START_DT + LEVEL, 'D') WEEK_START\r\n"
				+ "            ,trunc(START_DT + LEVEL, 'D') + 6 WEEK_END\r\n"
				+ "            from (\r\n"
				+ "                select\r\n"
				+ "                to_date('20200101', 'YYYYMMDD') - 1 START_DT\r\n"
				+ "                ,to_date('20241231', 'YYYYMMDD') END_DT\r\n"
				+ "                from DUAL\r\n"
				+ "            )\r\n"
				+ "            connect by LEVEL <= END_DT - START_DT\r\n"
				+ "        )\r\n"
				+ "        group by WEEK_START, WEEK_END\r\n"
				+ "        order by week_start\r\n"
				+ "    ) select a.* from ISO a\r\n"
				+ ") where thisyear=#{year} and thismonth=#{month} and WEEK_END <= sysdate")
		public List<weeksVO> getAllWeeksOfMonthList(Map<String,Object> YearNMonth);
		
		// 년-월-주차에 맞는 데이터 가져오기
		@Select("select * from(\r\n"
				+ "    with ISO as(\r\n"
				+ "        select\r\n"
				+ "        to_char(WEEK_START, 'YYYY-MM-DD') week_start\r\n"
				+ "        ,to_char(WEEK_END, 'YYYY-MM-DD') week_end\r\n"
				+ "        ,to_char(WEEK_START, 'YYYY') thisyear\r\n"
				+ "        ,to_char(WEEK_START, 'MM') thismonth\r\n"
				+ "        ,to_char(WEEK_START, 'W') week_of_month\r\n"
				+ "        from (\r\n"
				+ "            select\r\n"
				+ "            trunc(START_DT + LEVEL, 'D') WEEK_START\r\n"
				+ "            ,trunc(START_DT + LEVEL, 'D') + 6 WEEK_END\r\n"
				+ "            from (\r\n"
				+ "                select\r\n"
				+ "                to_date('20200101', 'YYYYMMDD') - 1 START_DT\r\n"
				+ "                ,to_date('20241231', 'YYYYMMDD') END_DT\r\n"
				+ "                from DUAL\r\n"
				+ "            )\r\n"
				+ "            connect by LEVEL <= END_DT - START_DT\r\n"
				+ "        )\r\n"
				+ "        group by WEEK_START, WEEK_END\r\n"
				+ "        order by week_start\r\n"
				+ "    ) select a.* from ISO a\r\n"
				+ ") where thisyear=#{year} and thismonth=#{month} and week_of_month=#{weeks}")
		public weeksVO getSelectedWeek(Map<String,Object> weeksDate);
		
		// 주간 베스트
		// 원하는 주차의 판매 베스트 - 카테고리 필터 적용
		@Select("select * from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= #{week_start} AND ordersPrint_date <= #{week_end}\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ") where rnum between #{start} and #{end}")
		public List<BookVO> getBestsellerWeeklyBookList(Map<String,Object> weekly);
		// 원하는 주차의 베스트 셀러 - 카테고리 적용된 책 개수
		@Select("select count(*) from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= #{week_start} AND ordersPrint_date <= #{week_end}\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ")")
		public int getBestsellerWeeklyCount(Map<String,Object> weekly);
		
		// 월간 베스트 - 카테고리
		// 원하는 월의 베스트셀러 - 카테고리 필터 적용
		@Select("select * from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE to_char(ordersPrint_date, 'MM')=#{month}\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ") where rnum between #{start} and #{end}")
		public List<BookVO> getBestsellerMonthlyBookList(Map<String,Object> weekly);
		// 원하는 월의 베스트 셀러 - 카테고리 적용된 책 개수
		@Select("select count(*) from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE to_char(ordersPrint_date, 'MM')=#{month}\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ")")
		public int getBestsellerMonthlyCount(Map<String,Object> weekly);
		
		
		
		// 역대 베스트 - 카테고리
		// 원하는 연도의 베스트셀러 - 카테고리 필터 적용
		@Select("select * from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE to_char(ordersPrint_date, 'YYYY')=#{year}\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ") where rnum between #{start} and #{end}")
		public List<BookVO> getBestsellerYearlyBookList(Map<String,Object> weekly);
		// 원하는 연도의 베스트 셀러 - 카테고리 적용된 책 개수
		@Select("select count(*) from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE to_char(ordersPrint_date, 'YYYY')=#{year}\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ")")
		public int getBestsellerYearlyCount(Map<String,Object> weekly);

		
		
		// 어제 베스트 - 카테고리
		// 어제 베스트셀러 - 카테고리 필터 적용
		@Select("select * from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= sysdate-1 AND ordersPrint_date <= sysdate\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ") where rnum between #{start} and #{end}")
		public List<BookVO> getBestsellerYesterdayBookList(Map<String,Object> weekly);
		// 어제 베스트 셀러 - 카테고리 적용된 책 개수
		@Select("select count(*) from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category}\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= sysdate-1 AND ordersPrint_date <= sysdate\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ")")
		public int getBestsellerYesterdayCount(Map<String,Object> weekly);
		
		
		
		// 신간 베스트 - 카테고리
		// 신간 베스트 - 카테고리 필터 적용
		@Select("select * from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category} and book_pubdate >= sysdate-30\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ") where rnum between #{start} and #{end}")
		public List<BookVO> getBestsellerNewBookList(Map<String,Object> weekly);
		// 신간 베스트 - 카테고리 적용된 책 개수
		@Select("select count(*) from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category} and book_pubdate >= sysdate-30\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ")")
		public int getBestsellerNewCount(Map<String,Object> weekly);
		
		
		
		// 스테디 - 카테고리 적용
		// 스테디셀러 책목록
		@Select("select * from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category} and book_pubdate <= (sysdate - (interval '2' year))\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ") where rnum between #{start} and #{end}")
		public List<BookVO> getBestsellerSteadyBookList(Map<String,Object> weekly);
		// 스테디셀러 책갯수
		@Select("select count(*) from(\r\n"
				+ "    select rownum rnum, rank.* from (\r\n"
				+ "        select book.*\r\n"
				+ "        from (\r\n"
				+ "            select * from book\r\n"
				+ "            where category_id like #{category} and book_pubdate <= (sysdate - (interval '2' year))\r\n"
				+ "        ) book, (\r\n"
				+ "            SELECT isbn, sum(ordersPrint_count) as cnt\r\n"
				+ "            FROM ordersprint\r\n"
				+ "            WHERE ordersPrint_date >= sysdate-7 AND ordersPrint_date <= sysdate\r\n"
				+ "            group by isbn\r\n"
				+ "            ORDER BY cnt DESC\r\n"
				+ "        ) records\r\n"
				+ "        where book.isbn=records.isbn and records.cnt>0 \r\n"
				+ "        order by records.cnt desc\r\n"
				+ "    ) rank\r\n"
				+ ")")
		public int getBestsellerSteadyCount(Map<String,Object> weekly);
		
		
		
		// 2-3. 신간도서
		// 전체 책 갯수 - 한달 이내 발행된 책들, 카테고리 적용
		@Select("select count(*) from book "
				+ "	where category_id like #{category} "
				+ "	and book_pubdate between sysdate-30 and sysdate")
		public int getNewbookCount(Map<String,Object> newbookMap);
		// 출간일 순으로 책 가져오기 (디폴트)
		@Select("select * from ("
				+ "	select rownum rnum, books.* from ("
				+ "		select * from book where category_id like #{category} "
				+ "		and book_pubdate between sysdate-30 and sysdate "
				+ "		order by ${sort}) books"
				+ "	) where rnum between #{start} and #{end}")
		public List<BookVO> getNewbookBookList(Map<String,Object> map);	
		
		
		
		
		// 2-4. 책검색
		//메서드 이름 get-search-검색조건(all, name, author, publ)-NotRe:재검색어미포함-정렬기준(sales,new,abc,rev,minv,maxv)-BookList
		// 2-4-1. 검색 조건 - 전체(도서명, 작가, 출판사)
	   // 전체로 검색한 결과 갯수 - 재검색어 적용
	   @Select("select count(*) from book"
	         + "   where category_id like #{category} and"
	         + "   (book_name like #{searchWord} "
	         + "   or book_author like #{searchWord} "
	         + "   or book_publisher like #{searchWord}) "
	         + "   and "
	         + "   (book_name ${exceptChk}like #{reSearchWord} "
	         + "   or book_author ${exceptChk}like #{reSearchWord} "
	         + "   or book_publisher ${exceptChk}like #{reSearchWord})")
	   public int getSearchAllCount(Map<String,Object> map);
	   // 전체로 검색한 결과 리스트 - 재검색어 적용
	   @Select("select * from ("
	         + "   select rownum rnum, books.* from ("
	         + "      select * from book "
	         + "      where category_id like #{category} and"
	         + "      (book_name like #{searchWord} "
	         + "      or book_author like #{searchWord} "
	         + "      or book_publisher like #{searchWord}) "
	         + "      and "
	         + "      (book_name ${exceptChk}like #{reSearchWord} "
	         + "      or book_author ${exceptChk}like #{reSearchWord} "
	         + "      or book_publisher ${exceptChk}like #{reSearchWord})"
	         + "      order by ${sort}) books"
	         + "   ) where rnum between #{start} and #{end}")
	   public List<BookVO> getSearchAllBookList(Map<String,Object> map);
	   
	   // 전체로 검색한 결과 갯수 - 재검색어 제외 적용
	   @Select("select count(*) from book"
	         + "   where category_id like #{category} and"
	         + "   (book_name like #{searchWord} "
	         + "   or book_author like #{searchWord} "
	         + "   or book_publisher like #{searchWord}) "
	         + "   and "
	         + "   (book_name ${exceptChk}like #{reSearchWord} "
	         + "   and book_author ${exceptChk}like #{reSearchWord} "
	         + "   and book_publisher ${exceptChk}like #{reSearchWord})")
	   public int getSearchAllNotReCount(Map<String,Object> map);
	   // 전체로 검색한 결과 리스트 - 재검색어 제외 적용
	   @Select("select * from ("
	         + "   select rownum rnum, books.* from ("
	         + "      select * from book "
	         + "      where category_id like #{category} and"
	         + "      (book_name like #{searchWord} "
	         + "      or book_author like #{searchWord} "
	         + "      or book_publisher like #{searchWord}) "
	         + "      and "
	         + "      (book_name ${exceptChk}like #{reSearchWord} "
	         + "      and book_author ${exceptChk}like #{reSearchWord} "
	         + "      and book_publisher ${exceptChk}like #{reSearchWord})"
	         + "      order by ${sort}) books"
	         + "   ) where rnum between #{start} and #{end}")
	   public List<BookVO> getSearchAllNotReBookList(Map<String,Object> map);
	   		
		// 2-4-2. 검색 조건 - 도서명, 작가, 출판사 (전체 제외 전부)
		// 검색 결과 갯수 - 재검색어 적용
		@Select("select count(*) from book "
				+ "where category_id like #{category} "
				+ "and ${searchField} like #{searchWord}"
				+ "and ${searchField} ${exceptChk}like #{reSearchWord}")
		public int getSearchCount(Map<String,Object> map);
		// 검색 결과 리스트 - 재검색어 적용
		@Select("select * from ("
				+ "	select rownum rnum, books.* from ("
				+ "		select * from book "
				+ "		where category_id like #{category} "
				+ "		and ${searchField} like #{searchWord} "
				+ "		and ${searchField} ${exceptChk}like #{reSearchWord} "
				+ "		order by ${sort}) books"
				+ "	) where rnum between #{start} and #{end}")
		public List<BookVO> getSearchBookList(Map<String,Object> map);

	}