package com.gaobo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * @Author gaobo
 * @Date 2021/6/6 20:22
 */
@Component("tea")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Teacher {

    private int age = 22;
    private String name = "lili";

}
