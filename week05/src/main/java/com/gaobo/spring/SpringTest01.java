package com.gaobo.spring;

import com.gaobo.pojo.Student;
import com.gaobo.pojo.Teacher;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


/**
 * @Author gaobo
 * @Date 2021/6/6 20:11
 *
 * Spring Bean 的装配
 */
public class SpringTest01 {


    @Test
    public void test01() {
        ApplicationContext act = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        Student student = (Student)act.getBean("student");
        System.out.println(student);
    }

    @Test
    public void test02() {
        ApplicationContext act = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        Teacher tea = (Teacher) act.getBean("tea");
        System.out.println(tea);
    }

    @Test
    public void test03() {
        ApplicationContext act = new AnnotationConfigApplicationContext(SpringConfig.class);
        Student stu = (Student)act.getBean("stu");
        System.out.println(stu);
    }

}
