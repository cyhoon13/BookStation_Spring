package com.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;//@Controller 어노테이션
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;//@RequestMapping
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.dao.QnaDAO;
import com.member.domain.GradeVO;
import com.member.domain.LoginVO;
import com.member.domain.MemberVO;
import com.member.domain.QnaVO;
import com.member.util.PagingUtil;

//POJO클래스로 작성->어떠한 인터페이스또는 클래스를 상속받지 않고 단독적으로 자유롭게
// 웹상에서 요청을 받아서 처리해주는 클래스 ->implements Controller (상속 X)
//요청을 받아서 처리해주는 메서드(자유롭게)->클래스명 위에 @Controller
//System.out.println(e.toString())->대신에 로그를 설정하는 방법

@Component
@Controller
public class MypageController {

	// 로그 설정
	private Logger log=Logger.getLogger(this.getClass());//SelectListController
	
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private AdminDAO adminDAO;
	
	// 마이페이지
	@RequestMapping("/mypage.do")
	public ModelAndView mypage(HttpServletRequest request) {
	    System.out.println("mypage() 호출");
	    System.out.println("mypage의 request = "+request);
	    HttpSession session=request.getSession();
	    System.out.println("mypage의 loginMember = "+session.getAttribute("loginMember"));
	    LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
	    System.out.println("mypage의 loginVO = "+loginVO);

	    List<MemberVO> memberList=qnaDAO.getMemberList(loginVO.getMember_id());  // loginMember에서 member_id를 사용하여 필터링
	    List<QnaVO> qnaList=qnaDAO.getMypageQnaList(loginVO.getMember_id());
	    List<GradeVO> gradeList=qnaDAO.getGradeList();
	    
	    ModelAndView mav=new ModelAndView();
	    mav.setViewName("mypage");
	    mav.addObject("memberList", memberList);
	    mav.addObject("qnaList", qnaList);
	    mav.addObject("gradeList",gradeList);
	    request.setAttribute("loginVO", loginVO);
	    System.out.println("세팅후 request = "+request);
	    return mav;
	}
	
	// 문의내역
	@RequestMapping(value = "/qna.do", method = RequestMethod.GET)
	public ModelAndView qnaList(HttpServletRequest request,
								@RequestParam(value = "pageNum", defaultValue = "1")int currentPage) {
		System.out.println("qnaList() 호출");
		HttpSession session=request.getSession();
		LoginVO loginVO=(LoginVO)session.getAttribute("loginMember");
		
		int count=qnaDAO.getQnaCount(loginVO.getMember_id());
		System.out.println("qna()의 count = "+count);
		
		PagingUtil page=new PagingUtil(currentPage,count,10,10,"qna.do");
		Map<String, Object> pageRange=new HashMap<>();
		pageRange.put("member_id", loginVO.getMember_id());
		pageRange.put("start", page.getStartCount());
		pageRange.put("end", page.getEndCount());
		
		List<QnaVO> qnaList=null;
		qnaList=qnaDAO.getAllQnaList(pageRange);
		System.out.println("qnaList의 qnaList = "+qnaList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna");
		mav.addObject("qnaList",qnaList);
		mav.addObject("pagingHtml",page.getPagingHtml());
		return mav;
	}
	
	// 문의세부내역
	@RequestMapping("/qnaDetail.do")
	public ModelAndView qnaDetail(@RequestParam("qna_id")int qna_id) {
		System.out.println("qnaDetail() 호출");
		List<QnaVO> qnaList=null;
		qnaList=qnaDAO.getQnaList(qna_id);
		System.out.println("qnaDetail의 qna_id = "+qna_id);
		System.out.println("qnaDetail의 qnaList = "+qnaList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qnaDetail");
		mav.addObject("qnaList",qnaList);
		return mav;
	}
	
	// 문의작성(페이지이동)
	@RequestMapping("/qnaWrite.do")
	public ModelAndView qnaWrite(HttpSession session,Model model) {
		System.out.println("qnaWrite() 호출");
	    LoginVO loginMember=(LoginVO)session.getAttribute("loginMember");
	    System.out.println("qnaWrite의 loginMember = "+loginMember);
		List<MemberVO> writeList=qnaDAO.getMemberList(loginMember.getMember_id());
		System.out.println("qnaWrite의 writeList = "+writeList);
		model.addAttribute("qnaWrite의 member", loginMember);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qnaWrite");
		mav.addObject("writeList",writeList);
		return mav;
	}
	
	// 문의작성(입력처리)
	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWritePro(@ModelAttribute QnaVO qnaVO) {
		System.out.println("qnaWritePro() 호출");
		qnaDAO.insertQna(qnaVO);
		System.out.println("qnaWritePro의 qnaVO = "+qnaVO);
		
		// 데이터 변경 로그 저장
		// 방금 들어간 문의 불러오기
		QnaVO justIn = adminDAO.getRecentMyQnA(qnaVO.getMember_id());
		Map<String, Object> qnaDT = new HashMap<>();
		qnaDT.put("member_id",justIn.getMember_id());
		qnaDT.put("chngCode", "INS");
		qnaDT.put("targetTable","qna");
		qnaDT.put("targetColumn", "ALL");
		qnaDT.put("pageID",adminDAO.getPageID("qnaWrite"));
		qnaDT.put("chngValue", justIn.toString());
		adminDAO.insDataChangeLog(qnaDT);
		
		return "redirect:/qna.do";
	}
	
	// 문의수정(페이지이동)
	@RequestMapping("/qnaUpdate.do")
	public ModelAndView qnaUpdate(@RequestParam("qna_id")int qna_id) {
		System.out.println("qnaUpdate() 호출");
		List<QnaVO> updateList=null;
		updateList=qnaDAO.getQnaList(qna_id);
		System.out.println("qnaUpdate의 member_id = "+qna_id);
		System.out.println("qnaUpdate의 updateList = "+updateList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qnaUpdate");
		mav.addObject("updateList",updateList);
		return mav;
	}
	
	// 문의수정(수정처리)
	@RequestMapping(value = "/qnaUpdate.do", method = RequestMethod.POST)
	public String qnaUpdatePro(@ModelAttribute QnaVO qnaVO) {
		System.out.println("qnaUpdatePro() 호출");
		
		// 수정 전 문의 내용 불러오기
		QnaVO bfrUdt = qnaDAO.getQnaList(qnaVO.getQna_id()).get(0);
		// 다른 부분만 저장하기
		Map<String, Object> qnaDT = new HashMap<>();
		qnaDT.put("member_id", bfrUdt.getMember_id());
		qnaDT.put("chngCode", "UDT");
		qnaDT.put("targetTable", "qna");
		qnaDT.put("pageID", adminDAO.getPageID("qnaUpdate"));
		String targetColumn = "";
		String chngValue = "";
		if (bfrUdt.getQna_type() != qnaVO.getQna_type()) {
			targetColumn += "qna_type, ";
			chngValue += " qna_type: " + qnaVO.getQna_type();
		}
		if (!bfrUdt.getQna_title().equals(qnaVO.getQna_title())) {
			targetColumn += "qna_title, ";
			chngValue += " qna_title: " + qnaVO.getQna_title();
		}
		if (!bfrUdt.getQna_content().equals(qnaVO.getQna_content())) {
			targetColumn += "qna_content, ";
			chngValue += " qna_content: " + qnaVO.getQna_content();
		}
        if (targetColumn.length() > 0) {
        	targetColumn = targetColumn.substring(0, targetColumn.length()-2);
        }
        qnaDT.put("targetColumn", targetColumn);
        qnaDT.put("chngValue", chngValue);
		qnaDAO.updateQna(qnaVO);
		// 업데이트 적용 후 기록하기
        adminDAO.insDataChangeLog(qnaDT);
		System.out.println("qnaUpdatePro의 qnaVO");
		return "redirect:/qna.do";
	}
	
	// 문의삭제(delete)
	@RequestMapping("/qnaDelete.do")
	public ModelAndView qnaDelete(HttpSession session, @RequestParam("qna_id")int qna_id) {
		System.out.println("qnaDelete() 호출");
		qnaDAO.deleteQna(qna_id);
		
		// 데이터 변경 로그 저장
		LoginVO loginMember=(LoginVO)session.getAttribute("loginMember");
		Map<String, Object> qnaDT = new HashMap<>();
		qnaDT.put("member_id",loginMember.getMember_id());
		qnaDT.put("chngCode", "DEL");
		qnaDT.put("targetTable","qna");
		qnaDT.put("targetColumn", "ALL");
		qnaDT.put("pageID",adminDAO.getPageID("qna"));
		qnaDT.put("chngValue", "qna_id: " + qna_id + ", member_id: " + loginMember.getMember_id());
		adminDAO.insDataChangeLog(qnaDT);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/qna.do");
		return mav;
	}
	
	// 등급
	@RequestMapping("/grade.do")
	public ModelAndView grade() {
		System.out.println("grade() 호출");
		
		List<GradeVO> gradeList=null;
		gradeList=qnaDAO.getGradeList();
		System.out.println("grade의 gradeList = "+gradeList);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("grade");
		mav.addObject("gradeList",gradeList);
		return mav;
	}
	
	// 고객센터
	@RequestMapping("/customerService.do")
	public ModelAndView customerService(HttpSession session) {
		System.out.println("customerService() 호출");
		
		// 로그인 정보 가져오기
		LoginVO loginMember = (LoginVO) session.getAttribute("loginMember");
		String member_id = "";
		if (loginMember != null) {
			member_id = loginMember.getMember_id();
		} else {
			member_id = "ANONYMOUS";
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("customerService");
		
		// 페이지 이동 로그 저장
		String viewname = mav.getViewName();
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		String pageID = adminDAO.getPageID(viewname);
		map.put("pageID", pageID);
		adminDAO.insPageMoveLog(map);
		
		return mav;
	}
	
	// 자주묻는질문
	@RequestMapping("/faq.do")
	public ModelAndView faq(HttpSession session) {
		System.out.println("faq() 호출");
		
		// 로그인 정보 가져오기
		LoginVO loginMember = (LoginVO) session.getAttribute("loginMember");
		String member_id = "";
		if (loginMember != null) {
			member_id = loginMember.getMember_id();
		} else {
			member_id = "ANONYMOUS";
		}
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("faq");
		
		// 페이지 이동 로그 저장
		String viewname = mav.getViewName();
		Map<String, Object> logMap = new HashMap<>();
		logMap.put("member_id", member_id);
		String pageID = adminDAO.getPageID(viewname);
		logMap.put("pageID", pageID);
		adminDAO.insPageMoveLog(logMap);
		
		return mav;
	}
	
	/*
	 * @RequestMapping("/notice.do") public ModelAndView notice() {
	 * System.out.println("notice() 호출");
	 * 
	 * ModelAndView mav=new ModelAndView(); mav.setViewName("notice"); return mav; }
	 */
	
	
	// 자주묻는질문(페이지 이동만 할 경우 String으로도 작성 가능)
//	@RequestMapping("/faq.do")
//	public String process5() {
//		System.out.println("process5() 호출");
//		return "faq";
//	}
	
}




