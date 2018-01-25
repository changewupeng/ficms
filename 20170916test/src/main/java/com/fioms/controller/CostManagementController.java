package com.fioms.controller;

import com.common.utils.DateUtils;
import com.fioms.bean.CostinfoVO;
import com.fioms.bean.SysDmbmDicVO;
import com.fioms.bean.UserVO;
import com.fioms.service.CostinfoService;
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
import java.util.*;

/**
 * Created by Lenovo on 2017/9/28.
 */

@Controller
@RequestMapping("/costManagementController")
public class CostManagementController {
    @Autowired
    private UserService userService;
    @Autowired
    private SysDmbmDicService sysDmbmDicService;

    @Autowired
    private CostinfoService costinfoService;

    @RequestMapping(value="/costRegisterView")
    public ModelAndView costRegisterView( ){
        Map<String,Object> map = new HashMap<String, Object>();
        Map<String,Object> param = new HashMap<String, Object>();
        List<UserVO> costManList = userService.findAllUser();
        map.put("costManList",costManList);
        return new ModelAndView("/cost/costRegisterView",map);
    }

    //跳转到支出统计界面
    @RequestMapping(value="/costStatisticsView")
    public ModelAndView costStatisticsView( ){
        return new ModelAndView("/cost/costStatisticsView");
    }


    //在支出登记页面 添加或这编辑记录
    @RequestMapping(value="/addOrEditOrDeleteCostInfo")
    public ModelAndView addOrEditOrDeleteCostInfo(HttpServletRequest request){
        String oper = request.getParameter("oper");
        String url="";
        Map<String,Object> map = new HashMap<String, Object>();
        if(oper.equals("add")){
            url="/cost/costAddView";
            List<UserVO> costManList = userService.findAllUser();

            Map<String,Object> param = new HashMap<String, Object>();
            param.put("category","COST_CATEGORY");
            List<SysDmbmDicVO> costCategoryList = sysDmbmDicService.findSysDmbmDicByCategory(param);
            map.put("costManList",costManList);
            map.put("costCategoryList",costCategoryList);
        }

        return new ModelAndView(url,map);
    }

    @RequestMapping(value = "/getCostSpecificList")
    @ResponseBody
    public Object getCostSpecificList(HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        String parentId = request.getParameter("parentId");
        if(StringUtils.isNotBlank(parentId)){
            Map<String,Object> param = new HashMap<String, Object>();
            param.put("category","COST_SPECIFIC");
            param.put("parentId",parentId);
            List<SysDmbmDicVO> costSpecificList = sysDmbmDicService.findSysDmbmDicByCategoryAndParentId(param);
            map.put("list",costSpecificList);

        }
        return map;
    }

    @RequestMapping(value = "/saveCostInfo")
    public Object saveCostInfo(HttpServletRequest request){
        String accountId = request.getParameter("costMan");
        String costCategoryCode = request.getParameter("costCateGory");
        String costSpecificCode = request.getParameter("costAdd_costSpecific");
        String costDate = request.getParameter("costDate");
        String money = request.getParameter("money");
        String remark = request.getParameter("remark");
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("accountId",accountId);
        param.put("costCategoryCode",costCategoryCode);
        param.put("costSpecificCode",costSpecificCode);
        param.put("money",Double.parseDouble(money));
        param.put("costDate", DateUtils.str2Date(costDate,DateUtils.YYYY_MM_DD));
        if(StringUtils.isNotBlank(remark)){
            param.put("remark",remark);
        }
        costinfoService.doAddCostinfo(param);

        ModelAndView mav = new ModelAndView("ajaxDone");
        mav.addObject("statusCode", "200");
        mav.addObject("message", "插入成功");
        mav.addObject("forwardUrl", "");
        return mav;
    }

    @RequestMapping(value = "/getCostInfo")
    public Object getCostInfo(HttpServletRequest request,Model result){
        String accountId = request.getParameter("accountId");
        String registerBeginTime = request.getParameter("registerBeginTime");
        String registerEndTime = request.getParameter("registerEndTime");


        Map<String,Object> param = new HashMap<String, Object>();
        if(StringUtils.isNotBlank(accountId)){
            param.put("accountId",accountId);
        }
        if(StringUtils.isNotBlank(registerBeginTime)){
            param.put("beginDate",DateUtils.str2Date(registerBeginTime,DateUtils.YYYY_MM_DD));
        }
        if(StringUtils.isNotBlank(registerEndTime)){
            param.put("endDate",DateUtils.str2Date(registerEndTime,DateUtils.YYYY_MM_DD));
        }

        List queryCostinfoList = costinfoService.findCostinfoVOByAccountIAndCostDate(param);
        List<UserVO> costManList = userService.findAllUser();
        result.addAttribute("statusCode", "200");
        result.addAttribute("queryCostinfoList", queryCostinfoList);
        result.addAttribute("costManList", costManList);
        return "/cost/costRegisterView";
    }

    @RequestMapping(value = "/getCostStatisticsInfo")
    @ResponseBody
    public Object getCostStatisticsInfo(HttpServletRequest request){
        String accountId = request.getParameter("accountId");
        String registerBeginTime = request.getParameter("registerBeginTime");
        String registerEndTime = request.getParameter("registerEndTime");

        Map<String,Object> param = new HashMap<String, Object>();
        if(StringUtils.isNotBlank(accountId)&&!accountId.equals("accountId_default")){
            param.put("accountId",accountId);
        }
        if(StringUtils.isNotBlank(registerBeginTime)){
            param.put("beginDate",DateUtils.str2Date(registerBeginTime,DateUtils.YYYY_MM_DD));
        }
        if(StringUtils.isNotBlank(registerEndTime)){
            param.put("endDate",DateUtils.str2Date(registerEndTime,DateUtils.YYYY_MM_DD));
        }
        Map<String,Object> res = new HashMap<String, Object>();
        List costStatisticsInfoByCategoryCodeList = costinfoService.findCostStatisticsInfoByCategoryCode(param);
        List costStatisticsInfoBypecificCodeList = costinfoService.findCostStatisticsInfoBySpecificCode(param);
        List costStatisticsInfoRecentSevenDayList = costinfoService.findRecentSevenDayCost(param);

        res.put("costStatisticsInfoByCategoryCodeList",costStatisticsInfoByCategoryCodeList);
        res.put("costStatisticsInfoBySpecificCodeList",costStatisticsInfoBypecificCodeList);
        res.put("costStatisticsInfoRecentSevenDayList",costStatisticsInfoRecentSevenDayList);
        return res;
    }

}
