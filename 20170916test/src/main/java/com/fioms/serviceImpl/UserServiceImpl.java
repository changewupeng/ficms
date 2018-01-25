package com.fioms.serviceImpl;

import com.common.constant.fiomsConstant;
import com.fioms.bean.AccountinfoVO;
import com.fioms.bean.UserVO;
import com.fioms.dao.AccountinfoDAO;
import com.fioms.dao.UserDAO;
import com.fioms.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;


/**
 * Created by peng on 2017/9/24.
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    private static Logger logger = Logger.getLogger(UserServiceImpl.class);
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private AccountinfoDAO accountinfoDAO;

    public List<UserVO> findAllUser(){
        List<UserVO> userVOList=null;
        try{
            userVOList = userDAO.getUserAll();

        }catch (Exception e){
            logger.error("查询所有人员信息出错"+e.getMessage());
            e.printStackTrace();
        }
        return userVOList;
    }


    public void doAddUser(Map map){
        UserVO userVO = new UserVO();
        AccountinfoVO accountinfoVO = new AccountinfoVO();
        if(map.get("name")!=null){
            userVO.setUserName(map.get("name").toString());
        }
        if(map.get("phone")!=null){
            userVO.setPhone(map.get("phone").toString());
        }
        if(map.get("sex")!=null){
            userVO.setSex(map.get("sex").toString());
        }
        if(map.get("nation")!=null){
            userVO.setNation(map.get("nation").toString());
        }
        userVO.setCreateDate(new Date());
        userVO.setModifyDate(userVO.getCreateDate());

        if(map.get("email")!=null){
            accountinfoVO.setAccount(map.get("email").toString());
        }

        if(map.get("password")!=null){
            accountinfoVO.setPassWord(map.get("password").toString());
        }
        accountinfoVO.setAccountStatus(fiomsConstant.ACCOUNT_STATUS_WAIT_ACTIVE);
        accountinfoVO.setCreateDate(userVO.getCreateDate());
        accountinfoVO.setModifyDate(userVO.getCreateDate());

        try{
            userDAO.addUser(userVO);
            accountinfoVO.setAccountId(userVO.getAccountId());
            accountinfoDAO.addAccountinfo(accountinfoVO);
        }catch (Exception e){
            logger.error("添加人员信息出错"+e.getMessage());
            e.printStackTrace();
        }


    }
}
