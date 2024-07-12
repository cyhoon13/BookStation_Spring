package com.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.time.Duration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.member.dao.AdminDAO;
import com.member.dao.BookCategoryDAO;
import com.member.dao.BookDAO;
import com.member.domain.BookCategoryVO;
import com.member.domain.BookVO;
import com.member.domain.LoginVO;
import com.member.domain.ReviewVO;

@Controller
public class DetailController {
	
    @Autowired
    private BookDAO bookDAO;
    @Autowired
    private BookCategoryDAO bookCategoryDAO;
    @Autowired
    private AdminDAO adminDAO;

    @Autowired
    private ServletContext servletContext;
    
    WebDriver driver;
		
    private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detailprocess(@RequestParam("isbn") String isbn, HttpSession session) {
		// 웹 크롤링 관련
		// 책 소개와 목차 Element를 타겟 페이지로부터 가져와 저장할 변수
		List<WebElement> element_info;
		List<WebElement> element_content;
		// 크롬 드라이버의 ID와 Path 설정
		String driverID = "webdriver.chrome.driver";
		// 윈도우
		String path = "/chromedriver/chromedriver-win64/chromedriver-win64/chromedriver.exe";
		// 맥
		// String path = "/chromedriver/chromedriver-mac-arm64/chromedriver-mac-arm64/chromedriver";
		String driverPath = servletContext.getRealPath(path);
		System.setProperty(driverID, driverPath);
		
		// 창 없이 크롤링 하기 위한 옵션 설정
		ChromeOptions options = new ChromeOptions();
		options.addArguments("headless");
		options.addArguments("disable-gpu");
		// 웹 크롤링 관련
		
        if (log.isDebugEnabled()) {
            log.debug("bookDAO=" + bookDAO);
        }
		// 로그인 정보 가져오기
		LoginVO loginMember = (LoginVO) session.getAttribute("loginMember");
		String member_id = "";
		if (loginMember != null) {
			member_id = loginMember.getMember_id();
		} else {
			member_id = "ANONYMOUS";
		}
		
		// 웹 크롤링 - 책 소개와 목차 가져옴
		BookVO thisbook = bookDAO.getOneBook(isbn);
		String URL = "https://product.kyobobook.co.kr/detail/" + thisbook.getBook_num();
		String infotxt = "";
		String contenttxt = "";
		try {
			driver = (WebDriver) new ChromeDriver(options);
			driver.get(URL);
			driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
			element_info = driver.findElements(By.cssSelector("div.info_text"));
			element_content = driver.findElements(By.cssSelector("li.book_contents_item"));
			for (int i = 0; i<element_info.size(); i++) {
				infotxt += element_info.get(i).getAttribute("innerHTML");
			}
			for (int j = 0; j<element_content.size(); j++) {
				contenttxt += element_content.get(j).getAttribute("innerHTML");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			driver.quit();
		}
		
		// 책 소개 - 내용 없을 경우
		if (infotxt.equals("")) {
			infotxt += "이 책에 대한 정보가 없습니다.";
		}
		// 책 목차 - 내용 없을 경우
		if (contenttxt.equals("")) {
			contenttxt += "이 책에 대한 정보가 없습니다.";
		}
		
        // ISBN을 사용하여 해당 책의 카테고리 ID를 가져옴
        String category_id = bookDAO.getCategoryIdByIsbn(isbn);
        
        /*
        String contentRelativePath = "/book_contents/" + category_id + "/" + isbn + "_content.txt";
        String infoRelativePath = "/book_infos/" + category_id + "/" + isbn + "_info.txt";

        String contentAbsolutePath = servletContext.getRealPath(contentRelativePath);
        String infoAbsolutePath = servletContext.getRealPath(infoRelativePath);

        // 책 목차
        StringBuilder contentBuilder = new StringBuilder();
        try {
            File contentFile = new File(contentAbsolutePath);
            BufferedReader contentReader = new BufferedReader(new FileReader(contentFile));
            String contentLine;
            while ((contentLine = contentReader.readLine()) != null) {
                contentBuilder.append(contentLine).append("<br/>");
            }
            contentReader.close();
        } catch (IOException e) {
            contentBuilder.append("이 책은 목차가 없습니다.");
        }

        // 책 내용
        StringBuilder infoBuilder = new StringBuilder();
        try {
            File infoFile = new File(infoAbsolutePath);
            BufferedReader infoReader = new BufferedReader(new FileReader(infoFile));
            String infoLine;
            while ((infoLine = infoReader.readLine()) != null) {
                infoBuilder.append(infoLine).append("<br/>");
            }
            infoReader.close();
        } catch (IOException e) {
            infoBuilder.append("이 책에 대한 정보가 없습니다.");
        }
        */

        BookVO onebook = bookDAO.getOneBook(isbn);
        List<ReviewVO> reviews = bookDAO.getDetailReviewsByIsbn(isbn);

        // 카테고리 정보 추가
        BookCategoryVO categoryInfo = bookCategoryDAO.getCategoryMainAndSubByIsbn(isbn);
        log.debug("categoryInfo=" + categoryInfo);
        String category_main = null;
        String category_sub = null;
        if (categoryInfo != null) {
            category_main = categoryInfo.getCategory_main();
            category_sub = categoryInfo.getCategory_sub();
            log.debug("category_main=" + category_main);
            log.debug("category_sub=" + category_sub);
        }

        List<BookVO> detailBookList = bookDAO.getdetailbookList(category_id);

        ModelAndView mav = new ModelAndView("detail"); // JSP 파일 이름 설정 (detail.jsp)
        mav.addObject("detailBookList", detailBookList);
        mav.addObject("onebook", onebook);
        mav.addObject("content", contenttxt); // 책 내용 전달
        mav.addObject("info", infotxt); // 책 정보 전달
        mav.addObject("category_main", category_main); // 카테고리 메인 전달
        mav.addObject("category_sub", category_sub); // 카테고리 서브 전달
        mav.addObject("reviews", reviews); // 리뷰 전달

		// 페이지 이동 로그 저장
		String viewname = mav.getViewName();
		Map<String, Object> map = new HashMap<>();
		map.put("member_id", member_id);
		String pageID = adminDAO.getPageID(viewname);
		map.put("pageID", pageID);
		// 페이지를 여러번 클릭하면 아이디 충돌이 날 수 있음
		try {
			adminDAO.insPageMoveLog(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
        return mav;
    }
}
