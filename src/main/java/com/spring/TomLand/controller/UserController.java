package com.spring.TomLand.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.spring.TomLand.command.CartVO;
import com.spring.TomLand.command.GamjaVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.UserVO;
import com.spring.TomLand.user.service.IUserService;
import com.spring.TomLand.util.MailSendService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	@Autowired
	private MailSendService mailService;
	
	//회원 가입 페이지 이동
	@GetMapping("/userJoin")
	public void userJoin() {
		
	}
	
	//아이디 중복체크 : 비동기
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {

		int result = service.idCheck(userId);
		if(result == 1) {
			return "duplicated";
		} else {
			return "ok";
		}
	}
	
	//이메일 중복 체크 : 비동기
	@ResponseBody
	@GetMapping("/mailCheck")
	public String mailCheck(String email) {
		log.info("인증 받은 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
	//회원 가입
	@PostMapping("/join")
	public String join(@RequestParam("file") MultipartFile file, UserVO vo, RedirectAttributes ra) {

		ra.addFlashAttribute("msg", "join");
		
		service.join(vo, file);
		
		return "redirect:/";
	}
	
	//회원 로그인 : 비동기
	@ResponseBody
	@PostMapping("/login")
	public String login(@RequestBody UserVO vo, HttpSession session, HttpServletResponse response) {

		UserVO dbData = service.login(vo.getUserId());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(dbData != null) {
			if(encoder.matches(vo.getUserPw(), dbData.getUserPw())) {
				session.setAttribute("boardCnt", service.writeCount(vo.getUserId()));
				session.setAttribute("replyCnt", service.replyCount(vo.getUserId()));
				session.setAttribute("imgCnt", service.imgCount(vo.getUserId()));
				session.setAttribute("gamjaCnt", service.gamjaCount(vo.getUserId()));
				session.setAttribute("login", dbData);

				return "loginSuccess";

			} else {
				return "pwFail";
			}
			
		} else {
			return "idFail";
		}
	}
	
	//MyPage 이동
	@GetMapping("/userMypage")
	public void userMypage(HttpSession session, Model model) {
		
		String id = ((UserVO) session.getAttribute("login")).getUserId();
		int userNo = ((UserVO) session.getAttribute("login")).getUserNo();

		List<UserVO> vo = service.getInfo(id);
		List<CartVO> cart = service.getCart(userNo);
				
		model.addAttribute("userInfo", vo);
		model.addAttribute("cart", cart);
	}
	
	//MyPage Profile 보기 요청
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(HttpSession session){
		
		UserVO user = (UserVO) session.getAttribute("login");
				
		File file = new File("c:/test/tomland/" + user.getUserFileLoca() + "/" + user.getUserFileName());
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}
	
	
	//Update
	@PostMapping("/update")
	public String userUpdate(@RequestParam("file") MultipartFile file, UserVO vo, RedirectAttributes ra) {
		
		service.userUpdate(vo, file);
		
		ra.addFlashAttribute("msg", "update");
		return "redirect:/user/userMypage";
	}
	
	
	
	//로그아웃
	@GetMapping("/logOut")
	public String logOut(HttpSession session, RedirectAttributes ra){
		session.invalidate();
		ra.addFlashAttribute("msg", "logout");
		
		return "redirect:/";
	}
	
	//Myorder 이동
	@GetMapping("/userOrder/{gno}")
	public String userOrder(HttpSession session, Model model, @PathVariable int gno) {
		String id = ((UserVO) session.getAttribute("login")).getUserId();

		List<UserVO> vo = service.getInfo(id);
		
		GamjaVO order = service.getOrder(gno);
		
		model.addAttribute("userInfo", vo);
		model.addAttribute("order", order);
		
		return "/user/userOrder";
	}
	
	//findId 이동
	@GetMapping("/findId")
	public void findId() {
		
	}
	
	//이메일 체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public String emailCheck(String userEmail1) {
		
		int result = service.emailCheck(userEmail1);
		if(result == 1) {
			return "duplicatied";
		} else {
			return "ok";
		}
	}
	
	//회원 아이디 찾기
	@ResponseBody
	@PostMapping("/getId")
	public String getUserId(@RequestBody String userEmail1, Model model) {
		
		return service.getUserId(userEmail1);
	}
	
	//findPw 이동
	@GetMapping("/findPw")
	public void findPw() {
		
	}
	
	//비밀번호 찾기 실행
	@PostMapping("/userPwUpdate")
	@ResponseBody
	public String userPwUpdate(@RequestBody UserVO vo) {

		service.userPwUpdate(vo);
		return "modifySuccess";
	}
	
	//회원탈퇴 페이지 이동
	@GetMapping("/userDelete")
	public void userDelete() {
		
	}
	
	//회원탈퇴
	@PostMapping("/delete")
	public String userDelete(String userIdChk, RedirectAttributes ra, HttpSession session) {
				
		service.userDelete(userIdChk);
		session.invalidate();
		ra.addFlashAttribute("msg", "userDel");
		return "redirect:/";
	}
	
	
}
