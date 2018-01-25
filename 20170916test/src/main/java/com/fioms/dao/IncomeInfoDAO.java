package com.fioms.dao;

import com.fioms.bean.IncomeInfoVO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/10/9.
 */
@Repository("incomeInfoDAO")
public class IncomeInfoDAO {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public void saveIncomeInfoVO(IncomeInfoVO incomeInfoVO) throws Exception {
        this.getCurrentSession().save(incomeInfoVO);
    }

    public List getIncomeInfoByDateAndAccountId(Map map){
        StringBuffer hql = new StringBuffer();
        hql.append("select c.lsh,");
        hql.append("  (select u.username from user u where u.account_id=c.account_id) as username,");
        hql.append("  ficms.fnc_gecs_get_item_name('INCOME_CATEGORY',c.income_category) as income_category,");
        hql.append("  c.money,c.income_date,c.registerDate,c.remark ");
        hql.append("from income_info c  ");
        hql.append("where 1=1 ");

        if(map.get("accountId")!=null) {
            hql.append(" and c.account_id=:accountId ");
        }
        if(map.get("incomeBeginTime")!=null){
            hql.append(" and c.income_date>=:incomeBeginTime ");
        }
        if(map.get("incomeEndTime")!=null){
            hql.append(" and c.income_date<=:incomeEndTime ");
        }

        Query query = this.getCurrentSession().createSQLQuery(hql.toString());

        for(Object key : map.keySet()){
            query.setParameter(key.toString(),map.get(key.toString()));
        }

        List incomeInfoVOList = query.list();
        return incomeInfoVOList;

    }
}
