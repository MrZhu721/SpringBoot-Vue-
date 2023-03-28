package com.example.demo.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.demo.common.Result;
import com.example.demo.dao.BookDao;
import com.example.demo.pojo.Book;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

//@CrossOrigin(origins = "http://localhost:8080",maxAge = 3600,allowCredentials = "true") //跨域
@RestController
@RequestMapping("/files")
public class FileController {
    @Value("${server.port}")
    private String port;

    private static final String ip="http://localhost";
    //上传文件
    @PostMapping("/upload")
    public Result<?> upload(MultipartFile file) throws IOException {
        String originalFilename = file.getOriginalFilename(); //获取源文件名称
        //UUID,定义唯一标识(前缀)
        String uuid = UUID.randomUUID().toString();
        System.out.println(System.getProperty("user.dir"));
        String rootFilePath= System.getProperty("user.dir") + "/src/main/resources/files/" + uuid + "_" + originalFilename; //获取上传的路径
        FileUtil.writeBytes(file.getBytes(),rootFilePath); //把文件写入到上传的路径

        return Result.success(ip + ":" + port + "/files/" + uuid); //返回结果url
    }

    @GetMapping("/{flag}")
    public void download(@PathVariable String flag, HttpServletResponse response){
        OutputStream io; //创建一个io流
        String basePath= System.getProperty("user.dir") + "/src/main/resources/files/"; //定义文件上传的路径
        List<String> fileNames = FileUtil.listFileNames(basePath); //获取所有文件的名称
        String filenme = fileNames.stream().filter(name -> name.contains(flag)).findAny().orElse("");//找到跟参数一致的文件
        try {
            if(StrUtil.isNotEmpty(filenme)) {

                response.addHeader("Content-Disposition","attachment;filename=" + URLEncoder.encode(filenme,"utf-8"));

            response.setContentType("application/octet-stream");
            byte[] bytes = FileUtil.readBytes(basePath + filenme); //通过文件路径读取文件字节流
            io= response.getOutputStream(); //通过输出流返回文件
            io.write(bytes);
            io.flush();
            io.close();
            }
            } catch (Exception e) {
            System.out.println("文件下载失败");
            }
    }
}
