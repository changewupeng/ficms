package com.fioms.bean;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by peng on 2017/9/24.
 */
public class UserVO {
    private String accountId;
    private String userName;
    private String phone;
    private String sex;
    private String nation;
    private Date createDate;
    private Date modifyDate;

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserVO userVO = (UserVO) o;

        if (accountId != null ? !accountId.equals(userVO.accountId) : userVO.accountId != null) return false;
        if (createDate != null ? !createDate.equals(userVO.createDate) : userVO.createDate != null) return false;
        if (modifyDate != null ? !modifyDate.equals(userVO.modifyDate) : userVO.modifyDate != null) return false;
        if (nation != null ? !nation.equals(userVO.nation) : userVO.nation != null) return false;
        if (phone != null ? !phone.equals(userVO.phone) : userVO.phone != null) return false;
        if (sex != null ? !sex.equals(userVO.sex) : userVO.sex != null) return false;
        if (userName != null ? !userName.equals(userVO.userName) : userVO.userName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = accountId != null ? accountId.hashCode() : 0;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (nation != null ? nation.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + (modifyDate != null ? modifyDate.hashCode() : 0);
        return result;
    }
}
