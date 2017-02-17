package tw.com.crm.info360.webapp.config;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * Spring 4 mvc 初始設定檔
 * @author Billy
 * 
 * 等同web.xml設定檔
 */
public class WebInitializer implements WebApplicationInitializer {

    public void onStartup(ServletContext servletContext) throws ServletException {
        // Create the 'root' Spring application context
        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
        
        /** 
         * register configurations
         * 註冊所需要的設定檔
         */
        //ctx.register(MvcConfig.class,DataSourceConfig.class);
        ctx.register(MvcConfig.class);
        ctx.setServletContext(servletContext);
        
        // Register and map the dispatcher servlet
        Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));
        
        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");
    }

}