/*
 * 작성자 이지은
 * 책 검색 결과 페이지 컨트롤러
 */

package com.member.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.member.domain.CategorydetailVO;
import com.member.domain.CategorymainVO;
import com.member.domain.LoginVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class SearchbookController {
	
	private Logger log=Logger.getLogger(this.getClass());

	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private AdminDAO adminDAO;
	
	// 메인 페이지 이동
	@RequestMapping(value="/searchbook.do",method=RequestMethod.GET)
	public ModelAndView process(HttpSession session,
								@RequestParam(value="sort",defaultValue="sales") String sort,
								@RequestParam("searchField") String searchField,
								@RequestParam("searchWord") String searchWord,
								@RequestParam(value="re-searchWord",defaultValue="") String reSearchWord,
								@RequestParam(value="except-chk",defaultValue="") String exceptChk,
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
		
		// 선택된 카테고리
		String selectedMain = "";
		if (category.equals("")) {
			selectedMain = "종합";
		} else {
			selectedMain = categoryDAO.getOneMainCategory(category).getCategory_main();
		}
		// DAO에 넘길 통합 map 데이터
		Map<String,Object> searchbookMap = new HashMap<String,Object>();
		searchbookMap.put("searchField", searchField);
		searchbookMap.put("searchWord", "%" + searchWord + "%");
		searchbookMap.put("category", category + "%");
		searchbookMap.put("reSearchWord", "%" + reSearchWord + "%");
		searchbookMap.put("exceptChk", exceptChk);
		// 페이징 처리
		int count = 0;
		switch(searchField) {
		case "bookName":
			searchbookMap.put("searchField", "book_name");
			count = bookDAO.getSearchCount(searchbookMap);
			break;
		case "bookAuthor":
			searchbookMap.put("searchField", "book_author");
			count = bookDAO.getSearchCount(searchbookMap);
			break;
		case "bookPublisher":
			searchbookMap.put("searchField", "book_publisher");
			count = bookDAO.getSearchCount(searchbookMap);
			break;
		default:
			count = bookDAO.getSearchAllCount(searchbookMap);
			break;
		}
		// count 정보 page에 입력
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"searchbook.do","&category="+category+"&sort="+sort+"&searchField="+searchField+"&searchWord="+searchWord);
		searchbookMap.put("start",page.getStartCount());
		searchbookMap.put("end", page.getEndCount());
		
		switch(sort) {
		case "new":
			searchbookMap.put("sort", "book_pubdate desc");
			break;
		case "abc":
			searchbookMap.put("sort", "book_name");
			break;
		case "rev":
			searchbookMap.put("sort", "book_score desc");
			break;
		case "minv":
			searchbookMap.put("sort", "book_price");
			break;
		case "maxv":
			searchbookMap.put("sort", "book_price desc");
			break;
		default:
			searchbookMap.put("sort", "book_sell desc");
			break;
		}
		
	      List<BookVO> bookList = null;
	      switch(searchField) {
	      case "all":
	         switch(exceptChk) {
	         case "not ":
	            bookList = bookDAO.getSearchAllNotReBookList(searchbookMap);
	            break;
	         default:
	            bookList = bookDAO.getSearchAllBookList(searchbookMap);
	         }
	         break;
	      default:
	         bookList = bookDAO.getSearchBookList(searchbookMap);
	         break;
	      }
		
		
		// 가져온 bookList에서 category_id들만 가져와 리스트 만들기
		List<String> list = new ArrayList<>();
		for (BookVO bookVO:bookList) {
			list.add(bookVO.getCategory_id());
		}
		// 중복 제거를 위해 집합으로 만들었다가 리스트로 바꿈
		Set<String> set = new HashSet<String>(list);
		List<String> ctgrList = new ArrayList<String>(set); // 해당 페이지의 모든 카테고리 아이디(고유값)
		
		// 모든 카테고리 가져오기
		List<CategorymainVO> allMainCtgr = new ArrayList<>();
		// 해당 페이지의 카테고리 중, 서브 카테고리에서 일치하는 것들의 메인 아이디를 가져옴
		for (int i = 0; i < ctgrList.size(); i++) {
			boolean chk = true;
			CategorydetailVO sub = categoryDAO.getOneSubCategory(ctgrList.get(i));
			CategorymainVO main = categoryDAO.getOneMainCategory(sub.getCategory_mainID());
			for (int j = 0; j < allMainCtgr.size(); j++) {
				if ((allMainCtgr.get(j).getCategory_mainID()).equals(main.getCategory_mainID())) {
					// 하나라도 같으면 false
					chk = false;
				}
			}
			if(chk) {
				allMainCtgr.add(main);
			}
		}

		// allMainCtgr를 mainID로 선택정렬 - 오름차순
		for (int x = 0; x < allMainCtgr.size()-1; x++) {
			int tmp = x;
			for (int y = x+1; y < allMainCtgr.size(); y++) {
				// 인덱스 tmp가 더 크면
				if(((allMainCtgr.get(tmp).getCategory_mainID()).compareTo(allMainCtgr.get(y).getCategory_mainID())) > 0) {
					tmp = y;
				}
				Collections.swap(allMainCtgr, x, tmp);
			}
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("searchbook");
		mav.addObject("sort", sort);
		mav.addObject("searchField", searchField);
		mav.addObject("searchWord", searchWord);
		mav.addObject("reSearchWord", reSearchWord);
		mav.addObject("exceptChk", exceptChk);
		mav.addObject("allMainCtgr", allMainCtgr);
		mav.addObject("selectedMain", selectedMain);
		mav.addObject("category", category);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
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
