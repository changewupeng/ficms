package com.common.utils;


import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ImportParams;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * 吴鹏
 */
public class ExcelUtils {

    public static void main(String[] args) {
        ImportParams params = new ImportParams();
        params.setTitleRows(0);
        params.setHeadRows(1);
        params.setNeedSave(false);
        params.setSheetNum(1);
        File f = new File("e:/test.xlsx");
        List<Map<String, Object>> listMap = ExcelImportUtil.importExcel(f, Map.class, params);
        System.out.println(listMap.size());
    }
}
