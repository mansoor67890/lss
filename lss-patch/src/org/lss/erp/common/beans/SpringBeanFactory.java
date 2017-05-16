/**
 * 
 */
package org.lss.erp.common.beans;

import java.util.Properties;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.lss.erp.common.FormattedLogger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.env.Environment;

/**
 * @author Muhammad Zubair
 * 
 */
public class SpringBeanFactory {

	private static SpringBeanFactory instance;
	private ApplicationContext context;
	private final String CONFIGURATION_XML = "META-INF/applicationContext.xml";
	private Environment environment;

	private static Logger logger = FormattedLogger.getFormattedLoggerForCurrentUser(SpringBeanFactory.class);

	private SpringBeanFactory() {
		try {
			context = new ClassPathXmlApplicationContext(CONFIGURATION_XML);
			setEnvironment(context.getEnvironment());
		} catch (Exception e) {
			logger.log(Level.ERROR, e.getMessage(), e);
		}
	}

	public static SpringBeanFactory getInstance() {
		if (instance == null) {
			instance = new SpringBeanFactory();
		}
		return instance;
	}
 

	public Environment getEnvironment() {
		return environment;
	}

	public void setEnvironment(Environment environment) {
		this.environment = environment;
	}

	public String getProperty(String key) {
		Properties p = (Properties) context.getBean("constants");
		if (p != null) {
			return p.getProperty(key);
		}
		return null;
	}
	//
	// public Object getWebServices(String key) {
	// Properties p = (Properties) context.getBean("webservices");
	// if (p != null) {
	// return p.getProperty(key);
	// }
	// return null;
	// }

}