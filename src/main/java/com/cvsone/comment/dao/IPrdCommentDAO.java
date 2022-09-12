package com.cvsone.comment.dao;

import com.cvsone.comment.vo.PrdCommentVO;
import com.cvsone.product.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IPrdCommentDAO {
    List<PrdCommentVO> getCommentList(ProductVO productVO);

    int insertComment(PrdCommentVO prdCommentVO);

    PrdCommentVO getCommentByUuid(String uuid);

    int deleteCommentByUuid(String uuid);

    int updateComment(PrdCommentVO prdCommentVO);

    List<PrdCommentVO> getRecentCommentList();
}
