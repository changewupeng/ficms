package com.fioms.service;

import com.fioms.bean.CostinfoVO;

import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/9/29.
 */
public interface CostinfoService {
    void doAddCostinfo(Map map);

    List findCostinfoVOByAccountIAndCostDate(Map map);

    List findCostStatisticsInfoByCategoryCode(Map map);

    List findCostStatisticsInfoBySpecificCode(Map map);

    List findRecentSevenDayCost(Map map);
}
