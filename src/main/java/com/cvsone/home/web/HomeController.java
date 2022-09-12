package com.cvsone.home.web;

import com.cvsone.board.dao.IPostDAO;
import com.cvsone.board.vo.PostVO;
import com.cvsone.comment.dao.IPrdCommentDAO;
import com.cvsone.comment.vo.PrdCommentVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.inject.Inject;
import java.util.List;

@Controller
public class HomeController {

    @Inject
    IPrdCommentDAO prdCommentDAO;

    @Inject
    IPostDAO postDAO;

    @GetMapping("/")
    public String index(Model model) {
        List<PrdCommentVO> recentComments = prdCommentDAO.getRecentCommentList();
        List<PostVO> recentPosts = postDAO.getRecentPostList();
        model.addAttribute("recentComments", recentComments);
        model.addAttribute("recentPosts", recentPosts);
        return "index";
    }

    @GetMapping("/map")
    public String map() {
        return "product/map";
    }

    @GetMapping("/error/{code}")
    public String errorPage(@PathVariable("code") int code, Model model) {
        model.addAttribute("code", code);
        return "error";
    }


}
