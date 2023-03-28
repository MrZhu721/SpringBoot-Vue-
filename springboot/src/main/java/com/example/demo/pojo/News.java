package com.example.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@TableName("news")//让mybatis-plus 和数据库表一一对应
@Data
public class News {

    @TableId(type = IdType.AUTO) //id属性自增
    private Integer id;
    private String title;
    private String content;
    private String author;
//    @JsonFormat(pattern = "YYYY-MM-DD",timezone = "GMT-8") //JsonFormat 格式化   GMT-8 中国所在的东八区
    private Date time;
}
