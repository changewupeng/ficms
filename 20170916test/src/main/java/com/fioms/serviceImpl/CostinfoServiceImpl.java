package com.fioms.serviceImpl;

import com.common.constant.fiomsConstant;
import com.common.utils.DateUtils;
import com.fioms.bean.CostinfoVO;
import com.fioms.dao.CostinfoDAO;
import com.fioms.service.CostinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/9/29.
 */
@Service("costinfoService")
@Transactional
public class CostinfoServiceImpl implements CostinfoService {
    @Autowired
    private CostinfoDAO costinfoDAO;

    public void doAddCostinfo(Map map){
        CostinfoVO costinfoVO = new CostinfoVO();
        costinfoVO.setCostid(DateUtils.Date2Str(new Date(),"yyyyMMddHHmmss"));
        costinfoVO.setAccountId(map.get("accountId").toString());
        costinfoVO.setCostCategoryCode(map.get("costCategoryCode").toString());
        costinfoVO.setCostSpecificCode(map.get("costSpecificCode").toString());
        costinfoVO.setMoney((Double)map.get("money"));
        costinfoVO.setCostDate((Date)map.get("costDate"));
        costinfoVO.setCostStatus(fiomsConstant.COST_STATUS_NORMAL);
        costinfoVO.setRegisterDate(new Timestamp(System.currentTimeMillis()));
        if(map.get("remark")!=null){
            costinfoVO.setRemark(map.get("remark").toString());
        }

        try {
            costinfoDAO.saveCostinfoVO(costinfoVO);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List findCostinfoVOByAccountIAndCostDate(Map map){
        List list = null;
        try {
            list=costinfoDAO.getCostinfoByDateAndAccountId(map);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public List findCostStatisticsInfoByCategoryCode(Map map){
        List list = null;
        try {
            list=costinfoDAO.queryCostStatisticsInfoByCategoryCode(map);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public List findCostStatisticsInfoBySpecificCode(Map map){
        List list = null;
        try {
            list=costinfoDAO.queryCostStatisticsInfoBySpecificCode(map);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    //查询最近七天的消费情况
    public List findRecentSevenDayCost(Map map){
        List list = null;
        try {
            list=costinfoDAO.queryRecentSevenDayCost(map);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
