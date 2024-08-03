package com.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.NoticeDAO;
import com.member.dao.QnaDAO;
import com.member.domain.NoticeVO;
import com.member.util.PagingUtil;



@Component
@Controller
public class NoticeController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
    private QnaDAO qnaDAO;
	
	//공지사항 목록 보기
	@RequestMapping("/notice.do")
	public ModelAndView process( 
		 HttpServletRequest request,
		 @RequestParam(value = "pageNum", defaultValue = "1") int currentPage) {
			 
		 Map<String, Object> params = new HashMap<>(); 
		 List<NoticeVO> list = noticeDAO.getAllNoticeList();
         System.out.println("notice의"+list);
	     
         int count = 0;
         
         PagingUtil page = new PagingUtil(currentPage, count, 3, 3, "notice.do"); // 수정된 부분

		 params.put("start", page.getStartCount());
		 params.put("end", page.getEndCount());
         
         ModelAndView mav=new ModelAndView();
	     mav.setViewName("notice");
	     mav.addObject("pagingHtml", page.getPagingHtml());
	     mav.addObject("noticeList",list);
	     
	     return mav;
	}
    
    // 공지사항 상세보기 페이지로 이동
    @RequestMapping(value = "/noticeDetail.do", method = RequestMethod.GET)
    public ModelAndView noticeDetail(@RequestParam("notice_id")int notice_id) {
    	System.out.println("reviewDetail로 이동");
    	
    	// 조회수 증가
        noticeDAO.increaseNoticeViews(notice_id);
    	
    	List<NoticeVO> list = noticeDAO.getNoticeById(notice_id);
        ModelAndView mav=new ModelAndView();
        mav.addObject("list",list);
        mav.setViewName("noticeDetail");
        return mav;
    }
   
    
}
