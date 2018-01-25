package com.fioms.controller;

import com.fioms.bean.BusinessCardInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by Lenovo on 2017/11/11.
 */
@Controller
@RequestMapping("/personalInfoManagementController")
public class PersonalInfoManagementController {

    @RequestMapping(value="/businessCardView")
    public ModelAndView businessCardView(){
       return new  ModelAndView("/personalinfomanagement/businessCardView");
    }

    @RequestMapping(value = "/businessCardView/getBusinessCardInfo")
    @ResponseBody
    public Object getBusinessCardInfo(HttpServletRequest request,Model result){
        Map<String,Object> res = new HashMap<String,Object>();
        List<Map> list = new ArrayList<Map>();
        BusinessCardInfoVO businessCardInfoVO = new BusinessCardInfoVO();
        businessCardInfoVO.setCardId(UUID.randomUUID().toString().replace("-",""));
        businessCardInfoVO.setName("wupeng");
        businessCardInfoVO.setPosition("经理");
        businessCardInfoVO.setAddress("车陂");
        businessCardInfoVO.setCompany("Tsintergy");
        businessCardInfoVO.setPhoneNum("18302083309");
        Map<String,Object> rows = new HashMap<String,Object>();
        rows.put("Id",businessCardInfoVO.getCardId());
        rows.put("cell",businessCardInfoVO);
        list.add(rows);


        res.put("page",1);
        res.put("total",3);
        res.put("rows",list);

        return res;
    }
}
