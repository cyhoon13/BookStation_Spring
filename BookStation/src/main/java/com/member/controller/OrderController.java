package com.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.CartDAO;
import com.member.dao.OrderDAO;
import com.member.domain.CartVO;
import com.member.domain.LoginVO;
import com.member.domain.OrderVO;
import com.member.domain.OrdersPrintVO;

@Component
@Controller
public class OrderController {

    private Logger log = Logger.getLogger(this.getClass());

    @Autowired
    private OrderDAO orderDAO;

    @Autowired
    private CartDAO cartDAO;

    private String getMemberId(HttpSession session) {
        LoginVO loginVO = (LoginVO) session.getAttribute("loginMember");
        return loginVO != null ? loginVO.getMember_id() : null;
    }

    private boolean isNotLoggedIn(HttpServletRequest request) {
        return getMemberId(request.getSession()) == null;
    }

    private boolean isNotLoggedIn(String member_id) {
        return member_id == null;
    }

    private String redirectToLogin() {
        return "redirect:/login.do";
    }

    @Transactional
    @RequestMapping(value = "/completed", method = {RequestMethod.POST, RequestMethod.GET})
    public String completed(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        if (isNotLoggedIn(request)) return redirectToLogin();

        String member_id = getMemberId(session);

        if (request.getMethod().equals("POST")) {
            try {
                String totalPriceStr = request.getParameter("totalPrice");
                String usePointStr = request.getParameter("usePoint");
                String savePointStr = request.getParameter("savePoint");
                String payOption1 = request.getParameter("payOption1");
                String payOption2 = request.getParameter("payOption2");
                String payOption3 = request.getParameter("payOption3");
                String shipping_name = request.getParameter("shipping_name");
                String shipping_phone = request.getParameter("shipping_phone");
                String shippingAddr1 = request.getParameter("shippingAddr1");
                String shippingAddr2 = request.getParameter("shippingAddr2");
                String shippingAddr3 = request.getParameter("shippingAddr3");
                String shippingOption1 = request.getParameter("shippingOption1");
                String shippingOption2 = request.getParameter("shippingOption2");

                log.info("Received totalPrice: " + totalPriceStr);
                log.info("Received usePoint: " + usePointStr);
                log.info("Received savePoint: " + savePointStr);
                log.info("Received payOption1: " + payOption1);
                log.info("Received payOption2: " + payOption2);
                log.info("Received payOption3: " + payOption3);
                log.info("Received shipping_name: " + shipping_name);
                log.info("Received shipping_phone: " + shipping_phone);
                log.info("Received shippingAddr1: " + shippingAddr1);
                log.info("Received shippingAddr2: " + shippingAddr2);
                log.info("Received shippingAddr3: " + shippingAddr3);
                log.info("Received shippingOption1: " + shippingOption1);
                log.info("Received shippingOption2: " + shippingOption2);

                // 파라미터 검증
                if (totalPriceStr == null || usePointStr == null || savePointStr == null ||
                    payOption1 == null || shipping_name == null || shipping_phone == null ||
                    shippingAddr1 == null || shippingAddr2 == null || shippingAddr3 == null ||
                    shippingOption1 == null) {
                    model.addAttribute("errorMessage", "필수 파라미터가 누락되었습니다.");
                    return "order";
                }

                // 숫자 변환 검증
                int totalPrice, usePoint, savePoint;
                try {
                    totalPrice = (int) Double.parseDouble(totalPriceStr);
                    usePoint = Integer.parseInt(usePointStr);
                    savePoint = Integer.parseInt(savePointStr);
                } catch (NumberFormatException e) {
                    log.error("Number format exception", e);
                    model.addAttribute("errorMessage", "잘못된 숫자 형식입니다.");
                    return "order";
                }

                OrderVO orderVO = new OrderVO();
                orderVO.setMember_id(member_id);
                orderVO.setTotalPrice(totalPrice);
                orderVO.setUsePoint(usePoint);
                orderVO.setSavePoint(savePoint);
                orderVO.setPayOption1(payOption1);
                orderVO.setPayOption2(payOption2);
                orderVO.setPayOption3(payOption3);
                orderVO.setShipping_name(shipping_name);
                orderVO.setShipping_phone(shipping_phone);
                orderVO.setShippingAddr1(shippingAddr1);
                orderVO.setShippingAddr2(shippingAddr2);
                orderVO.setShippingAddr3(shippingAddr3);
                orderVO.setShippingOption1(shippingOption1);
                orderVO.setShippingOption2(shippingOption2);
                orderVO.setOrderState("주문");

                if (log.isDebugEnabled()) {
                    log.debug("orderVO=" + orderVO);
                }

                // 주문 추가
                orderDAO.addOrder(orderVO);

                // order_id를 추출
                long order_id = orderVO.getOrder_id();

                // 배송 정보 추가
                orderVO.setOrder_id(order_id); // 새로운 order_id 설정
                orderDAO.addShipping(orderVO);

                List<CartVO> cartList = cartDAO.getCartByMember_id(member_id);
                for (CartVO cartItem : cartList) {
                    OrdersPrintVO ordersPrintVO = new OrdersPrintVO();
                    ordersPrintVO.setOrder_id(order_id); // 새로운 order_id 설정
                    ordersPrintVO.setMember_id(member_id);
                    ordersPrintVO.setIsbn(cartItem.getIsbn());
                    ordersPrintVO.setOrdersPrint_price(cartItem.getBook_price() * cartItem.getBookCount());
                    ordersPrintVO.setOrdersPrint_count(cartItem.getBookCount());
                    ordersPrintVO.setOrdersPrint_state("주문");

                    orderDAO.addOrdersPrint(ordersPrintVO);
                }

                cartDAO.deleteCartByMemberId(member_id);
                
             // 회원 포인트 업데이트
                orderDAO.updateMemberPoints(member_id, savePoint, usePoint);
                
             // 회원 총 주문 금액 업데이트
                orderDAO.updateMemberTotalPrice(member_id, totalPrice);

            } catch (Exception e) {
                log.error("Order saving failed", e);
                model.addAttribute("errorMessage", "주문 처리 중 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.");
                return "order";
            }
        }

        model.addAttribute("member_id", member_id);
        return "completed";
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public ModelAndView getOrder(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String member_id = getMemberId(session);

        if (isNotLoggedIn(member_id)) {
            return new ModelAndView("redirect:/login.do");
        }

        List<CartVO> cartList = cartDAO.getCartByMember_id(member_id);
        ModelAndView mav = new ModelAndView("order");
        mav.addObject("cartList", cartList);
        mav.addObject("member_id", member_id);

        String totalPrice = request.getParameter("totalPrice");
        String usePoint = request.getParameter("usePoint");
        String savePoint = request.getParameter("savePoint");

        log.info("Passing totalPrice: " + totalPrice);
        log.info("Passing usePoint: " + usePoint);
        log.info("Passing savePoint: " + savePoint);

        mav.addObject("totalPrice", totalPrice);
        mav.addObject("usePoint", usePoint);
        mav.addObject("savePoint", savePoint);

        return mav;
    }
}
