package com.fioms.dao;

import com.fioms.bean.BusinessCardInfoVO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/11/11.
 */
@Repository("businessCardInfoDAO")
public class BusinessCardInfoDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

//    public List<BusinessCardInfoVO> queryBusinessCardInfoVO(Map map){
//
//    }

}
