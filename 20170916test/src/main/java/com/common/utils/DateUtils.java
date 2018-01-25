package com.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Lenovo on 2017/9/29.
 */
public class DateUtils {
    public static String YYYY_MM_DD="yyyy-MM-dd";


    public static Date str2Date(String date,String format){
        Date date1=null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            date1 = sdf.parse(date);
        }catch (ParseException e){
            e.printStackTrace();
        }
        return date1;
    }

    public static String Date2Str(Date date,String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return  sdf.format(date);
    }
}
