package com.example.demo.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.dao.BookShelfDao;
import com.example.demo.pojo.Book;
import com.example.demo.pojo.BookShelf;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/bookShelf")
public class BookShelfController {
    @Resource
    BookShelfDao bookShelfDao;

    //@PostMapping 接收前端返回的json数据
    @PostMapping//新增
    public Result<?> save(@RequestBody BookShelf bookShelf) {//@RequestBody 将json格式转换为java对象
        System.out.println(bookShelf);
        int add = bookShelfDao.insert(bookShelf);
        if(add == 1) {
            return Result.success();
        }
        return null;
    }

    @GetMapping//分页查询
    public Result<?> findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             @RequestParam(defaultValue = "") String search) {//@RequestBody 将json格式转换为java对象
        Page page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<BookShelf> wrapper = Wrappers.<BookShelf>lambdaQuery();

        if(StrUtil.isNotBlank(search)) {//isNotBlank不为空就执行动态条件
            wrapper.like(BookShelf::getBName,search);//模糊查询
        }
        Page<BookShelf> BookPage = bookShelfDao.selectPage(page,wrapper);
        return Result.success(BookPage);
    }
}