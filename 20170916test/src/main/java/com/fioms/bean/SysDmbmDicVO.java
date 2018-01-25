package com.fioms.bean;

import java.sql.Timestamp;

/**
 * Created by peng on 2017/9/24.
 */
public class SysDmbmDicVO {
    private int dmbmbs;
    private String dmbm;
    private String dmbmmc;
    private String parentId;
    private String category;
    private Timestamp createDate;

    public int getDmbmbs() {
        return dmbmbs;
    }

    public void setDmbmbs(int dmbmbs) {
        this.dmbmbs = dmbmbs;
    }

    public String getDmbm() {
        return dmbm;
    }

    public void setDmbm(String dmbm) {
        this.dmbm = dmbm;
    }

    public String getDmbmmc() {
        return dmbmmc;
    }

    public void setDmbmmc(String dmbmmc) {
        this.dmbmmc = dmbmmc;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SysDmbmDicVO that = (SysDmbmDicVO) o;

        if (dmbmbs != that.dmbmbs) return false;
        if (category != null ? !category.equals(that.category) : that.category != null) return false;
        if (createDate != null ? !createDate.equals(that.createDate) : that.createDate != null) return false;
        if (dmbm != null ? !dmbm.equals(that.dmbm) : that.dmbm != null) return false;
        if (dmbmmc != null ? !dmbmmc.equals(that.dmbmmc) : that.dmbmmc != null) return false;
        if (parentId != null ? !parentId.equals(that.parentId) : that.parentId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = dmbmbs;
        result = 31 * result + (dmbm != null ? dmbm.hashCode() : 0);
        result = 31 * result + (dmbmmc != null ? dmbmmc.hashCode() : 0);
        result = 31 * result + (parentId != null ? parentId.hashCode() : 0);
        result = 31 * result + (category != null ? category.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        return result;
    }
}
