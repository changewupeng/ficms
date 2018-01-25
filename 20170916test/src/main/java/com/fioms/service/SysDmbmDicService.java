package com.fioms.service;

import com.fioms.bean.SysDmbmDicVO;

import java.util.List;
import java.util.Map;

/**
 * Created by peng on 2017/9/24.
 */
public interface SysDmbmDicService {
    List<SysDmbmDicVO> findSysDmbmDicByCategory(Map map);

    List<SysDmbmDicVO> findSysDmbmDicByCategoryAndParentId(Map map);
}
