/**
 * This file created at 2012-3-31.
 *
 * Copyright (c) 2002-2012 Bingosoft, Inc. All rights reserved.
 */
package bingo.sso.server.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bingo.sso.api.ISingleSignOnController;
import bingo.sso.api.authentication.principal.Principal;
import bingo.sso.openid.IOpenIdIdentifierParser;

/**
 * <code>{@link SecurityContextUtil}</code>
 *
 * TODO : document me
 *
 * @author yohn
 */
public class SecurityContextUtil {
	private static ISingleSignOnController singleSignOnController;
	private static IOpenIdIdentifierParser openIdIdentifierParser;
	
	public static boolean isLogined(HttpServletRequest req, HttpServletResponse resp){
		return singleSignOnController.getCurrentPrincipal(req, resp) != null;
	}

	public static String getAccount(HttpServletRequest req, HttpServletResponse resp){
		Principal principal = singleSignOnController.getCurrentPrincipal(req, resp);
		if (principal != null){
			return principal.getId();
		}
		return null;
	}
	
	public static String getOpenIdIdentifier(HttpServletRequest req, HttpServletResponse resp){
		Principal principal = singleSignOnController.getCurrentPrincipal(req, resp);
		if (principal != null){
			return openIdIdentifierParser.account2Identifier(req, principal.getId());
		}
		return null;
	}


	/**
	 * @param openIdIdentifierParser the openIdIdentifierParser to set
	 */
	public void setOpenIdIdentifierParser(
			IOpenIdIdentifierParser openIdIdentifierParser) {
		SecurityContextUtil.openIdIdentifierParser = openIdIdentifierParser;
	}

	/**
	 * @param singleSignOnController the singleSignOnController to set
	 */
	public void setSingleSignOnController(
			ISingleSignOnController singleSignOnController) {
		SecurityContextUtil.singleSignOnController = singleSignOnController;
	}
		
}
