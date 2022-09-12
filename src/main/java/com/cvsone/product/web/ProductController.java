package com.cvsone.product.web;

import com.cvsone.comment.dao.IPrdCommentDAO;
import com.cvsone.comment.vo.PrdCommentVO;
import com.cvsone.common.vo.SearchVO;
import com.cvsone.product.dao.IProductDAO;
import com.cvsone.product.vo.ProductVO;
import com.cvsone.user.vo.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

@Controller
public class ProductController {

    @Inject
    IProductDAO productDAO;

    @Inject
    IPrdCommentDAO prdCommentDAO;

    // 상품 목록 조회
    @RequestMapping("/product/list")
    public String productList(Model model, @ModelAttribute("searchVO")SearchVO searchVO) {
        searchVO.setRowsPerPage(12); // 상품 목록은 3x4로 표시
        searchVO.setTotalRows(productDAO.getProductCount(searchVO));
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

        List<ProductVO> productList = productDAO.getProductList(searchVO);
        model.addAttribute("productList", productList);
        return "product/list";
    }

    @GetMapping("/product/infinite_list")
    public String productInfiniteList(){
        return "product/infinite_list";
    }

    @RequestMapping("/product/infinite_list_ajax")
    public String productInfiniteListAjax(Model model, String page) {
        SearchVO searchVO = new SearchVO();
        searchVO.setRowsPerPage(12); // 상품 목록은 3x4로 표시
        searchVO.setPage(Integer.parseInt(page));
        searchVO.setTotalRows(productDAO.getProductCount(searchVO));
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

        List<ProductVO> productList = productDAO.getProductList(searchVO);
        model.addAttribute("productList", productList);
        return "product/infinite_list_ajax";
    }

    // 상품 상세 페이지
    @GetMapping("/product/{prdName:.+}")
    public String productDetail(@PathVariable("prdName") String prdName, Model model) throws UnsupportedEncodingException {
        ProductVO product = productDAO.getProductByName(URLDecoder.decode(prdName, "UTF-8"));
        if (product == null) return "redirect:/product/list";
        List<PrdCommentVO> commentList = prdCommentDAO.getCommentList(product);
        model.addAttribute("prd", product);
        model.addAttribute("commentList", commentList);
        return "product/detail";
    }
    
    // 댓글 작성
    @PostMapping("/product/{prdName:.+}")
    public String productInsertComment(HttpServletRequest request, @PathVariable("prdName") String prdName, String commentContent) throws UnsupportedEncodingException {
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        if (user == null) return "redirect:/login";
        PrdCommentVO comment = new PrdCommentVO(user.getUserId(), commentContent, prdName);
        comment.setCommentUuid(UUID.randomUUID().toString());
        prdCommentDAO.insertComment(comment);
        return "redirect:/product/" + URLEncoder.encode(prdName, "UTF-8");
    }

    // 댓글 삭제
    @PostMapping(value = "/product/comment/delete", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String productDeleteComment(HttpServletRequest request, String commentUuid) {
        PrdCommentVO comment = prdCommentDAO.getCommentByUuid(commentUuid);
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        request.setAttribute("url", request.getHeader("Referer"));
        if (comment == null) {
            return "{\"result\":\"fail\",\"msg\":\"해당 댓글이 존재하지 않습니다.\"}";
        } else if (comment.getUserId().equals(user.getUserId())) {
            int result = prdCommentDAO.deleteCommentByUuid(commentUuid);
            if (result == 1) {
                return "{\"result\":\"success\"}";
            } else {
                return "{\"result\":\"fail\",\"msg\":\"삭제 실패\"}";
            }
        } else {
            return "{\"result\":\"fail\",\"msg\":\"삭제 권한이 없습니다.\"}";
        }
    }

    // 댓글 수정
    @PostMapping(value = "/product/comment/update", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String productUpdateComment(HttpServletRequest request, String commentUuid, String commentContent) {
        PrdCommentVO comment = prdCommentDAO.getCommentByUuid(commentUuid);
        UserVO user = (UserVO) request.getSession().getAttribute("USER");
        if (comment == null) {
            return "{\"result\":\"fail\",\"msg\":\"해당 댓글이 없습니다.\"}";
        } else if (comment.getUserId().equals(user.getUserId())) {
            comment.setCommentContent(commentContent);
            int result = prdCommentDAO.updateComment(comment);
            if (result == 1) {
                return "{\"result\":\"success\"}";
            } else {
                return "{\"result\":\"fail\",\"msg\":\"댓글 수정에 실패했습니다.\"}";
            }
        } else {
            return "{\"result\":\"fail\",\"msg\":\"수정할 권한이 없습니다.\"}";
        }
    }

}
