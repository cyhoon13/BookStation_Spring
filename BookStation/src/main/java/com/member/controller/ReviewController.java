package com.member.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.BookDAO;
import com.member.dao.QnaDAO;
import com.member.dao.ReviewDAO;
import com.member.domain.BookVO;
import com.member.domain.LoginVO;
import com.member.domain.MemberVO;
import com.member.domain.ReviewVO;
import com.member.util.PagingUtil;
import com.member.validator.ReviewValidator;



@Component
@Controller
public class ReviewController {

	private Logger log=Logger.getLogger(this.getClass());
	
	@Autowired
	private ReviewDAO reviewDao;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private BookDAO bookDAO;
	
//	@RequestMapping("/review.do")
//	public ModelAndView process() {
//	      
//	      List<ReviewVo> list=null;
//	      
//         list=reviewDao.getAllReviews();
//         System.out.println("review의"+list);
//	      
//	      ModelAndView mav=new ModelAndView();
	
//	      mav.setViewName("myReview");
//	      mav.addObject("list",list);
//	      return mav;
	
	@RequestMapping("/review.do")
    public ModelAndView process(
        HttpServletRequest request,
        @RequestParam(value = "isReview", defaultValue = "0") int isReview,
        @RequestParam(value = "filter", defaultValue = "") String filter,
        @RequestParam(value = "fromDate", defaultValue = "") String fromDate,
        @RequestParam(value = "toDate", defaultValue = "") String toDate,
        @RequestParam(value = "pageNum", defaultValue = "1") int currentPage) {

        HttpSession session = request.getSession();
        LoginVO loginVO = (LoginVO) session.getAttribute("loginMember");
        List<MemberVO> list = qnaDAO.getMemberList(loginVO.getMember_id());
        String memID = list.get(0).getMember_id();

        Map<String, Object> params = new HashMap<>();
        params.put("memID", memID);
        params.put("isReview", isReview);
        params.put("filter", filter);
        params.put("fromDate", fromDate);
        params.put("toDate", toDate);

        int count = 0;
        if (!filter.equals("")) {
            count = reviewDao.getReviewCountByFilter(params); // 수정된 부분
        } else if (!fromDate.equals("") && !toDate.equals("")) {
            count = reviewDao.getReviewCountByCalendar(params);
        } else {
            count = reviewDao.getReviewCount(params);
        }

        PagingUtil page = new PagingUtil(currentPage, count, 10, 10, "review.do", 
                                         "&isReview=" + isReview + "&filter=" + filter + 
                                         "&fromDate=" + fromDate + "&toDate=" + toDate); // 수정된 부분

        params.put("start", page.getStartCount());
        params.put("end", page.getEndCount());

        List<ReviewVO> reviewList = null;
        List<String> bookTitleList = null;
        List<java.sql.Date> orderDateList = null;

        if (!filter.equals("")) {
            reviewList = reviewDao.getReviewListByFilter(params); // 수정된 부분
            bookTitleList = reviewDao.getBookListByFilter(params); // 추가된 부분
            orderDateList = reviewDao.getOrdersDateListByFilter(params); // 추가된 부분
        } else if (!fromDate.equals("") && !toDate.equals("")) {
            reviewList = reviewDao.getReviewListByCalendar(params);
            bookTitleList = reviewDao.getBookListByCalendar(params); // 추가된 부분
            orderDateList = reviewDao.getOrdersDateListByCalendar(params); // 추가된 부분
        } else {
            reviewList = reviewDao.getReviewList(params);
            bookTitleList = reviewDao.getBookList(params);
            orderDateList = reviewDao.getOrdersDateList(params);
        }

        ModelAndView mav = new ModelAndView();
        mav.setViewName("myReview");
        mav.addObject("count", count);
        mav.addObject("currentPage", currentPage);
        mav.addObject("reviewList", reviewList);
        mav.addObject("pagingHtml", page.getPagingHtml());
        mav.addObject("bookTitleList", bookTitleList); // 추가된 부분
        mav.addObject("orderDateList", orderDateList); // 추가된 부분
        mav.addObject("isReview", isReview);  // 추가된 부분: 탭 상태를 유지하기 위해 추가
        mav.addObject("filter", filter);  // 추가된 부분: 현재 적용된 필터를 유지하기 위해 추가

        return mav;
    }


    private Map<String, Object> getDateRange(String filter) {
        LocalDate endDate = LocalDate.now();
        LocalDate startDate;

        switch (filter) {
            case "day":
                startDate = endDate.minusDays(1);
                break;
            case "week":
                startDate = endDate.minusWeeks(1);
                break;
            case "month":
                startDate = endDate.minusMonths(1);
                break;
            case "3months":
                startDate = endDate.minusMonths(3);
                break;
            default:
                throw new IllegalArgumentException("Invalid filter: " + filter);
        }

        Map<String, Object> dateRange = new HashMap<>();
        dateRange.put("startDate", Date.from(startDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        dateRange.put("endDate", Date.from(endDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        return dateRange;
    }

    private Map<String, Object> getDateRange(LocalDate fromDate, LocalDate toDate) {
        Map<String, Object> dateRange = new HashMap<>();
        dateRange.put("startDate", Date.from(fromDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        dateRange.put("endDate", Date.from(toDate.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        return dateRange;
    }
	
	 // 리뷰 작성 페이지로 이동
		/*
		 * @RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET) public
		 * String register() { System.out.println("reviewWrite로 이동"); return
		 * "reviewWrite"; }
		 */
	
	// 리뷰 작성 페이지로 이동
    @RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET)
    public ModelAndView register(@RequestParam("isbn") String isbn,
    							 @RequestParam("reviewID") int review_id) {
        BookVO book = bookDAO.getOneBook(isbn);
        
        ModelAndView mav=new ModelAndView("reviewWrite");
        mav.addObject("book",book);
        mav.addObject("review_id", review_id);
        
        return mav;
    }
    
    
    // 리뷰 작성하기
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST)
    public String submit(@ModelAttribute ReviewVO reviewVo,
    		             @RequestParam("review_id") int review_id,
    		             @RequestParam("review_content") String review_content,
    		             @RequestParam("review_score") int review_score,
    		             BindingResult result) {
        if (log.isDebugEnabled()) {
            log.debug("reviewVo=" + reviewVo);
        }
        
        // 정상적으로 입력되었다면 리뷰데이터를 수정(update)
        Map<String, Object> review = new HashMap<String,Object>();
        review.put("review_id", review_id);
        review.put("review_content", review_content);
        review.put("review_score", review_score);
        review.put("isReivew", 1);
        // Dao에 업데이트 메서드 넣기 파라미터는 review
        reviewDao.writeReview(review);

        // 글목록으로 이동
        return "redirect:/review.do";
    }
    
    
    
    // 리뷰 상세보기 페이지로 이동
    @RequestMapping(value = "/reviewDetail.do", method = RequestMethod.GET)
    public ModelAndView reviewDetail(@RequestParam("review_id")int review_id) {
    	System.out.println("reviewDetail로 이동");
    	List<ReviewVO> list=null;
    	list=reviewDao.getReviewById(review_id);
        ModelAndView mav=new ModelAndView();
        mav.addObject("list2",list);
        mav.setViewName("reviewDetail");
        return mav;
    }
   
    
    // 리뷰 수정페이지로 이동
    //@RequestMapping(value = "/update.do", method = RequestMethod.GET)
    @RequestMapping(value = "/update.do")
    public ModelAndView update(@RequestParam("review_id") int review_id) {
        System.out.println("update페이지 이동");
        System.out.println("review_id=>"+review_id);
        List<ReviewVO> reviewlist2 = reviewDao.getReviewById(review_id);//리뷰번호
        System.out.println("reviewlist2=>"+reviewlist2);
        ModelAndView mav = new ModelAndView();
        mav.addObject("reviewlist2", reviewlist2);//${list2}
        mav.setViewName("reviewUpdate");//reviewUpdate.jsp
        return mav;
    }
    
    
    // 리뷰 수정 처리
    @RequestMapping(value = "/updateSubmit.do", method = RequestMethod.POST)
    public String updateReview(ReviewVO reviewVo, BindingResult result) {
    	System.out.println("update수정처리");
    	System.out.println("updateSubmit의 reviewVO="+reviewVo);
        if (log.isDebugEnabled()) {
            log.debug("reviewVo=" + reviewVo);
        }

      //유효성 검사를 실행
  		new ReviewValidator().validate(reviewVo, result );
  		
  		
  		
//        // 에러가 발생하면 폼을 다시 보여줌
//        if (result.hasErrors()) {
//            return "reviewUpdate";
//        }

        // 리뷰를 데이터베이스에 업데이트
        reviewDao.updateReview(reviewVo);
        System.out.println("getReview_id="+reviewVo.getReview_id());

        // 글목록 또는 상세 페이지로 이동
        return "redirect:/reviewDetail.do?review_id=" + reviewVo.getReview_id();
    }
    
    
	//리뷰 삭제하기
	  @RequestMapping("/deletePro.do")
	  public String form(@RequestParam("review_id") int reviewId) {
      if (log.isDebugEnabled()) {
          log.debug("reviewId:" + reviewId);
      }

      reviewDao.deleteReview(reviewId);

      return "redirect:/review.do"; // 삭제 후 목록으로 이동
  }
    
    
//    // 삭제 폼으로 이동
//    @RequestMapping("/delete.do")
//    public String deleteReview(@RequestParam("review_id") int reviewId, Model model) {
//    	System.out.println("review삭제");
//        model.addAttribute("reviewId", reviewId);
//        return "deleteForm"; // 삭제 폼으로 이동 (Yes/No)
//    }
    
    // 리뷰 상세보기 페이지로 이동
//    @RequestMapping(value = "/reviewDetail.do", method = RequestMethod.GET)
//    public String detail() {
//        System.out.println("reviewDetail로 이동");
//        return "reviewDetail";
//    }

}
