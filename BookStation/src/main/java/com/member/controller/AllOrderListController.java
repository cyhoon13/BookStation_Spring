package com.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AllOrderDAO;
import com.member.domain.AllOrdersListVO;
import com.member.domain.LoginVO;
import com.member.domain.OrderVO;
import com.member.domain.OrdersPrintVO;
import com.member.domain.shippingVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class AllOrderListController {
	
	private Logger log=Logger.getLogger(this.getClass());
		
	@Autowired
	private AllOrderDAO allOrderDao;
	
    @RequestMapping("/AllOrderList.do")
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
		
		 PagingUtil page = new PagingUtil(currentPage,count,10,10,"AllOrderList.do","&interval=" + interval + "&fromDate=" + fromDate + "&toDate=" + toDate);
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
        mav.setViewName("AllOrderList");
        mav.addObject("allOrdersList", allOrdersList);
        mav.addObject("pagingHtml",page.getPagingHtml());

        return mav;
	}
}
