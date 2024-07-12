package com.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.member.domain.AllOrdersListVO;
import com.member.domain.CanceledVO;
import com.member.domain.DetailOrderVO;
import com.member.domain.OrderVO;
import com.member.domain.shippingVO;

public interface AllOrderDAO {
	
	// 하나의 주문테이블
	@Select("select * from orders where order_id=#{order_id}")
	public OrderVO getOneOrders(Map<String, Object> map);
	
	// 주문별 주문 출력 리스트
	@Select("select book_name, book_discount, ordersPrint_count, ordersPrint_price, ordersPrint_state, book.isbn"
			+ " from book, ordersPrint\r\n"
			+ " where order_id=#{order_id}\r\n"
			+ " and book.isbn=ordersPrint.isbn"
			+ " order by ordersPrint_id")
	public List<DetailOrderVO> getOrdersPrintList(Map<String, Object> map);
	
	// 하나의 배송테이블
	@Select("select * from shipping where order_id=#{order_id}")
	public shippingVO getOneShipping(Map<String, Object> map);
	
	// 로그인한 회원의 적립률
	@Select("select grade_ratePoint from grade, ("
			+ "	select grade_name from login where member_id=#{member_id}"
			+ " ) gname"
			+ " where gname.grade_name=grade.grade_name")
	public int getRatePoint(Map<String, Object> map);
	
	
	// 전체 주문 내역 조회 페이지 목록 - 전체 기간
	@Select("select * from ("
			+ "    select rownum rnum, orders.* from ("
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "        from book, ("
			+ "            select ordersPrint.isbn, orders.*, a.cnt"
			+ "            from orders, ordersPrint, ("
			+ "                select order_id, count(*) cnt from ordersPrint"
			+ "                where member_id=#{member_id} and ordersPrint_date<=sysdate"
			+ "                group by order_id order by order_id desc"
			+ "            ) a"
			+ "            where orders.order_id=ordersPrint.order_id"
			+ "            and a.order_id=orders.order_id"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "            and orders.orderdate<=sysdate"
			+ "        ) orders"
			+ "        where orders.isbn=book.isbn"
			+ "		 order by orders.order_id desc"
			+ "    ) orders"
			+ ") where rnum between #{start} and #{end}")
 	public List<AllOrdersListVO> getAllOrdersList(Map<String, Object> map);
	// 전체 주문 내역 갯수 - 전체 기간
	@Select("select count(*) from ("
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "    from book, ("
			+ "        select ordersPrint.isbn, orders.*, a.cnt"
			+ "        from orders, ordersPrint, ("
			+ "            select order_id, count(*) cnt from ordersPrint"
			+ "            where member_id=#{member_id} and ordersPrint_date<=sysdate"
			+ "            group by order_id order by order_id desc"
			+ "        ) a"
			+ "        where orders.order_id=ordersPrint.order_id"
			+ "        and a.order_id=orders.order_id"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        and orders.orderdate<=sysdate"
			+ "    ) orders"
			+ "    where orders.isbn=book.isbn)")
	public int getAllOrdersCount(Map<String, Object> map);
	
	
	
	// 전체 주문 내역 조회 페이지 목록 - 기간별 조회 버튼
	@Select("select * from (\r\n"
			+ "    select rownum rnum, orders.* from (\r\n"
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt\r\n"
			+ "        from book, (\r\n"
			+ "            select ordersPrint.isbn, orders.*, a.cnt\r\n"
			+ "            from orders, ordersPrint, (\r\n"
			+ "                select order_id, count(*) cnt from ordersPrint\r\n"
			+ "                where member_id=#{member_id}\r\n"
			+ "                and ordersPrint_date<=sysdate\r\n"
			+ "                and ordersPrint_date>=sysdate-#{interval}\r\n"
			+ "                group by order_id order by order_id desc\r\n"
			+ "            ) a\r\n"
			+ "            where orders.order_id=ordersPrint.order_id\r\n"
			+ "            and a.order_id=orders.order_id\r\n"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')\r\n"
			+ "        ) orders\r\n"
			+ "        where orders.isbn=book.isbn\r\n"
			+ "        order by orders.order_id desc\r\n"
			+ "    ) orders\r\n"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllOrdersListByButton(Map<String, Object> map);
	// 전체 주문 내역 갯수 - 기간별 조회 버튼
	@Select("select count(*) from (\r\n"
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt\r\n"
			+ "    from book, (\r\n"
			+ "        select ordersPrint.isbn, orders.*, a.cnt\r\n"
			+ "        from orders, ordersPrint, (\r\n"
			+ "            select order_id, count(*) cnt from ordersPrint\r\n"
			+ "            where member_id=#{member_id}\r\n"
			+ "            and ordersPrint_date<=sysdate\r\n"
			+ "            and ordersPrint_date>=sysdate-#{interval}\r\n"
			+ "            group by order_id order by order_id desc\r\n"
			+ "        ) a\r\n"
			+ "        where orders.order_id=ordersPrint.order_id\r\n"
			+ "        and a.order_id=orders.order_id\r\n"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')\r\n"
			+ "        and orders.orderdate<=sysdate\r\n"
			+ "    ) orders\r\n"
			+ "    where orders.isbn=book.isbn\r\n"
			+ ")")
	public int getAllOrdersCountByButton(Map<String, Object> map);
	
	
	
	// 전체 주문 내역 조회 페이지 목록 - 달력으로 조회
	// 전체 주문 내역 조회 페이지 목록 - 주문별 일자 조회(직접적인 날짜 선택)
	@Select("select * from ("
			+ "    select rownum rnum, orders.* from ("
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "        from book, ("
			+ "            select ordersPrint.isbn, orders.*, a.cnt"
			+ "            from orders, ordersPrint, ("
			+ "                select order_id, count(*) cnt from ordersPrint"
			+ "                where member_id=#{member_id}"
			+ "                and ordersPrint_date<=#{toDate}"
			+ "                and ordersPrint_date>=#{fromDate}"
			+ "                group by order_id order by order_id desc"
			+ "            ) a"
			+ "            where orders.order_id=ordersPrint.order_id"
			+ "            and a.order_id=orders.order_id"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        ) orders"
			+ "        where orders.isbn=book.isbn"
			+ "        order by orders.order_id desc"
			+ "    ) orders"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllOrdersListByCalendar(Map<String, Object> map);

	// 전체 주문 내역 갯수 - 주문별 일자 조회(직접적인 날짜 선택)
	@Select("select count(*) from ("
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "    from book, ("
			+ "        select ordersPrint.isbn, orders.*, a.cnt"
			+ "        from orders, ordersPrint, ("
			+ "            select order_id, count(*) cnt from ordersPrint"
			+ "            where member_id=#{member_id} "
			+ "            and ordersPrint_date<=#{toDate}"
			+ "            and ordersPrint_date>=#{fromDate}"
			+ "            group by order_id order by order_id desc"
			+ "        ) a"
			+ "        where orders.order_id=ordersPrint.order_id"
			+ "        and a.order_id=orders.order_id"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        and orders.orderdate<=sysdate"
			+ "    ) orders"
			+ "    where orders.isbn=book.isbn)")
	public int getAllOrdersCountByCalendar(Map<String, Object> map);
	
	// 반품/교환/신청 - 주문, 주문출력 테이블 상태 변경, caceled 테이블에 주문 아이디와 반품 사유 등록
	// 주문 테이블 상태 변경
	@Update("update orders set orderState='반품/교환/취소 신청' where order_id=#{order_id}")
	public void updateOrdersState(CanceledVO canceledVO);
	
	// 주문 출력 테이블 상태 변경
	@Update("update ordersPrint set ordersPrint_state='반품/교환/취소 신청' where order_id=#{order_id}")
	public void updateOrdersPrintState(CanceledVO canceledVO);
	
	// canceled 테이블 행 추가
	@Insert("insert into canceled(order_id,cancel_reason) values(#{order_id},#{cancel_reason})")
	public void insertCanceledTable(CanceledVO canceledVO);
	
	// 반품/교환/취소 가능 테이블(주문 상태가 반품/교환/취소 신청인 경우엔 담지 않음) - 전체 기간
	@Select("select * from ("
			+ "    select rownum rnum, orders.* from ("
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "        from book, ("
			+ "            select ordersPrint.isbn, orders.*, a.cnt"
			+ "            from orders, ordersPrint, ("
			+ "                select order_id, count(*) cnt from ordersPrint"
			+ "                where member_id=#{member_id} and ordersPrint_date<=sysdate"
			+ "				   and ordersPrint_state='결제완료'"
			+ "                group by order_id order by order_id desc"
			+ "            ) a"
			+ "            where orders.order_id=ordersPrint.order_id"
			+ "            and a.order_id=orders.order_id"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "            and orders.orderdate<=sysdate"
			+ "        ) orders"
			+ "        where orders.isbn=book.isbn"
			+ "		 order by orders.order_id desc"
			+ "    ) orders"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllRefundableList(Map<String, Object> map);
	// 반품/교환/취소 가능 테이블 개수 - 전체 기간
	@Select("select count(*) from ("
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "    from book, ("
			+ "        select ordersPrint.isbn, orders.*, a.cnt"
			+ "        from orders, ordersPrint, ("
			+ "            select order_id, count(*) cnt from ordersPrint"
			+ "            where member_id=#{member_id} and ordersPrint_date<=sysdate"
			+ "				   and ordersPrint_state='결제완료'"
			+ "            group by order_id order by order_id desc"
			+ "        ) a"
			+ "        where orders.order_id=ordersPrint.order_id"
			+ "        and a.order_id=orders.order_id"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        and orders.orderdate<=sysdate"
			+ "    ) orders"
			+ "    where orders.isbn=book.isbn)")
	public int getAllRefundableCount(Map<String, Object> map);
	
	// 반품/교환/취소 가능 테이블 - 기간별 조회 버튼
	@Select("select * from (\r\n"
			+ "    select rownum rnum, orders.* from (\r\n"
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt\r\n"
			+ "        from book, (\r\n"
			+ "            select ordersPrint.isbn, orders.*, a.cnt\r\n"
			+ "            from orders, ordersPrint, (\r\n"
			+ "                select order_id, count(*) cnt from ordersPrint\r\n"
			+ "                where member_id=#{member_id}\r\n"
			+ "                and ordersPrint_date<=sysdate\r\n"
			+ "                and ordersPrint_date>=sysdate-#{interval}\r\n"
			+ "				   and ordersPrint_state='결제완료'"
			+ "                group by order_id order by order_id desc\r\n"
			+ "            ) a\r\n"
			+ "            where orders.order_id=ordersPrint.order_id\r\n"
			+ "            and a.order_id=orders.order_id\r\n"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')\r\n"
			+ "        ) orders\r\n"
			+ "        where orders.isbn=book.isbn\r\n"
			+ "        order by orders.order_id desc\r\n"
			+ "    ) orders\r\n"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllRefundableListByButton(Map<String, Object> map);
	// 반품/교환/취소 가능 테이블 갯수 - 기간별 조회 버튼
	@Select("select count(*) from (\r\n"
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt\r\n"
			+ "    from book, (\r\n"
			+ "        select ordersPrint.isbn, orders.*, a.cnt\r\n"
			+ "        from orders, ordersPrint, (\r\n"
			+ "            select order_id, count(*) cnt from ordersPrint\r\n"
			+ "            where member_id=#{member_id}\r\n"
			+ "            and ordersPrint_date<=sysdate\r\n"
			+ "            and ordersPrint_date>=sysdate-#{interval}\r\n"
			+ "			   and ordersPrint_state='결제완료'"
			+ "            group by order_id order by order_id desc\r\n"
			+ "        ) a\r\n"
			+ "        where orders.order_id=ordersPrint.order_id\r\n"
			+ "        and a.order_id=orders.order_id\r\n"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')\r\n"
			+ "        and orders.orderdate<=sysdate\r\n"
			+ "    ) orders\r\n"
			+ "    where orders.isbn=book.isbn\r\n"
			+ ")")
	public int getAllRefundableCountByButton(Map<String, Object> map);
	
	// 반품/교환/취소 가능 테이블 - 주문별 일자 조회(직접적인 날짜 선택)
	@Select("select * from ("
			+ "    select rownum rnum, orders.* from ("
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "        from book, ("
			+ "            select ordersPrint.isbn, orders.*, a.cnt"
			+ "            from orders, ordersPrint, ("
			+ "                select order_id, count(*) cnt from ordersPrint"
			+ "                where member_id=#{member_id}"
			+ "                and ordersPrint_date<=#{toDate}"
			+ "                and ordersPrint_date>=#{fromDate}"
			+ "			  	   and ordersPrint_state='결제완료'"
			+ "                group by order_id order by order_id desc"
			+ "            ) a"
			+ "            where orders.order_id=ordersPrint.order_id"
			+ "            and a.order_id=orders.order_id"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        ) orders"
			+ "        where orders.isbn=book.isbn"
			+ "        order by orders.order_id desc"
			+ "    ) orders"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllRefundableListByCalendar(Map<String, Object> map);

	// 반품/교환/취소 가능 테이블 갯수 - 주문별 일자 조회(직접적인 날짜 선택)
	@Select("select count(*) from ("
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt"
			+ "    from book, ("
			+ "        select ordersPrint.isbn, orders.*, a.cnt"
			+ "        from orders, ordersPrint, ("
			+ "            select order_id, count(*) cnt from ordersPrint"
			+ "            where member_id=#{member_id} "
			+ "            and ordersPrint_date<=#{toDate}"
			+ "            and ordersPrint_date>=#{fromDate}"
			+ "			   and ordersPrint_state='결제완료'"
			+ "            group by order_id order by order_id desc"
			+ "        ) a"
			+ "        where orders.order_id=ordersPrint.order_id"
			+ "        and a.order_id=orders.order_id"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        and orders.orderdate<=sysdate"
			+ "    ) orders"
			+ "    where orders.isbn=book.isbn)")
	public int getAllRefundableCountByCalendar(Map<String, Object> map);
	
	
	
	
	// 반품/교환/취소 신청된 테이블(주문 상태가 결제 완료인 경우엔 담지 않음) - 전체 기간
	@Select("select * from ("
			+ "    select rownum rnum, orders.* from ("
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt, canceled.cancel_reason"
			+ "        from book, canceled, ("
			+ "            select ordersPrint.isbn, orders.*, a.cnt"
			+ "            from orders, ordersPrint, ("
			+ "                select order_id, count(*) cnt from ordersPrint"
			+ "                where member_id=#{member_id} and ordersPrint_date<=sysdate"
			+ "				   and ordersPrint_state!='결제완료'"
			+ "                group by order_id order by order_id desc"
			+ "            ) a"
			+ "            where orders.order_id=ordersPrint.order_id"
			+ "            and a.order_id=orders.order_id"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "            and orders.orderdate<=sysdate"
			+ "        ) orders"
			+ "        where orders.isbn=book.isbn"
			+ "		   and orders.order_id=canceled.order_id"
			+ "		 order by orders.order_id desc"
			+ "    ) orders"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllRefundList(Map<String, Object> map);
	// 반품/교환/취소 신청된 테이블 개수 - 전체 기간
	@Select("select count(*) from ("
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt, canceled.cancel_reason"
			+ "    from book, canceled, ("
			+ "        select ordersPrint.isbn, orders.*, a.cnt"
			+ "        from orders, ordersPrint, ("
			+ "            select order_id, count(*) cnt from ordersPrint"
			+ "            where member_id=#{member_id} and ordersPrint_date<=sysdate"
			+ "				   and ordersPrint_state!='결제완료'"
			+ "            group by order_id order by order_id desc"
			+ "        ) a"
			+ "        where orders.order_id=ordersPrint.order_id"
			+ "        and a.order_id=orders.order_id"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        and orders.orderdate<=sysdate"
			+ "    ) orders"
			+ "    where orders.isbn=book.isbn"
			+ "	   and orders.order_id=canceled.order_id)")
	public int getAllRefundCount(Map<String, Object> map);
	
	// 반품/교환/취소 신청된 테이블 - 기간별 조회 버튼
	@Select("select * from (\r\n"
			+ "    select rownum rnum, orders.* from (\r\n"
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt, canceled.cancel_reason"
			+ "        from book, canceled, (\r\n"
			+ "            select ordersPrint.isbn, orders.*, a.cnt\r\n"
			+ "            from orders, ordersPrint, (\r\n"
			+ "                select order_id, count(*) cnt from ordersPrint\r\n"
			+ "                where member_id=#{member_id}\r\n"
			+ "                and ordersPrint_date<=sysdate\r\n"
			+ "                and ordersPrint_date>=sysdate-#{interval}\r\n"
			+ "				   and ordersPrint_state!='결제완료'"
			+ "                group by order_id order by order_id desc\r\n"
			+ "            ) a\r\n"
			+ "            where orders.order_id=ordersPrint.order_id\r\n"
			+ "            and a.order_id=orders.order_id\r\n"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')\r\n"
			+ "        ) orders\r\n"
			+ "        where orders.isbn=book.isbn"
			+ "		   and orders.order_id=canceled.order_id"
			+ "        order by orders.order_id desc\r\n"
			+ "    ) orders\r\n"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllRefundListByButton(Map<String, Object> map);
	// 반품/교환/취소 신청된 테이블 갯수 - 기간별 조회 버튼
	@Select("select count(*) from (\r\n"
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt, canceled.cancel_reason"
			+ "    from book, canceled, (\r\n"
			+ "        select ordersPrint.isbn, orders.*, a.cnt\r\n"
			+ "        from orders, ordersPrint, (\r\n"
			+ "            select order_id, count(*) cnt from ordersPrint\r\n"
			+ "            where member_id=#{member_id}\r\n"
			+ "            and ordersPrint_date<=sysdate\r\n"
			+ "            and ordersPrint_date>=sysdate-#{interval}\r\n"
			+ "			   and ordersPrint_state!='결제완료'"
			+ "            group by order_id order by order_id desc\r\n"
			+ "        ) a\r\n"
			+ "        where orders.order_id=ordersPrint.order_id\r\n"
			+ "        and a.order_id=orders.order_id\r\n"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')\r\n"
			+ "        and orders.orderdate<=sysdate\r\n"
			+ "    ) orders\r\n"
			+ "    where orders.isbn=book.isbn"
			+ "	   and orders.order_id=canceled.order_id"
			+ ")")
	public int getAllRefundCountByButton(Map<String, Object> map);
	
	// 반품/교환/취소 신청된 테이블 - 주문별 일자 조회(직접적인 날짜 선택)
	@Select("select * from ("
			+ "    select rownum rnum, orders.* from ("
			+ "        select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt, canceled.cancel_reason"
			+ "        from book, canceled, ("
			+ "            select ordersPrint.isbn, orders.*, a.cnt"
			+ "            from orders, ordersPrint, ("
			+ "                select order_id, count(*) cnt from ordersPrint"
			+ "                where member_id=#{member_id}"
			+ "                and ordersPrint_date<=#{toDate}"
			+ "                and ordersPrint_date>=#{fromDate}"
			+ "			  	   and ordersPrint_state!='결제완료'"
			+ "                group by order_id order by order_id desc"
			+ "            ) a"
			+ "            where orders.order_id=ordersPrint.order_id"
			+ "            and a.order_id=orders.order_id"
			+ "            and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        ) orders"
			+ "        where orders.isbn=book.isbn"
			+ "		   and orders.order_id=canceled.order_id"
			+ "        order by orders.order_id desc"
			+ "    ) orders"
			+ ") where rnum between #{start} and #{end}")
	public List<AllOrdersListVO> getAllRefundListByCalendar(Map<String, Object> map);

	// 반품/교환/취소 신청된 테이블 갯수 - 주문별 일자 조회(직접적인 날짜 선택)
	@Select("select count(*) from ("
			+ "    select orders.orderDate, orders.orderState, orders.totalPrice, orders.order_id, book.book_name, orders.cnt, canceled.cancel_reason"
			+ "    from book, canceled, ("
			+ "        select ordersPrint.isbn, orders.*, a.cnt"
			+ "        from orders, ordersPrint, ("
			+ "            select order_id, count(*) cnt from ordersPrint"
			+ "            where member_id=#{member_id} "
			+ "            and ordersPrint_date<=#{toDate}"
			+ "            and ordersPrint_date>=#{fromDate}"
			+ "			   and ordersPrint_state!='결제완료'"
			+ "            group by order_id order by order_id desc"
			+ "        ) a"
			+ "        where orders.order_id=ordersPrint.order_id"
			+ "        and a.order_id=orders.order_id"
			+ "        and ordersPrint.ordersPrint_id=concat(ordersPrint.order_id, '01')"
			+ "        and orders.orderdate<=sysdate"
			+ "    ) orders"
			+ "    where orders.isbn=book.isbn"
			+ "	   and orders.order_id=canceled.order_id)")
	public int getAllRefundCountByCalendar(Map<String, Object> map);
}
	