package com.common.bacgroud;

import com.common.config.FileProcessConfigInfo;
import org.jeecgframework.poi.excel.ExcelImportUtil;
import org.jeecgframework.poi.excel.entity.ImportParams;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Lenovo on 2017/10/17.
 */
public class CostInfoParseExcel {

    public void costInfoParseExcelMain(){
        File dictory = new File(FileProcessConfigInfo.getRuntimeParam("PENDING_ANALYSIS_FILE_PATH"));

        if (!dictory.exists() || !dictory.isDirectory())
            return;
        File[] files = dictory.listFiles();
        List<File> targetFiles = new ArrayList<File>();
        for (int n = 0; n < files.length; n++) {
            targetFiles.add(files[n]);
        }

        for(int i=0;i<targetFiles.size();i++){
            if(!targetFiles.get(i).getName().contains(FileProcessConfigInfo.getRuntimeParam("PENDING_ANALYSIS_FILE_NAME_KEY_WORD")))
                return;

            List<Map<String, Object>> mapList = this.parseExcelToMap(targetFiles.get(i).getAbsolutePath());

            System.out.println(mapList.size());

        }
    }

    public List<Map<String, Object>> parseExcelToMap(String path){
        ImportParams params = new ImportParams();
        params.setTitleRows(0);
        params.setHeadRows(1);
        params.setNeedSave(false);
        params.setSheetNum(1);
        File f = new File(path);
        return ExcelImportUtil.importExcel(f, Map.class, params);
    }

    public static void main(String[] args) {
        new CostInfoParseExcel().costInfoParseExcelMain();
    }
}
