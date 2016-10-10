package com.softech.elearning.presentation.controllers;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import com.softech.elearning.business.services.ExamService;
import com.softech.elearning.business.servicesimpl.ExamServiceImpl;
import com.softech.elearning.data.dao.ExamDao;

@Service("customAuthenticationSuccessHandler")
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session = request.getSession();

		// Set some session variables
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String userId = SecurityContextHolder.getContext().getAuthentication().getName();
		session.setAttribute("authorities", authentication.getAuthorities());

		// Set target URL to redirect
		/*String targetUrl = determineTargetUrl(authentication);*/
		if (userId.contains("TCH")) {
			session.setAttribute("myRole", "Teacher");
		} else {
			session.setAttribute("myRole", "Student");
		}
		redirectStrategy.sendRedirect(request, response, "/dashboard");
	}

	protected String determineTargetUrl(Authentication authentication) {
		Set<String> authorities = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		if (authorities.contains("ROLE_ADMIN")) {
			return "/dashboard";
		} else if (authorities.contains("ROLE_USER")) {
			return "/user.htm";
		} else {
			throw new IllegalStateException();
		}
	}

	public RedirectStrategy getRedirectStrategy() {
		return redirectStrategy;
	}

	public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
		this.redirectStrategy = redirectStrategy;
	}
}
