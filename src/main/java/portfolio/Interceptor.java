package portfolio;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class Interceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		HttpSession session = request.getSession(false); 
		System.out.println(request.getRequestURL());
		if (session == null ) {
			response.sendRedirect("/portfolio/index");
			return false; 
		}
		
		//|| session.getAttribute("loginAdmin")==null
		return true;
	}

}
