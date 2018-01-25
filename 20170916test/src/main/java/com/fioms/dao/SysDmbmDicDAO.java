package com.fioms.dao;

import com.fioms.bean.SysDmbmDicVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by peng on 2017/9/24.
 */
@Repository("sysDmbmDicDAO")
public class SysDmbmDicDAO {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public List<SysDmbmDicVO> querySysDmbmDicByCategory(String category) throws Exception{
        String hql="from SysDmbmDicVO dic where dic.category=:category";
        List<SysDmbmDicVO> sysDmbmDicVOList = this.getCurrentSession().createQuery(hql).setParameter("category", category).setCacheable(true).list();
        return  sysDmbmDicVOList;
    }

    public List<SysDmbmDicVO> querySysDmbmDicByCategoryAndParentId(String category,String parentId) throws Exception{
        String hql="from SysDmbmDicVO dic where dic.category=:category and dic.parentId=:parentId";
        List<SysDmbmDicVO> sysDmbmDicVOList = this.getCurrentSession().createQuery(hql).setParameter("category", category).setParameter("parentId",parentId).setCacheable(true).list();
        return  sysDmbmDicVOList;
    }
}
