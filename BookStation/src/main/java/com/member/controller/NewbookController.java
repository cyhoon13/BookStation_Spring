/*
 * 작성자 이지은
 * 신간도서 페이지 컨트롤러
 */

package com.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
import com.member.util.PagingUtil;

@Component
@Controller
public class NewbookController {
	
	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private AdminDAO adminDAO;
	
	// 메인 페이지 이동
	@RequestMapping(value="/newbook.do",method=RequestMethod.GET)
	public ModelAndView process(HttpSession session,
								@RequestParam(value="sort",defaultValue="new") String sort,
								@RequestParam(value="category",defaultValue="") String category,
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
		// 선택된 카테고리 가져오기
		CategorymainVO selectedMain = null;
		if (category.equals("")) {
			// 아예 안 주면 에러 떠서 뭐라도 주는 거임
			selectedMain = categoryDAO.getOneMainCategory("01");
		} else {
			selectedMain = categoryDAO.getOneMainCategory(category);
		}
		
		String mainID = null;
		if (category.equals("")) {
			mainID = "";
		} else {
			mainID = categoryDAO.getOneMainCategory(category).getCategory_mainID();
		}
		
		// DAO에 넘길 통합 map 데이터
		Map<String,Object> newbookMap = new HashMap<String,Object>();
		newbookMap.put("category", category + "%");
		// 페이징 처리
		int count = bookDAO.getNewbookCount(newbookMap);
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"newbook.do","&category="+category+"&sort="+sort);
		newbookMap.put("start",page.getStartCount());
		newbookMap.put("end", page.getEndCount());
		
		if(sort.equals("sales")) {
			newbookMap.put("sort", "book_sell desc");
		}
		else if(sort.equals("abc")) {
			newbookMap.put("sort", "book_name");
		}
		else if(sort.equals("rev")) {
			newbookMap.put("sort", "book_score desc");
		}
		else if(sort.equals("minv")) {
			newbookMap.put("sort", "book_price");
		}
		else if(sort.equals("maxv")) {
			newbookMap.put("sort", "book_pubdate desc");
		}
		else { // 디폴트는 출간일순으로 해두기
			newbookMap.put("sort", "book_pubdate desc");
		}
		List<BookVO> bookList = bookDAO.getNewbookBookList(newbookMap);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("newbook");
		mav.addObject("mainCtgrList", mainCtgrList);
		mav.addObject("category", category);
		mav.addObject("selectedMain", selectedMain);
		mav.addObject("mainID", mainID);
		mav.addObject("sort", sort);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);
		mav.addObject("pagingHtml", page.getPagingHtml());
		
		// 페이지 이동 로그 저장
		String viewname = mav.getViewName();
		Map<String, Object> logMap = new HashMap<>();
		logMap.put("member_id", member_id);
		String pageID = adminDAO.getPageID(viewname);
		logMap.put("pageID", pageID);
		adminDAO.insPageMoveLog(logMap);
		
		return mav;
	}
}
