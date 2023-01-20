package com.spring.TomLand.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.TomLand.command.UserVO;

public class UserDeleteSuccessHandler implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String newId = request.getParameter("userIdChk");
		UserVO vo = (UserVO) session.getAttribute("login");

		if(!vo.getUserId().equals(newId)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script> \r\n");
			out.print("alert('사용중인 ID가 아닙니다.'); \r\n");
			out.print("history.back(); \r\n");
			out.print("</script> \r\n");
			out.flush();
			return false;
		}
		
		return true;
	}
	
	
}
