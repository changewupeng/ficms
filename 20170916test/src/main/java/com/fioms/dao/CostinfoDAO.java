package com.fioms.dao;

import com.fioms.bean.CostinfoVO;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/9/29.
 */
@Repository("costinfoDAO")
public class CostinfoDAO {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public void saveCostinfoVO(CostinfoVO costinfoVO) throws Exception {
        this.getCurrentSession().save(costinfoVO);
    }

    public List getCostinfoByDateAndAccountId(Map map)throws Exception{
        StringBuffer hql = new StringBuffer("select " +
                "c.costid as costid ,(select a.userName from user a where a.account_Id=c.account_id) as accountId," +
                "(select s.dmbmmc from sys_dmbm_dic s where s.category='COST_CATEGORY' and s.dmbm=c.cost_category_code) as costCategoryCode," +
                "(select s.dmbmmc from sys_dmbm_dic s where s.category='COST_SPECIFIC' and s.parent_id=c.cost_category_code and s.dmbm=c.cost_specific_code) as costSpecificCode," +
                "c.money as money ,c.costDate as costDate,c.registerDate as registerDate,c.costStatus as costStatus,c.remark as remark" +
                " from ficms.costinfo c where 1=1 ");
        if(map.get("accountId")!=null) {
            hql.append(" and c.account_id=:accountId ");
        }
        if(map.get("beginDate")!=null){
            hql.append(" and c.costDate>=:beginDate ");
        }
        if(map.get("endDate")!=null){
            hql.append(" and c.costDate<=:endDate ");
        }

        Query query = this.getCurrentSession().createSQLQuery(hql.toString());

        for(Object key : map.keySet()){
            query.setParameter(key.toString(),map.get(key.toString()));
        }

        List costinfoVOList = query.list();
        return costinfoVOList;
    }

    public List queryCostStatisticsInfoByCategoryCode(Map map){
        StringBuffer querySql = new StringBuffer();
        querySql.append("select ");
        querySql.append(" fnc_gecs_get_item_name('COST_CATEGORY',cost_category_code) as categoryCode,sum(money) money ");
        querySql.append("from costinfo c where 1=1 ");
        if(map.get("accountId")!=null) {
            querySql.append(" and c.account_id=:accountId ");
        }
        if(map.get("beginDate")!=null){
            querySql.append(" and c.costDate>=:beginDate ");
        }
        if(map.get("endDate")!=null){
            querySql.append(" and c.costDate<=:endDate ");
        }

        querySql.append(" group by c.cost_category_code ");
        Query query = this.getCurrentSession().createSQLQuery(querySql.toString());

        for(Object key : map.keySet()){
            query.setParameter(key.toString(),map.get(key.toString()));
        }

        List costinfoVOList = query.list();
        return costinfoVOList;
    }

    public List queryCostStatisticsInfoBySpecificCode(Map map){
        StringBuffer querySql = new StringBuffer();
        querySql.append("select ");
        querySql.append(" concat(fnc_gecs_get_item_name('COST_SPECIFIC',cost_specific_code),'(',cost_specific_code,')') as COST_SPECIFIC, ");
        querySql.append(" sum( money ) money ");
        querySql.append("from costinfo c where 1=1 ");
        if(map.get("accountId")!=null) {
            querySql.append(" and c.account_id=:accountId ");
        }
        if(map.get("beginDate")!=null){
            querySql.append(" and c.costDate>=:beginDate ");
        }
        if(map.get("endDate")!=null){
            querySql.append(" and c.costDate<=:endDate ");
        }

        querySql.append(" group by c.cost_specific_code ");
        Query query = this.getCurrentSession().createSQLQuery(querySql.toString());

        for(Object key : map.keySet()){
            query.setParameter(key.toString(),map.get(key.toString()));
        }

        List costinfoVOList = query.list();
        return costinfoVOList;
    }

    //查询最近七天的消费情况
    public List queryRecentSevenDayCost(Map map){
        StringBuffer querySql = new StringBuffer();
        querySql.append("select ");
        querySql.append(" c.costDate,sum(money) as money ");
        querySql.append(" from costinfo c where c.costDate>=date_add(curdate(),interval -7 day) ");
        if(map.get("accountId")!=null){
            querySql.append(" and c.account_id=:accountId ");
        }
        querySql.append(" group by c.costDate ");
        querySql.append(" order by c.costDate ");

        Query query = this.getCurrentSession().createSQLQuery(querySql.toString());
        if(map.get("accountId")!=null) {
            query.setParameter("accountId", map.get("accountId"));
        }
        List list = query.list();
        return list;
    }
}
