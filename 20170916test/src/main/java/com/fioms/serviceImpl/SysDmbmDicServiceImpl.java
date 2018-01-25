package com.fioms.serviceImpl;

import antlr.StringUtils;
import com.fioms.bean.SysDmbmDicVO;
import com.fioms.dao.SysDmbmDicDAO;
import com.fioms.service.SysDmbmDicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by peng on 2017/9/24.
 */

@Service("sysDmbmDicService")
public class SysDmbmDicServiceImpl implements SysDmbmDicService {
    @Autowired
    private SysDmbmDicDAO sysDmbmDicDAO;

    public List<SysDmbmDicVO> findSysDmbmDicByCategory(Map map){
        List<SysDmbmDicVO> sysDmbmDicVOList = new ArrayList<SysDmbmDicVO>();
        Object category = map.get("category");
        if(category!=null&& org.apache.commons.lang.StringUtils.isNotBlank(category.toString())){
            try {
                sysDmbmDicVOList = sysDmbmDicDAO.querySysDmbmDicByCategory(category.toString());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return sysDmbmDicVOList;
    }

    public List<SysDmbmDicVO> findSysDmbmDicByCategoryAndParentId(Map map){
        List<SysDmbmDicVO> sysDmbmDicVOList = new ArrayList<SysDmbmDicVO>();
        Object category = map.get("category");
        Object parentId = map.get("parentId");
        if(parentId!=null&& org.apache.commons.lang.StringUtils.isNotBlank(parentId.toString())){
            try {
                sysDmbmDicVOList = sysDmbmDicDAO.querySysDmbmDicByCategoryAndParentId(category.toString(),parentId.toString());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return sysDmbmDicVOList;
    }
}
