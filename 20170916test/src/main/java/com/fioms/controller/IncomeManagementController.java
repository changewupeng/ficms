package com.fioms.controller;

import com.common.utils.DateUtils;
import com.fioms.bean.SysDmbmDicVO;
import com.fioms.bean.UserVO;
import com.fioms.service.IncomeInfoService;
import com.fioms.service.SysDmbmDicService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/10/8.
 */
@Controller
@RequestMapping("/incomeManagementController")
public class IncomeManagementController {
    @Autowired
    private SysDmbmDicService sysDmbmDicService;

    @Autowired
    private IncomeInfoService incomeInfoService;

    @RequestMapping(value="/incomeRegisterView")
    public ModelAndView incomeRegisterView( ){
        return new ModelAndView("/income/incomeRegisterView");
    }

    //在支出登记页面 添加或这编辑记录
    @RequestMapping(value="/addOrEditOrDeleteIncomeInfo")
    public ModelAndView addOrEditOrDeleteIncomeInfo(HttpServletRequest request){
        String oper = request.getParameter("oper");
        String url="";
        Map<String,Object> map = new HashMap<String, Object>();
        if(oper.equals("add")){
            Map<String,Object> param = new HashMap<String, Object>();
            param.put("category","INCOME_CATEGORY");
            List<SysDmbmDicVO> incomeCategoryList = sysDmbmDicService.findSysDmbmDicByCategory(param);
            map.put("incomeCategoryList",incomeCategoryList);
            url="/income/incomeAddView";
        }

        return new ModelAndView(url,map);
    }

    @RequestMapping(value = "/saveIncomeInfo")
    public Object saveIncomeInfo(HttpServletRequest request){
        String accountId = request.getParameter("accountId");
        String incomeCategory = request.getParameter("incomeCategory");
        String incomeDate = request.getParameter("incomeDate");
        String money = request.getParameter("money");
        String remark = request.getParameter("remark");

        Map<String,Object> param = new HashMap<String, Object>();
        param.put("accountId",accountId);
        param.put("incomeCategory",incomeCategory);
        param.put("remark",remark);
        param.put("money",Double.parseDouble(money));
        param.put("incomeDate", DateUtils.str2Date(incomeDate,DateUtils.YYYY_MM_DD));

        incomeInfoService.doAddIncomeInfo(param);
        ModelAndView mav = new ModelAndView("ajaxDone");
        mav.addObject("statusCode", "200");
        mav.addObject("message", "插入成功");
        mav.addObject("forwardUrl", "");
        return mav;
    }

    @RequestMapping(value = "/getIncomeInfo")
    public Object getIncomeInfo(HttpServletRequest request,Model result){
        String accountId = request.getParameter("accountId");
        String incomeBeginTime = request.getParameter("incomeBeginTime");
        String incomeEndTime = request.getParameter("incomeEndTime");


        Map<String,Object> param = new HashMap<String, Object>();
        if(StringUtils.isNotBlank(accountId)&&!accountId.equals("accountId_default")){
            param.put("accountId",accountId);
        }
        if(StringUtils.isNotBlank(incomeBeginTime)){
            param.put("incomeBeginTime",DateUtils.str2Date(incomeBeginTime,DateUtils.YYYY_MM_DD));
        }
        if(StringUtils.isNotBlank(incomeEndTime)){
            param.put("incomeEndTime",DateUtils.str2Date(incomeEndTime,DateUtils.YYYY_MM_DD));
        }

        List queryIncomeInfoList = incomeInfoService.findIncomeInfoVOByAccountIAndCostDate(param);
        result.addAttribute("statusCode", "200");
        result.addAttribute("queryIncomeInfoList", queryIncomeInfoList);
        return "/income/incomeRegisterView";
    }
}
