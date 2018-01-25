package com.fioms.service;

import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/10/9.
 */
public interface IncomeInfoService {
    void doAddIncomeInfo(Map map);

    List findIncomeInfoVOByAccountIAndCostDate(Map map);
}
