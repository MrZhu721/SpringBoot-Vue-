package com.example.demo.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.dao.NewsDao;
import com.example.demo.pojo.News;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;

//@CrossOrigin(origins = "http://localhost:9090",maxAge = 3600,allowCredentials = "true") //跨域
@RestController
@RequestMapping("/news")
public class NewsController {
    @Resource
    NewsDao newsDao;

    //@PostMapping 接收前端返回的json数据
    @PostMapping//新增
    public Result<?> save(@RequestBody News news) {//@RequestBody 将json格式转换为java对象
        news.setTime(new Date());
        newsDao.insert(news);
        return Result.success();
    }

    @GetMapping//分页查询
    public Result<?> findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize,
                             @RequestParam(defaultValue = "") String search) {//@RequestBody 将json格式转换为java对象
        Page page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<News> wrapper = Wrappers.<News>lambdaQuery();

        if(StrUtil.isNotBlank(search)) {//isNotBlank不为空就执行动态条件
            wrapper.like(News::getTitle,search);//模糊查询
        }
        Page<News> NewsPage = newsDao.selectPage(page,wrapper);
        return Result.success(NewsPage);
    }

    @PutMapping//修改
    public Result<?> update(@RequestBody News news) {//@RequestBody 将json格式转换为java对象
        news.setTime(new Date());
        newsDao.updateById(news);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable("id") long id) {//@RequestBody 将json格式转换为java对象
        newsDao.deleteById(id);
        return Result.success();
    }
}
