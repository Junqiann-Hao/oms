package com.nuc.oms.controller;

import com.nuc.oms.entity.User;
import com.nuc.oms.service.UpvoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller("/user")
public class UpvoteController {
    @Autowired
    UpvoteService upvoteService;

    @RequestMapping("/like")
    @ResponseBody
    public Map<String, String> like(Integer uid, Integer mid) {
        HashMap<String, String> map = new HashMap<>();
        boolean like = upvoteService.like(mid, uid);
        if (like) {
            map.put("code", "1");
        } else {
            map.put("code", "0");
        }
        return map;
    }

    @RequestMapping("/unlike")
    @ResponseBody
    public Map<String, String> unlike(Integer uid, Integer mid) {
        HashMap<String, String> map = new HashMap<>();
        boolean like = upvoteService.unlike(mid, uid);
        if (like) {
            map.put("code", "1");
        } else {
            map.put("code", "0");
        }
        return map;
    }

    @RequestMapping("/islike")
    @ResponseBody
    public Map<String, String> islike(Integer mid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        HashMap<String, String> map = new HashMap<>();
        boolean like = upvoteService.islike(mid, user);
        if (like) {
            map.put("code", "1");
        } else {
            map.put("code", "0");
        }
        return map;
    }


}
