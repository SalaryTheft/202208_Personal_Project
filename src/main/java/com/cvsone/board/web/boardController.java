package com.cvsone.board.web;

import com.cvsone.board.dao.IPostDAO;
import com.cvsone.board.vo.PostVO;
import com.cvsone.comment.dao.IPostCommentDAO;
import com.cvsone.comment.vo.PostCommentVO;
import com.cvsone.comment.vo.PrdCommentVO;
import com.cvsone.common.vo.SearchVO;
import com.cvsone.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class boardController {

    @Inject
    IPostDAO postDAO;

    @Inject
    IPostCommentDAO postCommentDAO;


    // 게시글 목록 조회
    @RequestMapping("/board/list")
    public String boardList(Model model, @ModelAttribute("searchVO") SearchVO searchVO) {
        searchVO.setTotalRows(postDAO.getPostCount(searchVO));
        searchVO.setPages();

        if (searchVO.getPage() < searchVO.getPageSize()) {
            searchVO.setPageSize(4);
        } else if (searchVO.getPage() > searchVO.getTotalPages() - searchVO.getPageSize() + 1) {
            searchVO.setPageSize(4);
            searchVO.setFirstPage(searchVO.getTotalPages() - searchVO.getPageSize());
            searchVO.setLastPage(searchVO.getTotalPages());
        } else {
            searchVO.setPageSize(1);
            searchVO.setPages();
        }

        // 공지사항
        SearchVO noticeSearchVO = new SearchVO();
        noticeSearchVO.setCategory("notice");
        noticeSearchVO.setRowsPerPage(3);
        noticeSearchVO.setTotalRows(postDAO.getPostCount(noticeSearchVO));
        noticeSearchVO.setPages();
        List<PostVO> noticeList = postDAO.getPostList(noticeSearchVO);

        model.addAttribute("postList", postDAO.getPostList(searchVO));
        model.addAttribute("noticeList", noticeList);
        return "board/list";
    }

    // 게시글 상세 페이지
    @GetMapping("/board/{postNo}")
    public String boardDetail(@PathVariable("postNo") int postNo, Model model) {
        PostVO post = postDAO.getPostByNo(postNo);
        if (post == null) {
            return "redirect:/board/list";
        } else {
            postDAO.increaseHit(post);
            post.setPostHit(post.getPostHit() + 1);
        }
        List<PostCommentVO> commentList = postCommentDAO.getCommentList(post);
        model.addAttribute("post", post);
        model.addAttribute("commentList", commentList);
        return "board/detail";
    }

    // 게시글 댓글 작성
    @PostMapping("/board/{postNo}")
    public String boardComment(HttpServletRequest request, @PathVariable("postNo") int postNo, @ModelAttribute("postCommentVO") PostCommentVO comment) {
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        if (user == null) {
            request.setAttribute("msg", "로그인이 필요합니다.");
            request.setAttribute("url", "/login");
            return "alert";
        }
        comment.setUserId(user.getUserId());
        comment.setPostNo(postNo);
        comment.setCommentUuid(java.util.UUID.randomUUID().toString());
        postCommentDAO.insertComment(comment);
        return "redirect:/board/" + postNo + "#comments";
    }

    @PostMapping(value = "/board/comment/update", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String updateComment(HttpServletRequest request, String commentUuid, String commentContent) {
        PostCommentVO comment = postCommentDAO.getCommentByUuid(commentUuid);
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        if (comment == null) {
            return "{\"result\":\"fail\",\"msg\":\"해당 댓글이 없습니다.\"}";
        } else if (comment.getUserId().equals(user.getUserId())) {
            comment.setCommentContent(commentContent);
            int result = postCommentDAO.updateComment(comment);
            if (result == 1) {
                return "{\"result\":\"success\"}";
            } else {
                return "{\"result\":\"fail\",\"msg\":\"댓글 수정에 실패했습니다.\"}";
            }
        } else {
            return "{\"result\":\"fail\",\"msg\":\"본인이 작성한 댓글만 수정할 수 있습니다.\"}";
        }
    }

    @PostMapping(value = "/board/comment/delete", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String deleteComment(HttpServletRequest request, String commentUuid) {
        PostCommentVO comment = postCommentDAO.getCommentByUuid(commentUuid);
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        if (comment == null) {
            return "{\"result\":\"fail\",\"msg\":\"해당 댓글이 없습니다.\"}";
        } else if (comment.getUserId().equals(user.getUserId())) {
            int result = postCommentDAO.deleteComment(comment);
            if (result == 1) {
                return "{\"result\":\"success\"}";
            } else {
                return "{\"result\":\"fail\",\"msg\":\"댓글 삭제에 실패했습니다.\"}";
            }
        } else {
            return "{\"result\":\"fail\",\"msg\":\"본인이 작성한 댓글만 삭제할 수 있습니다.\"}";
        }
    }

    // 게시글 작성
    @RequestMapping("/board/write")
    public String boardWrite(HttpServletRequest request, @ModelAttribute PostVO post) {
        if (request.getMethod().equals("POST")) {
            if (request.getSession().getAttribute("USER") == null) {
                request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
                request.setAttribute("url", "/login");
                return "alert";
            }
            post.setUserId(((UserVO) request.getSession().getAttribute("USER")).getUserId());
            int result = postDAO.insertPost(post);
            if (result == 1) {
                return "redirect:/board/list";
            } else {
                request.setAttribute("msg", "게시글 작성에 실패했습니다.");
                request.setAttribute("url", "/board/write");
                return "alert";
            }
        }
        // GET Method
        if (request.getSession().getAttribute("USER") == null) {
            request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
            request.setAttribute("url", "/login");
            return "alert";
        }
        return "board/edit";
    }

    // 게시글 수정
    @RequestMapping("/board/edit/{postNo}")
    public String boardUpdate(HttpServletRequest request, @PathVariable("postNo") int postNo, @ModelAttribute("post") PostVO post, Model model) {
        if (request.getMethod().equals("POST")) {
            UserVO user = (UserVO) request.getSession().getAttribute("USER");
            if (user == null) {
                request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
                request.setAttribute("url", "/login");
                return "alert";
            } else if (postDAO.getPostByNo(postNo).getUserId().equals(user.getUserId())) {
                post.setUserId(user.getUserId());
                int result = postDAO.updatePost(post);
                if (result == 1) {
                    return "redirect:/board/" + postNo;
                } else {
                    request.setAttribute("msg", "게시글 수정에 실패했습니다.");
                    request.setAttribute("url", "/board/" + postNo);
                    return "alert";
                }
            } else {
                request.setAttribute("msg", "본인이 작성한 게시글만 수정할 수 있습니다.");
                request.setAttribute("url", "/board/" + postNo);
                return "alert";
            }
        }
        // GET Method
        post = postDAO.getPostByNo(postNo);
        if (post == null) {
            return "redirect:/board/list";
        }
        if (request.getSession().getAttribute("USER") == null) {
            request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
            request.setAttribute("url", "/login");
            return "alert";
        } else if (!((UserVO) request.getSession().getAttribute("USER")).getUserId().equals(post.getUserId())) {
            request.setAttribute("msg", "수정 권한이 없습니다.");
            request.setAttribute("url", "/board/" + post.getPostNo());
            return "alert";
        }

        model.addAttribute("post", post);
        return "board/edit";
    }

    // 게시글 삭제
    @GetMapping("/board/delete/{postNo}")
    public String boardDelete(HttpServletRequest request, @PathVariable("postNo") int postNo) {
        if (request.getSession().getAttribute("USER") == null) {
            request.setAttribute("msg", "로그인이 필요한 서비스입니다.");
            request.setAttribute("url", "/login");
            return "alert";
        }
        PostVO post = postDAO.getPostByNo(postNo);
        if (post == null) {
            request.setAttribute("msg", "존재하지 않는 게시글입니다.");
            request.setAttribute("url", "/board/list");
            return "alert";
        }
        if (!((UserVO) request.getSession().getAttribute("USER")).getUserId().equals(post.getUserId())) {
            request.setAttribute("msg", "삭제 권한이 없습니다.");
            request.setAttribute("url", "/board/" + post.getPostNo());
            return "alert";
        }
        int result = postDAO.deletePost(postNo);
        if (result == 1) {
            return "redirect:/board/list";
        } else {
            request.setAttribute("msg", "게시글 삭제에 실패했습니다.");
            request.setAttribute("url", "/board/" + post.getPostNo());
            return "alert";
        }
    }


}
