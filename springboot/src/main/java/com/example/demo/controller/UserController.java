package com.example.demo.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;

import com.example.demo.dao.UserDao;
import com.example.demo.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.sql.Wrapper;

//@CrossOrigin(origins = "http://localhost:9090",maxAge = 3600,allowCredentials = "true") //跨域
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource
    UserDao userDao;

    //@PostMapping 接收前端返回的json数据
    @PostMapping//新增
    public Result<?> save(@RequestBody User user) {//@RequestBody 将json格式转换为java对象
        if(user.getPassword() == null) {
            user.setPassword("123456");
        }
        userDao.insert(user);
        return Result.success();
    }

    @GetMapping//分页查询
    public Result<?> findAll(@RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize,
                             @RequestParam(defaultValue = "") String search) {//@RequestBody 将json格式转换为java对象
        Page page = new Page<>(pageNum, pageSize);
        LambdaQueryWrapper<User> wrapper = Wrappers.<User>lambdaQuery();

        if(StrUtil.isNotBlank(search)) {//isNotBlank不为空就执行动态条件
            wrapper.like(User::getUsername,search);//模糊查询
        }
        Page<User> userPage = userDao.selectPage(page,wrapper);
        return Result.success(userPage);
    }

    @GetMapping("/{id}")
    public Result<?> findById(@PathVariable("id") Integer id) {
        User user = userDao.selectById(id);
        return Result.success(user);
    }

    @PutMapping//修改
    public Result<?> update(@RequestBody User user) {//@RequestBody 将json格式转换为java对象
        userDao.updateById(user);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable("id") long id) {//@RequestBody 将json格式转换为java对象
        userDao.deleteById(id);
        return Result.success();
    }

    @PostMapping("/login")
    public Result<?> login(@RequestBody User user) {//@RequestBody 将json格式转换为java对象
        LambdaQueryWrapper<User> wrapper = Wrappers.<User>lambdaQuery();
        //用工具将传过来的数据进行判断
        User res = userDao.selectOne(wrapper.eq(User::getUsername, user.getUsername()).eq(User::getPassword, user.getPassword()));
        if(res == null) {
            return Result.error("1","用户名或密码错误");
        }
        return Result.success(res);
    }

    @PostMapping("/register")
    public Result<?> register(@RequestBody User user) {//@RequestBody 将json格式转换为java对象
        LambdaQueryWrapper<User> wrapper = Wrappers.<User>lambdaQuery();
        //用工具将传过来的数据进行判断
        User res = userDao.selectOne(wrapper.eq(User::getUsername, user.getUsername()));
        if(res != null) {
            return Result.error("1","用户名已存在,请重新填写");
        }else {
            userDao.insert(user);
        }
        return Result.success();
    }
}
