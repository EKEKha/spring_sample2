package com.web.user.main;


import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    private static final Logger logger= LoggerFactory.getLogger(MainController.class);



    @RequestMapping("/main.do")
    public String main(){


        return "home";
    }
}
