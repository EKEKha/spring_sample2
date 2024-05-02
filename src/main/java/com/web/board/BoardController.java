package com.web.board;


import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;
import com.web.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class BoardController {

    private static final Logger logger= LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private BoardService boardServiceImpl;

    @RequestMapping("/boardWrite.do")
    public String save(HttpServletRequest request) throws Exception {


        Map param= new HashMap();


        String nttSj = request.getParameter("NTT_SJ");
        param.put("NTT_SJ",nttSj);

        String nttCn = request.getHeader("NTT_CN");
        param.put("NTT_CN",nttCn);
        boardServiceImpl.write(param);


        return "redirect:/main.do";
    }
}
