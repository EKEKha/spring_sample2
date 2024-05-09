package com.web.user.board;


import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;
import com.web.user.board.service.BoardService;
import com.web.vo.BoardVO;
import com.webjjang.util.PageObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BoardController {

    private static final Logger logger= LoggerFactory.getLogger(BoardController.class);

    @Resource
    private BoardService boardServiceImpl;

    @RequestMapping("/board/list.do")
    public String list(HttpServletRequest request, BoardVO boardVO, ModelMap model, PageObject pageObject) throws Exception {

        List list = boardServiceImpl.list(pageObject);
        model.addAttribute("list", list);
        model.addAttribute("pageObject", pageObject);

//        List list = boardServiceImpl.list(boardVO);
//        int count = boardServiceImpl.count(boardVO);
//
//
//
//        model.addAttribute("list",list);
//        model.addAttribute("count",count);

        return "board/list";
    }

    @RequestMapping("/board/write.do")
    public String write(HttpServletRequest request, BoardVO boardVO, ModelMap model) throws Exception {



//        List list = boardServiceImpl.list(boardVO);
//        int count = boardServiceImpl.count(boardVO);
//
//
//
//        model.addAttribute("list",list);
//        model.addAttribute("count",count);

        return "board/write";
    }



    @RequestMapping("/board/save.do")
    public String save(HttpServletRequest request, BoardVO boardVO) throws Exception {


        boardServiceImpl.write(boardVO);


        return "redirect:/board/list.do";
    }
}
