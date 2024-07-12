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
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.dao.BookDAO;
import com.member.domain.BookVO;
import com.member.domain.LoginVO;

@Component
@Controller
public class MainController {
	
	private Logger log=Logger.getLogger(this.getClass());

	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private AdminDAO adminDAO;
	
	/*
	@RequestMapping(value="/main.do",method=RequestMethod.GET)
	public String mainGet() {
		log.info("main 이동");
		return "main";//return "이동시킬 파일명";
	}
	
	// 메인페이지(세션처리)
		@RequestMapping(value="/mainSession.do",method=RequestMethod.GET)
		public ModelAndView mainProcess() {
			log.info("session처리 main이동");
			
//			LoginVO loginMember=(LoginVO)session.getAttribute("loginMember");
//			System.out.println("loginMember="+loginMember);
			ModelAndView mav=new ModelAndView();
			
//	        if (loginMember != null) {
//	            model.addAttribute("member", loginMember);
	            mav.setViewName("main");
	            return mav;
//	        } else {
//	        	mav.setViewName("login");
//	            return mav;
//	        }
			
		}
		*/
	// 메인 페이지 이동
		@RequestMapping(value="/main.do",method=RequestMethod.GET)
		public ModelAndView mainprocess(HttpSession session) {
			// 로그인 정보 가져오기
			LoginVO loginMember = (LoginVO) session.getAttribute("loginMember");
			String member_id = "";
			if (loginMember != null) {
				member_id = loginMember.getMember_id();
			} else {
				member_id = "ANONYMOUS";
			}
			
			List<BookVO> weekly = bookDAO.getWeeklyBestTenList();
			List<BookVO> monthly = bookDAO.getMonthlyBestTenList();
			List<BookVO> yesterday = bookDAO.getYesterdayBestTenList();
			List<BookVO> steady = bookDAO.getSteadyBestTenList();
			List<BookVO> discountBest = bookDAO.getDiscountBestList();
			List<BookVO> newNovel = bookDAO.getMainpageNewbooksList("01%");
			List<BookVO> newEssay = bookDAO.getMainpageNewbooksList("02%");
			List<BookVO> newEconomy = bookDAO.getMainpageNewbooksList("07%");
			List<BookVO> newComics = bookDAO.getMainpageNewbooksList("22%");
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("main");
			mav.addObject("weekly", weekly);
			mav.addObject("monthly", monthly);
			mav.addObject("yesterday", yesterday);
			mav.addObject("steady", steady);
			mav.addObject("discountBest", discountBest);
			mav.addObject("newNovel", newNovel);
			mav.addObject("newEssay", newEssay);
			mav.addObject("newEconomy", newEconomy);
			mav.addObject("newComics", newComics);
			
			// 페이지 이동 로그 저장
			String viewname = mav.getViewName();
			Map<String, Object> map = new HashMap<>();
			map.put("member_id", member_id);
			String pageID = adminDAO.getPageID(viewname);
			map.put("pageID", pageID);
			adminDAO.insPageMoveLog(map);
			
			return mav;//return "이동시킬 파일명";
		}
}
