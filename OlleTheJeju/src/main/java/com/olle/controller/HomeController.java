package com.olle.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.olle.biz.customplan.CustomBiz;
import com.olle.biz.etc.ImgBiz;
import com.olle.biz.jejusituation.CoronaBiz;
import com.olle.biz.member.NaverLoginBO;
import com.olle.dto.customplan.CustomDto;
import com.olle.dto.etc.ImgDto;

@Controller
public class HomeController {
	
	@Autowired
	private CustomBiz cusBiz;
	
	@Autowired
	private ImgBiz imgBiz;
	
	@Autowired
	private CoronaBiz cBiz;
	
	// NaverLoginBO
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest req, HttpSession session) {
		List<Integer> planNumList = cusBiz.topten();
		List<CustomDto> titleList = new ArrayList<CustomDto>();
		
		for(int i = 0; i < planNumList.size(); i++) {
			titleList.add(i, cusBiz.selectTopten(planNumList.get(i)));
		}
		model.addAttribute("titleList", titleList);
		
		List<ImgDto> imgList = imgBiz.selectList(3);
		List<ImgDto> nameList = new ArrayList<ImgDto>();
		for(ImgDto idx : imgList) {
			for(Integer pidx : planNumList) {
				if(pidx == idx.getTable_num()) {
					if(idx.getGroup_num() == 3) {
						nameList.add(idx);
					}
				}
			}
		}
		model.addAttribute("nameList", nameList);
		
		String user_id = req.getParameter("user_id");
		
		if(user_id == null || user_id == "") {
			session.setAttribute("idChk", false);
		} else {
			session.setAttribute("idChk", true);
			session.setAttribute("user_id", user_id);
		}
		
		cBiz.searchData();
		return "home";
	}
	
	@RequestMapping(value = "loginForm.do", method = RequestMethod.GET)
	public String loginForm(HttpSession session, Model model) {
		// ????????? ?????????
		// Naver ID??? ?????? URL??? ???????????? ????????? naverLoginBO class??? getAuthorizationUrl method ?????? 
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//?????? ???????????? ???????????? ?????? : response_type, client_id, redirect_uri, state
		System.out.println("?????????:" + naverAuthUrl);
		
		// Naver 
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}
	
	// Naver Login ????????? callback?????? method
	@RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		System.out.println("????????? callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        // Login ????????? ????????? ????????????.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        model.addAttribute("result", apiResult);
        session.setAttribute("naver", "naver");
        // Naver Login ?????? ????????? View ??????
        return "redirect:home.do";
	}
	
	@RequestMapping(value = "joinForm.do", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "emailChk.do", method = RequestMethod.POST)
	@ResponseBody
	public String emailChk(String user_email) {
		//?????? ?????? ??????
		String host = "smtp.naver.com";
		final String user = ""; // ????????? ????????? ??????('@naver.com'??? ?????? ??? ???)
		final String password = "";// ????????? ????????? ????????????
		int port = 465;
		// ?????? ?????? ??????
		System.out.println("user_email: " + user_email);
		
		// SMTP ?????? ????????? ??????
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");
		
		// ?????? ?????? ????????? ??????
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 10; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		String AuthenticationKey = temp.toString();
		System.out.println("????????? ???????????? : " + AuthenticationKey);
		//???????????? ????????? ???
		
		Session e_session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		// email ??????
		try {
			MimeMessage msg = new MimeMessage(e_session);
			msg.setFrom(new InternetAddress(user + "@naver.com", "OLLE THE JEJU"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(user_email));

			// ?????? ??????
			msg.setSubject("???????????????.  OLLE THE JEJU ?????? ???????????????.");
			// ?????? ??????
			msg.setText("?????? ????????? " + temp + "?????????.");

			Transport.send(msg);
			System.out.println("????????? ?????? ??????");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return AuthenticationKey;
	}
}
