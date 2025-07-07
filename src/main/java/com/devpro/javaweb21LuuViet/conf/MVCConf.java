package com.devpro.javaweb21LuuViet.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * 
 * 1.Báo cho spring mvc biết đây là cấu hình
 * 2.Tạo instance của cấu hình này MVCConf mvc = new MVCConf();
 * mvc sẽ đc lưu vào spring-container
 *
 */
@Configuration


public class MVCConf implements WebMvcConfigurer {
	/**
	 * Sẽ được sử lý trước khi controller nhận được request
	 * classpath: tương đương vợi thư mục src/main/resources
	 */
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		//ERROR: http://localhost:8080/css/styles.css 404
		//bất cứ request nào có dạng: /css/... sẽ vào folder src/main/resource/css
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		//ERROR: http://localhost:8080/css/styles.js 404
		//bất cứ request nào có dạng: /js/... sẽ vào folder src/main/resource/js
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/images/");
		registry.addResourceHandler("/icon/**").addResourceLocations("classpath:/icon/");
		//đăng ký thêm folder up load
		registry.addResourceHandler("/upload/**").addResourceLocations("file:"+"C:/upload/");
	}
	/**
	 * @Bean bao spring biet can tao instance
	 * ViewReslover vr=mvc.viewReslover()
	 * vr se dc luu vao trong spring-container(kieu list,map)
	 * spring mvc su dung vr de biet folder chua view
	 */
	@Bean
	public ViewResolver viewReslover() {
		//Class InternalResourceViewReslover implements ViewReslover
		InternalResourceViewResolver bean =new InternalResourceViewResolver();
		//thiet lap view engine
		bean.setViewClass(JstlView.class);
		//duong dan thu muc chua view
		bean.setPrefix("/WEB-INF/views/");
		//ten duoi view
		bean.setSuffix(".jsp");
		return bean;
	}
	

}
