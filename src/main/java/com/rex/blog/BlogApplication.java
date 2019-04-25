package com.rex.blog;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.MultipartConfigElement;

@SpringBootApplication
public class BlogApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(BlogApplication.class, args);
    }

    @Override//为了打包springboot项目
    protected SpringApplicationBuilder configure(
            SpringApplicationBuilder builder) {
        return builder.sources(this.getClass());
    }

    @Bean
    MultipartConfigElement multipartConfigElement() { // 设置临时路径
        // 上传地址
//        String path = "C:/Users/rex.li/IdeaProjects/blog/src/main/webapp/uploadImg/";
//        String path = "F:/java/blog/src/main/webapp/uploadImg/";
        // linux地址
        String path = "/usr/local/java/blog/uploadImg/";
        MultipartConfigFactory factory = new MultipartConfigFactory();
        factory.setLocation(path);
        return factory.createMultipartConfig();
    }

    @Configuration
    public class UploadFilePathConfig extends WebMvcConfigurerAdapter {
        // 设置虚拟路径
        @Value("${file.staticAccessPath}")
        private String staticAccessPath;
        @Value("${file.uploadFolder}")
        private String uploadFolder;

        @Override
        public void addResourceHandlers(ResourceHandlerRegistry registry) {
            registry.addResourceHandler(staticAccessPath).addResourceLocations("file:" + uploadFolder);
        }
    }
}
