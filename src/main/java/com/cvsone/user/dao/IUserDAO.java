package com.cvsone.user.dao;

import com.cvsone.user.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IUserDAO {
    UserVO getUserById(String userId);

    int insertUser(UserVO userVO);

    int updateUser(UserVO userVO);

    int deleteUser(String userId);
}
