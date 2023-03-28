package com.example.demo.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.dao.BookDao;
import com.example.demo.pojo.Book;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

//@CrossOrigin(origins = "http://localhost:9090",maxAge = 3600,allowCredentials = "true") //跨域
@RestController
@RequestMapping("/book")
public class BookController {
    @Resource
    BookDao BookDao;

    //@PostMapping 接收前端返回的json数据
    @PostMapping//新增
    public Result<?> save(@RequestBody Book book) {//@RequestBody 将json格式转换为java对象
        BookDao.insert(book);
        return Result.success();
    }

    @GetMapping//分页查询
    public Result<?> findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "5") Integer pageSize,
                             @RequestParam(defaultValue = "") String search) {//@RequestBody 将json格式转换为java对象
        Page page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<Book> wrapper = Wrappers.<Book>lambdaQuery();

        if(StrUtil.isNotBlank(search)) {//isNotBlank不为空就执行动态条件
            wrapper.like(Book::getName,search);//模糊查询
        }
        Page<Book> BookPage = BookDao.selectPage(page,wrapper);
        return Result.success(BookPage);
    }

    @PutMapping//修改
    public Result<?> update(@RequestBody Book book) {//@RequestBody 将json格式转换为java对象
        BookDao.updateById(book);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable("id") long id) {//@RequestBody 将json格式转换为java对象
        BookDao.deleteById(id);
        return Result.success();
    }
}
