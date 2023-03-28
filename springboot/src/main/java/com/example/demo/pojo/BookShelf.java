package com.example.demo.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;

@Data
@TableName("bookshelf")
public class BookShelf {

    @TableId(type = IdType.AUTO) //id属性自增
    private Integer id;
    private String bName;
    private BigDecimal bPrice;
    private String bAuthor;
    private String bCover;
    private Integer uId;
}