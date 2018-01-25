package com.fioms.service;

import com.fioms.bean.UserVO;

import java.util.List;
import java.util.Map;

/**
 * Created by peng on 2017/9/24.
 */
public interface UserService {
    List<UserVO> findAllUser();

    void doAddUser(Map map);
}
