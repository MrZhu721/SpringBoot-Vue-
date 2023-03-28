package com.example.demo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.demo.pojo.User;
import org.apache.ibatis.annotations.Insert;

//mybatis-plus的CRUD接口
public interface UserDao extends BaseMapper<User> {

}
