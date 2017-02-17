package tw.com.crm.info360.webapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import tw.com.crm.info360.webapp.interceptor.BasicInterceptor;
import tw.com.crm.info360.webapp.interceptor.PatternInterceptor;


/**
 * 
 * @author Billy
 * replace  dispatcher-servlet.xml
 */
@Configuration
// Marks this class as configuration
// Specifies which package to scan
@ComponentScan(basePackages="tw.com.crm.info360.webapp.controller")
// Enables Spring's annotations
@EnableWebMvc
public class MvcConfig extends WebMvcConfigurerAdapter{  
    
    /**
     * The caveat of mapping DispatcherServlet to “/” is that by default 
     * it breaks the ability to serve static resources like images and CSS files.
     * To remedy this, I need to configure Spring MVC to enable defaultServletHandling.
     * 
     * http://zeroturnaround.com/rebellabs/your-next-java-web-app-less-xml-no-long-restarts-fewer-hassles-part-1/ 
     */
//    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
//        configurer.enable();
//    }

	// 載入檔案設定
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations(
                "/resources/");
    }
    
    // 導頁設定
    @Bean
    public ViewResolver setupViewResolver() {
        InternalResourceViewResolver  resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        
        return resolver;
    }
    
    // 攔截器設定
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	/**
    	 *  執行順序：
    	 *  basic(pre) -> pattern(pre) -> pattern(post)
    	 *   -> basic(pre) -> basic(after) -> patter(after)
    	 */
        registry.addInterceptor(new BasicInterceptor());
        registry.addInterceptor(new PatternInterceptor()).addPathPatterns("/hello");
    }
    
}