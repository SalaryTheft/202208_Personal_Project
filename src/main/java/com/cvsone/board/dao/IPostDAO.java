package com.cvsone.board.dao;

import com.cvsone.board.vo.PostVO;
import com.cvsone.common.vo.SearchVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IPostDAO {
    int insertPost(PostVO postVO);

    int updatePost(PostVO postVO);

    int deletePost(int postNo);

    PostVO getPostByNo(int postNo);

    List<PostVO> getPostList(SearchVO searchVO);

    List<PostVO> getRecentPostList();

    int getPostCount(SearchVO searchVO);

    int increaseHit(PostVO postVO);
}
