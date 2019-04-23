package com.rex.blog.web;

import com.rex.blog.utils.mail.IMailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("email")
public class EmailController {
    @Autowired
    private IMailServiceImpl mailService;//注入发送邮件的各种实现方法
    @RequestMapping
    @ResponseBody
    public String index(){
        String result = "邮件发送成功!!";
        try {
            mailService.sendSimpleMail("979745322@qq.com","SpringBoot Email","这是一封普通的SpringBoot测试邮件");
        }catch (Exception ex){
            ex.printStackTrace();
            result = "邮件发送失败!!";
            return result;
        }
        return result;
    }

}
