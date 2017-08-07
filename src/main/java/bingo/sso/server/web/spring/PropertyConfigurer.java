/**
 * This file created at 2010-8-22.
 *
 * Copyright (c) 2002-2010 Bingosoft, Inc. All rights reserved.
 */
package bingo.sso.server.web.spring;

import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

/**
 * 使用Spring {@link PropertyPlaceholderConfigurer}
 * @author fengm (fenghm@bingosoft.net)
 * @since 1.0.0
 */
public class PropertyConfigurer extends PropertyPlaceholderConfigurer{
	
	protected Properties properties;
	
	@Override
	protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props) throws BeansException {
		super.processProperties(beanFactoryToProcess, props);
		this.properties = props;
	}
	
	public Properties getProperties(){
		return properties;
	}
}
