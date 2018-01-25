package com.fioms.bean;

import java.util.Date;
import java.sql.Timestamp;

/**
 * Created by peng on 2017/9/24.
 */
public class CostinfoVO {
    private String costid;
    private String accountId;
    private String costCategoryCode;
    private String costSpecificCode;
    private Double money;
    private Date costDate;
    private Timestamp registerDate;
    private String costStatus;
    private String remark;

    public String getCostid() {
        return costid;
    }

    public void setCostid(String costid) {
        this.costid = costid;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getCostCategoryCode() {
        return costCategoryCode;
    }

    public void setCostCategoryCode(String costCategoryCode) {
        this.costCategoryCode = costCategoryCode;
    }

    public String getCostSpecificCode() {
        return costSpecificCode;
    }

    public void setCostSpecificCode(String costSpecificCode) {
        this.costSpecificCode = costSpecificCode;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getCostDate() {
        return costDate;
    }

    public void setCostDate(Date costDate) {
        this.costDate = costDate;
    }

    public Timestamp getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Timestamp registerDate) {
        this.registerDate = registerDate;
    }

    public String getCostStatus() {
        return costStatus;
    }

    public void setCostStatus(String costStatus) {
        this.costStatus = costStatus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CostinfoVO that = (CostinfoVO) o;

        if (accountId != null ? !accountId.equals(that.accountId) : that.accountId != null) return false;
        if (costCategoryCode != null ? !costCategoryCode.equals(that.costCategoryCode) : that.costCategoryCode != null)
            return false;
        if (costDate != null ? !costDate.equals(that.costDate) : that.costDate != null) return false;
        if (costSpecificCode != null ? !costSpecificCode.equals(that.costSpecificCode) : that.costSpecificCode != null)
            return false;
        if (costStatus != null ? !costStatus.equals(that.costStatus) : that.costStatus != null) return false;
        if (costid != null ? !costid.equals(that.costid) : that.costid != null) return false;
        if (money != null ? !money.equals(that.money) : that.money != null) return false;
        if (registerDate != null ? !registerDate.equals(that.registerDate) : that.registerDate != null) return false;
        if (remark != null ? !remark.equals(that.remark) : that.remark != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = costid != null ? costid.hashCode() : 0;
        result = 31 * result + (accountId != null ? accountId.hashCode() : 0);
        result = 31 * result + (costCategoryCode != null ? costCategoryCode.hashCode() : 0);
        result = 31 * result + (costSpecificCode != null ? costSpecificCode.hashCode() : 0);
        result = 31 * result + (money != null ? money.hashCode() : 0);
        result = 31 * result + (costDate != null ? costDate.hashCode() : 0);
        result = 31 * result + (registerDate != null ? registerDate.hashCode() : 0);
        result = 31 * result + (costStatus != null ? costStatus.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        return result;
    }
}
