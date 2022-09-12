package com.cvsone.comment.dao;

import com.cvsone.board.vo.PostVO;
import com.cvsone.comment.vo.PostCommentVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IPostCommentDAO {
    List<PostCommentVO> getCommentList(PostVO post);

    PostCommentVO getCommentByUuid(String uuid);

    int insertComment(PostCommentVO comment);

    int deleteComment(PostCommentVO comment);

    int updateComment(PostCommentVO comment);
}
