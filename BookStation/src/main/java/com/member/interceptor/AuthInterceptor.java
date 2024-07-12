package com.member.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.domain.LoginVO;

@Component
public class AuthInterceptor implements HandlerInterceptor {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("preHandle()호출");
		HttpSession session=request.getSession();							// 세션에서 "loginMember" 속성이 받기
		System.out.println("interceptor의 session="+session);
		System.out.println("interceptor의 loginMember="+session.getAttribute("loginMember"));
		if(session.getAttribute("loginMember")==null) {						// 세션이 null이라면~(로그인되지 않았다면~)
//			response.sendRedirect(request.getContextPath()+"/login.do");	// 로그인 페이지로 리다이렉트
			response.setContentType("text/html; charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
			String alertScript = "<script>alert('로그인이 필요한 서비스입니다, 로그인페이지로 이동합니다'); window.location.href='"+request.getContextPath()+"/login.do';</script>";
	        response.getWriter().println(alertScript);
			return false;
		}else {
		    return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 현재 세션에서 로그인한 사람의 정보를 가져옴
		HttpSession session=request.getSession();
		LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
		String member_id = loginVO.getMember_id(); // 아이디만 가져오기
		
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		String viewName = modelAndView.getViewName();
		System.out.println("페이지이름 => " + viewName);
		String pageID = adminDAO.getPageID(viewName);
		System.out.println("페이지ID => " + pageID);
		if (pageID != null) {
			map.put("pageID", pageID);
			adminDAO.insPageMoveLog(map);
		}
		System.out.println("postHandle()호출");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion()호출");
	}

}









