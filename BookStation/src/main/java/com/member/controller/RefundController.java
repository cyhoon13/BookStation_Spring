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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.dao.AllOrderDAO;
import com.member.domain.AllOrdersListVO;
import com.member.domain.CanceledVO;
import com.member.domain.LoginVO;
import com.member.domain.MemberVO;
import com.member.util.PagingUtil;

@Component
@Controller
public class RefundController {
	
	private Logger log=Logger.getLogger(this.getClass());

	@Autowired
	private AllOrderDAO allOrderDao;
	@Autowired
	private AdminDAO adminDAO;
	
	// 반품/교환/취소 조회 페이지 이동
    @RequestMapping("/orderReturn.do")
    public ModelAndView rtnprocess(HttpServletRequest request,
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
			count = allOrderDao.getAllRefundCountByButton(map);
		} else if (!fromDate.equals("") && !toDate.equals("")) { // 날짜를 선택한 경우
			map.put("fromDate", fromDate);
			map.put("toDate", toDate);
			count = allOrderDao.getAllRefundCountByCalendar(map);
		} else { // 아무것도 안 눌린 경우
			count = allOrderDao.getAllRefundCount(map);
		}
		 PagingUtil page = new PagingUtil(currentPage,count,10,10,"orderReturn.do","&interval=" + interval + "&fromDate=" + fromDate + "&toDate=" + toDate);
		 map.put("start",page.getStartCount());
		 map.put("end", page.getEndCount());
		 
		 List<AllOrdersListVO> allRefundList = null;
		if (interval != 0) { // 버튼이 눌린 경우
			allRefundList = allOrderDao.getAllRefundListByButton(map);
		} else if (!fromDate.equals("") && !toDate.equals("")) { // 날짜를 선택한 경우
			allRefundList = allOrderDao.getAllRefundListByCalendar(map);
		} else { // 아무것도 안 눌린 경우
			allRefundList = allOrderDao.getAllRefundList(map);
		}

        ModelAndView mav = new ModelAndView();
        mav.setViewName("orderReturn");
        mav.addObject("allRefundList", allRefundList);
        mav.addObject("pagingHtml",page.getPagingHtml());

        return mav;
	}
	
	// 반품/교환/취소 신청 페이지 이동
	@RequestMapping("/RefundWrite.do")
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
			count = allOrderDao.getAllRefundableCountByButton(map);
		} else if (!fromDate.equals("") && !toDate.equals("")) { // 날짜를 선택한 경우
			map.put("fromDate", fromDate);
			map.put("toDate", toDate);
			count = allOrderDao.getAllRefundableCountByCalendar(map);
		} else { // 아무것도 안 눌린 경우 
			count = allOrderDao.getAllRefundableCount(map);
		}
		
		PagingUtil page = new PagingUtil(currentPage,count,10,10,"RefundWrite.do","&interval=" + interval + "&fromDate=" + fromDate + "&toDate=" + toDate);
		map.put("start",page.getStartCount());
		map.put("end", page.getEndCount());
		List<AllOrdersListVO> allRefundableList = null;
		if (interval != 0) { // 버튼이 눌린 경우
			allRefundableList = allOrderDao.getAllRefundableListByButton(map);
		} else if (!fromDate.equals("") && !toDate.equals("")) { // 날짜를 선택한 경우
			allRefundableList = allOrderDao.getAllRefundableListByCalendar(map);
		} else { // 아무것도 안 눌린 경우
			allRefundableList = allOrderDao.getAllRefundableList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("RefundWrite");
		mav.addObject("allRefundableList", allRefundableList);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
	
	@RequestMapping(value="/refund.do", method=RequestMethod.POST)
	public String refund(HttpServletRequest request,
						@ModelAttribute CanceledVO canceledVO, Model model) {
		allOrderDao.updateOrdersState(canceledVO);
		allOrderDao.updateOrdersPrintState(canceledVO);
		allOrderDao.insertCanceledTable(canceledVO);
		// 현재 세션에서 로그인한 사람의 정보를 가져옴
		HttpSession session=request.getSession();
		LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
		String member_id = loginVO.getMember_id(); // 아이디만 가져오기
		
		// 데이터 변경 로그에 저장 - orders와 ordersPrint
		Map<String, Object> orderDT = new HashMap<>();
		orderDT.put("member_id", member_id);
		orderDT.put("chngCode", "UDT");
		orderDT.put("targetTable", "orders, ordersPrint");
		orderDT.put("targetColumn", "orderState, ordersPrint_state");
		orderDT.put("pageID", adminDAO.getPageID("RefundWrite"));
		orderDT.put("chngValue", "반품/교환/취소 신청");
		adminDAO.insDataChangeLog(orderDT);
		// canceled
		Map<String, Object> cldDT = new HashMap<>();
		cldDT.put("member_id", member_id);
		cldDT.put("chngCode", "INS");
		cldDT.put("targetTable", "canceled");
		cldDT.put("targetColumn", "ALL");
		cldDT.put("pageID", adminDAO.getPageID("RefundWrite"));
		cldDT.put("chngValue", canceledVO.toString());
		adminDAO.insDataChangeLog(cldDT);
				
		return "redirect:/RefundWrite.do";
	}
	
}
