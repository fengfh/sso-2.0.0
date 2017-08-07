/**
 * This file created at 2010-8-25.
 *
 * Copyright (c) 2002-2010 Bingosoft, Inc. All rights reserved.
 */
package bingo.sso.server.web;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import bingo.sso.core.utils.ConfigUtils;

/**
 * <code>{@link WebUtils}</code>
 *
 * @author fenghm (fenghm@bingosoft.net)
 * @since 1.0.0
 */
public class WebUtils {
	
	public static final String CONFIG_UI_THEME_NAME  = "sso.ui.theme";
	public static final String CONFIG_UI_VIEW_PATH   = "sso.ui.viewpath";
	
	public static final String getContextPath(HttpServletRequest request){
		String path = request.getContextPath();
		if("/".equals(path)){
			return "";
		}
		return path;
	}

	public static final String getTheme(ServletContext context){
		return ConfigUtils.getProperty(context, CONFIG_UI_THEME_NAME, "default");
	}
	
	public static final String getViewPath(ServletContext context){
		return ConfigUtils.getProperty(context, CONFIG_UI_VIEW_PATH, "/views/default");
	}
}
