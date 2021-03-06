package com.nuc.oms.controller;

import com.nuc.oms.entity.User;
import com.nuc.oms.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    Logger log = LoggerFactory.getLogger(LoginController.class);
    @Autowired
    UserService userService;

    @RequestMapping("/{page}")
    public String nnnnn(@PathVariable String page) {
        log.info("访问" + page);
        return page;
    }

    @RequestMapping("/dologin")
    public ModelAndView login(User user, HttpSession session) {
        log.info("登录");
        ModelAndView modelAndView;
        User login = userService.login(user);
        if(login!=null){
            modelAndView= new ModelAndView("redirect:/firstpageRequest");
            session.setAttribute("user", login);
        }
        else{
            modelAndView=new ModelAndView("login");
            modelAndView.addObject("error","用户名或密码错误");

        }
        return modelAndView;
    }

    @RequestMapping("/register")
    public ModelAndView register(User user) {
        ModelAndView modelAndView = new ModelAndView();
        log.info("注册");
        Map<String, String> map = new HashMap<>();
        User register = userService.register(user);
        if (register != null) {
            modelAndView.setViewName("login");
        } else {
            modelAndView.setViewName("regist");
            modelAndView.addObject("error", "账号已存在");
        }
        return modelAndView;
    }

    @RequestMapping("/exit")
    public ModelAndView exit(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("redirect:/firstpageRequest");
        session.setAttribute("user", null);
        return modelAndView;
    }
}
