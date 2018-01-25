package com.fioms.bean;

import java.util.Date;
import java.sql.Timestamp;

/**
 * Created by Lenovo on 2017/10/9.
 */
public class IncomeInfoVO {
    private String lsh;
    private String accountId;
    private String incomeCategory;
    private Double money;
    private Date incomeDate;
    private Timestamp registerDate;
    private String remark;

    public String getLsh() {
        return lsh;
    }

    public void setLsh(String lsh) {
        this.lsh = lsh;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getIncomeCategory() {
        return incomeCategory;
    }

    public void setIncomeCategory(String incomeCategory) {
        this.incomeCategory = incomeCategory;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Date getIncomeDate() {
        return incomeDate;
    }

    public void setIncomeDate(Date incomeDate) {
        this.incomeDate = incomeDate;
    }

    public Timestamp getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Timestamp registerDate) {
        this.registerDate = registerDate;
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

        IncomeInfoVO that = (IncomeInfoVO) o;

        if (accountId != null ? !accountId.equals(that.accountId) : that.accountId != null) return false;
        if (incomeCategory != null ? !incomeCategory.equals(that.incomeCategory) : that.incomeCategory != null)
            return false;
        if (incomeDate != null ? !incomeDate.equals(that.incomeDate) : that.incomeDate != null) return false;
        if (lsh != null ? !lsh.equals(that.lsh) : that.lsh != null) return false;
        if (money != null ? !money.equals(that.money) : that.money != null) return false;
        if (registerDate != null ? !registerDate.equals(that.registerDate) : that.registerDate != null) return false;
        if (remark != null ? !remark.equals(that.remark) : that.remark != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = lsh != null ? lsh.hashCode() : 0;
        result = 31 * result + (accountId != null ? accountId.hashCode() : 0);
        result = 31 * result + (incomeCategory != null ? incomeCategory.hashCode() : 0);
        result = 31 * result + (money != null ? money.hashCode() : 0);
        result = 31 * result + (incomeDate != null ? incomeDate.hashCode() : 0);
        result = 31 * result + (registerDate != null ? registerDate.hashCode() : 0);
        result = 31 * result + (remark != null ? remark.hashCode() : 0);
        return result;
    }
}
