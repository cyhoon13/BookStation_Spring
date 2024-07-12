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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.dao.CartDAO;
import com.member.domain.CartVO;
import com.member.domain.LoginVO;

@Component
@Controller
public class CartController {

    private Logger log = Logger.getLogger(this.getClass());

    @Autowired
    private CartDAO cartDAO;
    @Autowired
    private AdminDAO adminDAO;

    private String getMemberId(HttpSession session) {
        LoginVO loginVO = (LoginVO) session.getAttribute("loginMember");
        return loginVO != null ? loginVO.getMember_id() : null;
    }

    private String redirectToLogin() {
        return "redirect:/login.do";
    }

    private boolean isNotLoggedIn(String member_id) {
        return member_id == null;
    }

    @ModelAttribute
    public void populateModelWithCartData(HttpSession session, Model model) {
        String member_id = getMemberId(session);
        if (member_id != null) {
            List<CartVO> cartList = cartDAO.getCartByMember_id(member_id);
            model.addAttribute("cartList", cartList);
            model.addAttribute("member_id", member_id);
        } else {
            model.addAttribute("cartList", null);
            model.addAttribute("member_id", null);
        }
    }

    /* 장바구니 상품추가 */
    @RequestMapping(value = "/addcart", method = RequestMethod.POST)
    public ModelAndView postCart(HttpServletRequest request, HttpSession session, @ModelAttribute CartVO cartVO) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) return new ModelAndView("redirect:/login.do");

        cartVO.setMember_id(member_id);
        cartDAO.addCart(cartVO);
        CartVO justIn = adminDAO.getRecentMyCart(member_id);

        // 현재 페이지로 리다이렉트하면서 메시지를 전달합니다.
        ModelAndView mav = new ModelAndView("redirect:" + request.getHeader("Referer"));
        mav.addObject("message", "장바구니에 상품을 담았습니다.");
        
        // 데이터 변경 로그 추가
        // 장바구니 넣은 페이지 가져오기
        String pageID = mav.getViewName();
        if (pageID.contains("detail")) {
        	pageID = "detail";
        } else if (pageID.contains("main")) {
        	pageID = "main";
        } else if (pageID.contains("bestseller")) {
        	pageID = "bestseller";
        } else if (pageID.contains("category")) {
        	pageID = "category";
        } else if (pageID.contains("categoryDetail")) {
        	pageID = "categoryDetail";
        } else if (pageID.contains("newbook")) {
        	pageID = "newbook";
        } else if (pageID.contains("searchbook")) {
        	pageID = "searchbook";
        } 
		
		Map<String, Object> cartDT = new HashMap<>();
		cartDT.put("member_id",member_id);
		cartDT.put("chngCode", "INS");
		cartDT.put("targetTable","cart");
		cartDT.put("targetColumn", "ALL");
		cartDT.put("pageID",adminDAO.getPageID(pageID));
		cartDT.put("chngValue", justIn.toString());
		adminDAO.insDataChangeLog(cartDT);
		
        return mav;
    }

    /* 장바구니 조회 */
    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public ModelAndView getCart(HttpServletRequest request, HttpSession session) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) return new ModelAndView("redirect:/login.do");

        List<CartVO> cartList = cartDAO.getCartByMember_id(member_id);
        ModelAndView mav = new ModelAndView("cart");
        mav.addObject("cartList", cartList);
        mav.addObject("member_id", member_id);
        return mav;
    }

    /* 장바구니 항목 삭제 */
    @RequestMapping(value = "/deletecart", method = RequestMethod.POST)
    public ModelAndView deleteCart(HttpServletRequest request, HttpSession session, @ModelAttribute CartVO cartVO) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) return new ModelAndView("redirect:/login.do");

        cartVO.setMember_id(member_id);
        cartDAO.deleteCart(cartVO);

        return new ModelAndView("redirect:/cart.do");
    }

    /* 사이드 장바구니 데이터 조회 */
    @RequestMapping(value = "/minicartData", method = RequestMethod.GET)
    @ResponseBody
    public List<CartVO> getMiniCartData(HttpSession session) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) {
            return null;
        }
        return cartDAO.getCartByMember_id(member_id);
    }
    
    // 장바구니에 추가하고 cart.jsp로 리디렉션
    @RequestMapping(value = "/addToCartAndRedirect.do", method = RequestMethod.POST)
    public String addToCartAndRedirect(HttpServletRequest request, HttpSession session, @ModelAttribute CartVO cartVO, Model model) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) return "redirect:/login.do";

        cartVO.setMember_id(member_id);
        cartVO.setBookCount(Integer.parseInt(request.getParameter("bookCount")));
        cartVO.setIsbn(request.getParameter("isbn"));

        try {
            // 장바구니에 추가
            cartDAO.addCart(cartVO);
            log.info("Added to cart: " + cartVO);
        } catch (Exception e) {
            log.error("Adding to cart failed", e);
            model.addAttribute("errorMessage", "장바구니 추가 중 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.");
            return "detail"; // 오류 시 원래 페이지로 돌아갑니다.
        }

        // 장바구니 페이지로 리디렉션
        return "redirect:/cart.do";
    }
    
    /* 장바구니 수량 표시 */
    @RequestMapping(value = "/cartCount", method = RequestMethod.GET)
    @ResponseBody
    public int getCartCount(HttpSession session) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) {
            log.debug("Member not logged in or session expired.");
            return 0;
        }

        int count = cartDAO.getCartCountByMember_id(member_id);
        log.debug("Cart count for member_id " + member_id + ": " + count); // 디버그용 로그 추가
        return count;
    }

    @RequestMapping(value = "/increaseCartItemCount.do", method = RequestMethod.POST)
    public ModelAndView increaseCartItemCount(HttpServletRequest request, HttpSession session) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) return new ModelAndView("redirect:/login.do");

        long cartId = Long.parseLong(request.getParameter("cart_id"));
        cartDAO.increaseCartItemCount(member_id, cartId);

        return new ModelAndView("redirect:/cart.do");
    }

    @RequestMapping(value = "/decreaseCartItemCount.do", method = RequestMethod.POST)
    public ModelAndView decreaseCartItemCount(HttpServletRequest request, HttpSession session) {
        String member_id = getMemberId(session);
        if (isNotLoggedIn(member_id)) return new ModelAndView("redirect:/login.do");

        long cartId = Long.parseLong(request.getParameter("cart_id"));
        cartDAO.decreaseCartItemCount(member_id, cartId);

        return new ModelAndView("redirect:/cart.do");
    }


}
