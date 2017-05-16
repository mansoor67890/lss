/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.lss.erp.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.RollingFileAppender;

/**
 * @author Zubair
 */
public class FormattedLogger {

    static final String appdir = System.getProperty("user.dir");
    static final String logdir = appdir + File.separator + "logs" + File.separator;
    static final String defaultFileName = logdir + "pennapayroll.log";

    private static String getLoggerFormat(String userName) {
        String pattern = "%d{dd.MM.yyyy k:mm:ss:S}|%c(%L)| %m%n";
      
        return pattern;
    }

    private static PatternLayout getLoggerPatternLayout(String userName) {
        return new PatternLayout(getLoggerFormat(userName));
    }

    public static Logger getFormattedLoggerForCurrentUser(Class forClass) {
 
        String fileName = defaultFileName;
        try {
            String fileNameDateTimeStamp = "dd.MM.yyyy";
            SimpleDateFormat dateFormat = new SimpleDateFormat(fileNameDateTimeStamp);
            fileName = logdir + null + dateFormat.format(new Date()) + ".log";
            //System.out.println("fileName:"+fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return getFormattedLoggerForFile(forClass, null, fileName);
    }

    public static Logger getFormattedLogger(Class forClass, String userName) {
        return getFormattedLoggerForFile(forClass, userName, defaultFileName);

    }

    public static Logger getFormattedLoggerForFile(Class forClass, String userName, String fileName) {
        Logger logger = Logger.getLogger(forClass);
        try {
            RollingFileAppender appender = new RollingFileAppender(getLoggerPatternLayout(userName), fileName);
            appender.setMaxFileSize("8000KB");
            logger.addAppender(appender);
            logger.setLevel((Level) Level.DEBUG);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return logger;
    }
}
