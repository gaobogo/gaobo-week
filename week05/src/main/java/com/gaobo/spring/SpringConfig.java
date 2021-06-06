package com.gaobo.spring;

import com.gaobo.pojo.Student;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * @Author gaobo
 * @Date 2021/6/6 20:32
 */
@Configuration
@ComponentScan(basePackages = "com.gaobo.pojo")
public class SpringConfig {

    @Bean("stu")
    public Student getStu(){
        return new Student("李四",19);
    }

}
