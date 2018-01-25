package com.fioms.controller;

import com.common.constant.fiomsConstant;
import com.fioms.bean.SysDmbmDicVO;
import com.fioms.bean.UserVO;
import com.fioms.service.SysDmbmDicService;
import com.fioms.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by peng on 2017/9/24.
 */
@Controller
@RequestMapping("/userManagementController")
public class UserManagementController {
    @Autowired
    private UserService userService;
    @Autowired
    private SysDmbmDicService sysDmbmDicService;

    @RequestMapping(value="/addUser")
    public ModelAndView addUser( ){
        Map<String,Object> map = new HashMap<String, Object>();

        Map<String,Object> param = new HashMap<String, Object>();
        param.put("category","SEX");
        List<SysDmbmDicVO> lst = sysDmbmDicService.findSysDmbmDicByCategory(param);
        map.put("lst",lst);
        return new ModelAndView("/user/addUser",map);
    }

    @RequestMapping(value="/getAllUser")
    @ResponseBody
    public Object getAllUser(){
        Map<String,Object> map = new HashMap<String,Object>();

        List<UserVO> userVOList = userService.findAllUser();

        if(userVOList!=null&&userVOList.size()>0)
            map.put("userVOList",userVOList);

        return map;
    }

    @RequestMapping(value="/addUserInfo")
    @ResponseBody
    public Object addUserInfo(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String,Object>();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String sex = request.getParameter("sex");
        String nation = request.getParameter("nation");
        String phone = request.getParameter("phone");

        Map<String,Object>  param = new HashMap<String,Object>();
        if(StringUtils.isNotBlank(name)){
            param.put("name",name);
        }
        if(StringUtils.isNotBlank(email)){
            param.put("email",email);
        }
        if(StringUtils.isNotBlank(password)){
            param.put("password",password);
        }
        if(StringUtils.isNotBlank(sex)){
            param.put("sex",sex);
        }
        if(StringUtils.isNotBlank(nation)){
            param.put("nation",nation);
        }
        if(StringUtils.isNotBlank(phone)){
            param.put("phone",phone);
        }
        userService.doAddUser(param);

        map.put("statusCode","200");
        map.put("message","操作成功");
        map.put("navTabId","");
        map.put("rel","closeCurrent");
        map.put("forwardUrl","");
        return map;
    }

}
