package com.example.demo.common;


import lombok.Data;

/**
 *
 */
//前后端数据统一协议
@Data
public class Result<T> {

    /**
     * 状态码
     */
    private String code;
    private String message;
    private T data;

    public Result() {
    }

    public Result(T data) {
        this.data = data;
    }

    public static Result success() {
        Result result = new Result<>();
        result.setCode("0");
        result.setMessage("成功");
        return result;
    }

    public static <T> Result<T> success(T data) {
        Result<T> result = new Result<>(data);
        result.setCode("0");
        result.setMessage("成功");
        return result;
    }

    public static Result error(String code,String message) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }
}

