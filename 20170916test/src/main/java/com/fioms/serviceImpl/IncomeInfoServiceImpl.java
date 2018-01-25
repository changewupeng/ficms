package com.fioms.serviceImpl;

import com.common.utils.DateUtils;
import com.fioms.bean.IncomeInfoVO;
import com.fioms.dao.IncomeInfoDAO;
import com.fioms.service.IncomeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/10/9.
 */
@Service("incomeInfoService")
@Transactional
public class IncomeInfoServiceImpl implements IncomeInfoService {
    @Autowired
    private IncomeInfoDAO incomeInfoDAO;

    public void doAddIncomeInfo(Map map){
        IncomeInfoVO incomeInfoVO = new IncomeInfoVO();

        incomeInfoVO.setLsh(DateUtils.Date2Str(new Date(), "yyyyMMddHHmmss"));
        incomeInfoVO.setAccountId(map.get("accountId").toString());
        incomeInfoVO.setIncomeCategory(map.get("incomeCategory").toString());
        incomeInfoVO.setIncomeDate((Date)map.get("incomeDate"));
        incomeInfoVO.setMoney((Double)map.get("money"));
        if(map.get("remark")!=null){
            incomeInfoVO.setRemark(map.get("remark").toString());
        }

        incomeInfoVO.setRegisterDate(new Timestamp(System.currentTimeMillis()));

        try{
            incomeInfoDAO.saveIncomeInfoVO(incomeInfoVO);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public List findIncomeInfoVOByAccountIAndCostDate(Map map){
        List list = null;
        try {
            list=incomeInfoDAO.getIncomeInfoByDateAndAccountId(map);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
