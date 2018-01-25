package com.fioms.dao;

import com.fioms.bean.AccountinfoVO;
import com.fioms.bean.CostinfoVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by peng on 2017/9/24.
 */
@Repository("accountinfoDAO")
public class AccountinfoDAO {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public Object addAccountinfo(AccountinfoVO object) throws Exception{
        return this.getCurrentSession().save(object);
    }

}
