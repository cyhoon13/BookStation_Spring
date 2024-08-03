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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AllOrderDAO;
import com.member.dao.MemberDAO;
import com.member.domain.DetailOrderVO;
import com.member.domain.LoginVO;
import com.member.domain.OrderVO;
import com.member.domain.shippingVO;

@Component
@Controller
public class ExchangeDetailController {
	
	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private AllOrderDAO allOrderDao;
	
	@Autowired
	private MemberDAO memberDAO;

	// HttpServletRequest request 를 파라미터로 받아와야 세션의 정보를 요청할 수 있음(받아올 수 있음)
	@RequestMapping("/ExchangeDetail.do") //클릭한 링크 (사용자 입장에서 클릭한 이름 ) 
	public ModelAndView process(HttpServletRequest request,
			@RequestParam(value="order_id") long order_id,
			@RequestParam(value="pageNum",defaultValue="1") int currentPage) { //process2 메서드 정의 
		
		// 현재 세션에서 로그인한 사람의 정보를 가져옴
		HttpSession session=request.getSession();
		LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", loginVO.getMember_id());
		map.put("order_id", order_id);
		
		// 현재 회원의 적립률 가져옴
		int saveRate = allOrderDao.getRatePoint(map);
				
		// 하나의 주문, 주문출력, 배송 테이블
		OrderVO order = allOrderDao.getOneOrders(map);
		List<DetailOrderVO> ordersPrintList = allOrderDao.getOrdersPrintList(map);
		shippingVO shipping = allOrderDao.getOneShipping(map);
		
		// 총 주문 금액 : 판매가 * 수량의 합계, 총 적립 금액 : 정가 * 수량 * 회원 적립률의 합계
		int allCost = 0;
		int allPoint = 0;
		for (int i = 0; i < ordersPrintList.size(); i++) {
			int price = ordersPrintList.get(i).getOrdersPrint_price();
			int cnt = ordersPrintList.get(i).getOrdersPrint_count();
			int dc = ordersPrintList.get(i).getBook_discount();

			allCost += price * (100 - dc) * cnt / 100;
			allPoint += price * cnt * saveRate /100;
		}
		order.setTotalPrice(allCost - order.getUsePoint());
		order.setSavePoint(allPoint);
		
		ModelAndView mav=new ModelAndView(); //새로운 ModelAndView 객체를 생성
		mav.setViewName("ExchangeDetail"); //뷰의 이름을 "ExchangeDetail"로 설정
		mav.addObject("order_id", order_id);
		mav.addObject("allCost", allCost);
		mav.addObject("order", order);
		mav.addObject("ordersPrintList", ordersPrintList);
		mav.addObject("shipping", shipping);
		return mav; // mav 를 반환 
	
	}
}
