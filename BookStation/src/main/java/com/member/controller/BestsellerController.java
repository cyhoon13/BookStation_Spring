/*
 * 작성자 이지은
 * 베스트셀러 페이지 컨트롤러
 */

package com.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.dao.BookDAO;
import com.member.dao.CategoryDAO;
import com.member.domain.BookVO;
import com.member.domain.CategorymainVO;
import com.member.domain.LoginVO;
import com.member.domain.weeksVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class BestsellerController {
		
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private AdminDAO adminDAO;
	
	// 메인 페이지 이동
	@RequestMapping(value="/bestseller.do",method=RequestMethod.GET)
	public ModelAndView process(HttpSession session,
								@RequestParam("sort") String sort,
								@RequestParam(value="category",defaultValue="") String category,
								@RequestParam(value="year",defaultValue="2024") String year,
								@RequestParam(value="month",defaultValue="05") String month,
								@RequestParam(value="weeks",defaultValue="4") String weeks,
								@RequestParam(value="pageNum",defaultValue="1") int currentPage) {

		// 로그인 정보 가져오기
		LoginVO loginMember = (LoginVO) session.getAttribute("loginMember");
		String member_id = "";
		if (loginMember != null) {
			member_id = loginMember.getMember_id();
		} else {
			member_id = "ANONYMOUS";
		}
		
		// 모든 메인 카테고리 가져오기
		List<CategorymainVO> mainCtgrList = categoryDAO.getAllMainCategory();
		// 모든 주차 정보 가져오기 (2020년~오늘)
		List<weeksVO> totalWeeks = bookDAO.getTotalWeeksList();
		
		// 선택된 년-월의 모든 주차 가져오기
		Map<String,Object> YearNMonth = new HashMap<String,Object>();
		YearNMonth.put("year", year);
		YearNMonth.put("month", month);
		List<weeksVO> allWeeksOfMonth = bookDAO.getAllWeeksOfMonthList(YearNMonth);
		
		// 파라미터로 받은 선택된 년, 월, 주차
		Map<String,Object> weeksDate = new HashMap<String,Object>();
		weeksDate.put("year", year);
		weeksDate.put("month", month);
		weeksDate.put("weeks", weeks);
		weeksVO thisweek = bookDAO.getSelectedWeek(weeksDate);
		
		Map<String, Object> weekly = new HashMap<String,Object>();
		weekly.put("week_start", thisweek.getWeek_start());
		weekly.put("week_end", thisweek.getWeek_end());
		weekly.put("year", year);
		weekly.put("month", month);
		weekly.put("category", category + '%');
		int count = 0;
		if (sort.equals("monthly")) {
			// 월간 베스트 카운트
			count = bookDAO.getBestsellerMonthlyCount(weekly);
		} else if (sort.equals("yearly")) {
			// 역대 베스트 카운트
			count = bookDAO.getBestsellerYearlyCount(weekly);
			
		} else if (sort.equals("yesterday")) {
			// 어제 베스트 카운트
			count = bookDAO.getBestsellerYesterdayCount(weekly);
			
		} else if (sort.equals("new")) {
			// 신간 베스트 카운트
			count = bookDAO.getBestsellerNewCount(weekly);
			
		} else if (sort.equals("steady")) {
			// 스테디셀러 카운트
			count = bookDAO.getBestsellerSteadyCount(weekly);
		} else {
			// 주간 베스트 카운트
			count = bookDAO.getBestsellerWeeklyCount(weekly);
		}

		// 선택된 주차의 책 갯수
		PagingUtil page = new PagingUtil(
				currentPage,count,10,10,"bestseller.do","&category="+category+"&sort="+sort+"&year="+year+"&month="+month+"&weeks="+weeks);
		weekly.put("start",page.getStartCount());
		weekly.put("end", page.getEndCount());
		List<BookVO> bookList = null;
		if (sort.equals("monthly")) {
			// 선택된 달의 베스트셀러 리스트
			bookList = bookDAO.getBestsellerMonthlyBookList(weekly);
		} else if (sort.equals("yearly")) {
			// 선택된 연도의 베스트셀러 리스트
			bookList = bookDAO.getBestsellerYearlyBookList(weekly);
			
		} else if (sort.equals("yesterday")) {
			// 어제의 베스트셀러 리스트
			bookList = bookDAO.getBestsellerYesterdayBookList(weekly);
			
		} else if (sort.equals("new")) {
			// 신간 베스트셀러 리스트
			bookList = bookDAO.getBestsellerNewBookList(weekly);
			
		} else if (sort.equals("steady")) {
			// 스테디셀러 리스트
			bookList = bookDAO.getBestsellerSteadyBookList(weekly);
		} else {
			// 선택된 주차의 책 리스트 (디폴트)
			bookList = bookDAO.getBestsellerWeeklyBookList(weekly);
		}
		// 선택한 메인 카테고리 가져오기
		CategorymainVO ctgrMain = null;
		if (category.equals("")) {
			// 아예 안 주면 에러 떠서 뭐라도 주는 거임
			ctgrMain = categoryDAO.getOneMainCategory("01");
		} else {
			ctgrMain = categoryDAO.getOneMainCategory(category);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bestseller");
		mav.addObject("mainCtgrList", mainCtgrList);
		mav.addObject("totalWeeks", totalWeeks);
		mav.addObject("allWeeksOfMonth", allWeeksOfMonth);
		mav.addObject("category", category);
		mav.addObject("ctgrMain", ctgrMain);
		mav.addObject("sort", sort);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("weeks", weeks);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		// 페이지 이동 로그 저장
		String viewname = mav.getViewName();
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		String pageID = adminDAO.getPageID(viewname);
		map.put("pageID", pageID);
		adminDAO.insPageMoveLog(map);

		return mav;
	}
}
