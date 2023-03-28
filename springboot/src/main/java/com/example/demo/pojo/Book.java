package com.example.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

@TableName("book")//让mybatis-plus 和数据库表一一对应
@Data
public class Book {

    @TableId(type = IdType.AUTO) //id属性自增
    private Integer id;
    private String name;
    private BigDecimal price;
    private String author;
//    @JsonFormat(pattern = "YYYY-MM-DD",timezone = "GMT-8") //JsonFormat 格式化   GMT-8 中国所在的东八区
    private Date createTime;
    private String cover;
}
