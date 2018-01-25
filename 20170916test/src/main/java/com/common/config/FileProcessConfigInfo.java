package com.common.config;

import org.springframework.util.StringUtils;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Lenovo on 2017/10/17.
 */
public class FileProcessConfigInfo {
    private final static String CONFIG_FILE_PATH = "/spring/paramConfig.properties";
    private static Properties properties = new Properties();

    static {
        initial(null);
    }

    private static void initial(String path) {
        try {
            InputStream inputStream = null;
            try {
                if (path != null && !path.equals("")){
                    inputStream = new FileInputStream(path);
                    properties.load(inputStream);
                } else {
                    inputStream = FileProcessConfigInfo.class.getResourceAsStream(CONFIG_FILE_PATH);
                    properties.load(inputStream);
                }
            } catch (Exception e) {
                throw e;
            }finally {
                if(inputStream != null){
                    inputStream.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 用key来查询配置清单中指定的配置文件路径，没值则返回空
     * @param key KEY值
     */
    public static String getRuntimeParam(String key) {
        String value = null;
        if (properties != null)
            value = properties.getProperty(key);

        return value;
    }

    /**
     * 用key来查询配置清单中指定的配置文件路径，没值则返回默认值
     * @param key KEY值
     * @param defaultValue 默认值
     */
    public static String getRuntimeParam(String key,String defaultValue) {
        String value = null;
        if (properties != null)
            value = properties.getProperty(key);
        if(StringUtils.isEmpty(value))
            value = defaultValue;
        return value;
    }

    public static Properties getProperties() {
        return properties;
    }
}
