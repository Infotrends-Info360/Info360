package tw.com.crm.info360.webapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 基本攔截器（Spring Interceptor）. <br>
 * 
 * @author Billy
 * 
 *         執行順序 preHandle -> postHandle -> afterCompletion
 */
public class BasicInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		long startTime = System.currentTimeMillis();
		System.out.println("Pre Request URL::" + request.getRequestURL().toString() + ":: Start Time="
				+ System.currentTimeMillis());
		request.setAttribute("startTime", startTime);
		// if returned false, we need to make sure 'response' is sent

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("Post Request URL::" + request.getRequestURL().toString()
				+ " Sent to Handler :: Current Time=" + System.currentTimeMillis());
		// we can add attributes in the modelAndView and use that in the view
		// page
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		long startTime = (Long) request.getAttribute("startTime");

		// doSomething
		for (int i = 1; i <= 1000000; i++) {
			Math.random();
		}
		System.out.println("After start Request URL::" + request.getRequestURL().toString() + ":: End Time="
				+ System.currentTimeMillis());
		System.out.println("After end Request URL::" + request.getRequestURL().toString() + ":: Time Taken="
				+ (System.currentTimeMillis() - startTime));
	}

}