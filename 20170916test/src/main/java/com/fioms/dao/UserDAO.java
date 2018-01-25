package com.fioms.dao;

import com.fioms.bean.UserVO;
import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by peng on 2017/9/24.
 */
@Repository("userDAO")
public class UserDAO {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public List<UserVO> getUserAll() throws Exception{
        List<UserVO> userVOList = this.getCurrentSession().createQuery("from UserVO ").setCacheable(true).list();
        return userVOList;
    }

    public void addUser(UserVO object) throws Exception{
        try {
            this.getCurrentSession().save(object);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
