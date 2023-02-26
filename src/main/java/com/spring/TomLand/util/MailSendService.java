package com.spring.TomLand.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.spring.TomLand.command.EmailVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	private int authNum;
	
	// 1.난수 발생: 6자리 설정 / 범위: 111111~999999
	public void makeRandomNumber() {
		
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;

		authNum = checkNum;
		log.info("인증번호 : " + authNum);
	}
	
	// 2.회원가입시 사용자가 받을 이메일 양식(HTML형식)
	public String joinEmail(String email) {
		makeRandomNumber();
		
		String setFrom = "dash841107.kor@gmail.com";
		String toMail = email;
		String title = "TomLand 회원가입 인증 메일 입니다.";
		String content = "회원가입진행을 위하여 아래의 인증번호를 입력해주세요" +
						"<br><br>" +
						"인증 번호는 <h2>" + authNum + "</h2> 입니다." +
						"<br>" +
						"인증번호를 인증번호 확인란에 기입해 주세요.";
		
		mailSend(setFrom, toMail, title, content);
		
		return Integer.toString(authNum);
	}
	
	// 3. 2번의 내용을 채워서 mailSend 진행함
	private void mailSend(String setFrom, String toMail, String title, String content) {
			
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	// 4. UtilController 에서 메일 보내기 서비스
	public void sendSimpleMessage(EmailVO mailVo) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("dash841107.kor@gmail.com");
		message.setTo("zhsks880@naver.com");
		message.setSubject(mailVo.getSubject());
		message.setText(mailVo.getMessage());
		message.setReplyTo(mailVo.getEmail());
		log.info("메일보내기 메세지 내용??" + message);
		mailSender.send(message);
	}
	
}
