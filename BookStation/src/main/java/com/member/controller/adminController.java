package com.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.dao.AllOrderDAO;
import com.member.domain.AdminMemVO;
import com.member.domain.AllOrdersListVO;
import com.member.domain.DataChangeLogVO;
import com.member.domain.LoginVO;
import com.member.domain.logTryLogVO;
import com.member.domain.pageMoveLogVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class adminController {
	
	private Logger log=Logger.getLogger(this.getClass());
		
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private AllOrderDAO allOrderDao;
	
	// 관리자 회원 목록보기
    @RequestMapping("/adminMember.do")
    public ModelAndView member(HttpServletRequest request,
    						   @RequestParam(value="sort", defaultValue="all") String sort,
                               @RequestParam(value="pageNum", defaultValue="1") int currentPage) {
    	// 탭 전환에 따른 멤버 수
    	int count = 0;
    	switch(sort) {
    	case "active":
    		count = adminDAO.getActiveMemCount();
    		break;
    	case "inactive":
    		count = adminDAO.getInactiveMemCount();
    		break;
    	default:	// all이 default
    		count = adminDAO.getAllMemberCount();
    	}

		Map<String, Object> map = new HashMap<>();
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"adminMember.do", "&sort="+sort);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
    	// 탭 별로 다른 회원 리스트 전달 - 페이징 적용
    	List<AdminMemVO> allMemList = null;
    	switch(sort) {
    	case "active":
    		allMemList = adminDAO.getActiveMemberList(map);
    		break;
    	case "inactive":
    		allMemList = adminDAO.getInactiveMemberList(map);
    		break;
    	default:	// all이 default
    		allMemList = adminDAO.getAllMemberList(map);
    	}
    	
    	// 상태 표기(화면에 띄우는게 보기 좋아서 추가)
    	for(int i=0; i<allMemList.size(); i++) {
    		if(allMemList.get(i).getGrade_name().equals("Inactive")) {
    			allMemList.get(i).setState("탈퇴 회원");
    		} else {
    			allMemList.get(i).setState("활동 중");
    		}
    	}
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("adminMember");
        mav.addObject("allMemList", allMemList);
        mav.addObject("pagingHtml",page.getPagingHtml());
        return mav;
	}
    
    // 관리자 회원 상세보기페이지 이동
    @RequestMapping("/adminDetail.do")
    public ModelAndView memberDetail(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("adminDetail");
        return mav;
	}
    
 	// 관리자 회원 상세보기
    @RequestMapping(value = "/adminDetail.do", method = RequestMethod.POST)
    public String getMemberDetail(@RequestParam("member_id") String member_Id, Model model) {
        AdminMemVO member = adminDAO.getMemberInfo(member_Id);
        model.addAttribute("member", member);
        return "adminDetail";  // memberDetail.jsp로 포워드
    }
    
    // 회원 삭제
    @RequestMapping(value = "/deleteMember.do", method = RequestMethod.POST)
    public String deleteMember(@RequestParam("member_id") String member_Id) {
        adminDAO.deleteMember(member_Id);
        return "redirect:/adminMember.do";  // 삭제 후 리다이렉트할 페이지
    }
    
    
    
    //===================================================
    
    @RequestMapping("/adminLog.do")
    public ModelAndView logProcess(@RequestParam(value="sort", defaultValue="access") String sort,
            					   @RequestParam(value="pageNum", defaultValue="1") int currentPage) {
    	int count = 0;
    	switch (sort) {
    	case "pageMove":
    		count = adminDAO.getAllPageMoveCount();
    		break;
    	case "dataChange":
    		count = adminDAO.getAllDataChangeCount();
    		break;
    	default:
    		count = adminDAO.getAllLogTryCount();
    	}
    	
    	Map<String, Object> map = new HashMap<>();
		PagingUtil page = new PagingUtil(currentPage,count,20,10,"adminLog.do", "&sort="+sort);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
    	
		List<logTryLogVO> logTryList = adminDAO.getAllLogTryList(map);
		List<pageMoveLogVO> pageMoveList = adminDAO.getAllPageMoveList(map);
		List<DataChangeLogVO> dataChangeList = adminDAO.getAllDataChangeList(map);
		System.out.println(dataChangeList);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("adminLog");
        mav.addObject("sort", sort);
        mav.addObject("logTryList", logTryList);
        mav.addObject("pageMoveList", pageMoveList);
        mav.addObject("dataChangeList", dataChangeList);
        mav.addObject("pagingHtml",page.getPagingHtml());
        return mav;
	}
    
    //===================================================
    
    @RequestMapping("/adminOrders.do")
    public ModelAndView process(HttpServletRequest request,
    							 @RequestParam(value="interval", defaultValue = "0") int interval,
    							 @RequestParam(value="fromDate", defaultValue = "") String fromDate,
                                 @RequestParam(value="toDate", defaultValue = "") String toDate,
                                 @RequestParam(value="pageNum", defaultValue="1") int currentPage) {
		// 현재 세션에서 로그인한 사람의 정보를 가져옴
		HttpSession session=request.getSession();
		LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
		String member_id = loginVO.getMember_id(); // 아이디만 가져오기
		
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		
		// 가져올 목록 전체 개수
		int count = 0;
		if (interval != 0) { // 버튼이 눌린 경우
			map.put("interval", interval);
			count = allOrderDao.getAllOrdersCountByButton(map);
		} else if (!fromDate.equals("") && !toDate.equals("")) { // 날짜를 선택한 경우
			map.put("fromDate", fromDate);
			map.put("toDate", toDate);
			count = allOrderDao.getAllOrdersCountByCalendar(map);
		} else { // 아무것도 안 눌린 경우
			count = allOrderDao.getAllOrdersCount(map);
		}
		
		 PagingUtil page = new PagingUtil(currentPage,count,10,10,"adminOrders.do","&interval=" + interval + "&fromDate=" + fromDate + "&toDate=" + toDate);
		 map.put("start",page.getStartCount());
		 map.put("end", page.getEndCount());
		 
		 List<AllOrdersListVO> allOrdersList = null;
		if (interval != 0) { // 버튼이 눌린 경우
			allOrdersList = allOrderDao.getAllOrdersListByButton(map);
		} else if (!fromDate.equals("") && !toDate.equals("")) { // 날짜를 선택한 경우
			allOrdersList = allOrderDao.getAllOrdersListByCalendar(map);
		} else { // 아무것도 안 눌린 경우
			allOrdersList = allOrderDao.getAllOrdersList(map);
		}

        ModelAndView mav = new ModelAndView();
        mav.setViewName("adminOrders");
        mav.addObject("allOrdersList", allOrdersList);
        mav.addObject("pagingHtml",page.getPagingHtml());

        return mav;
	}
}
