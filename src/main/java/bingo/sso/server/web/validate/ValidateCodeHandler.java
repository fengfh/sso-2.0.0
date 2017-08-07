/**
 * This file created at 2010-8-25.
 *
 * Copyright (c) 2002-2010 Bingosoft, Inc. All rights reserved.
 */
package bingo.sso.server.web.validate;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import bingo.sso.api.ISingleSignOnContext;
import bingo.sso.api.flow.IFlow;
import bingo.sso.api.login.CredentialValidateException;
import bingo.sso.api.login.ILoginContext;
import bingo.sso.api.utils.URLBuilder;
import bingo.sso.core.login.LoginHandler;

/**
 * <code>{@link LoginFormViewHandler}</code>
 * 
 * @author fenghm (fenghm@bingosoft.net)
 * @since 1.0.0
 */
public class ValidateCodeHandler extends LoginHandler {

	private static final Logger log = LoggerFactory.getLogger(ValidateCodeHandler.class);
	
	public static final String FORM_SUBMIT_PARAM   = "LoginForm";
	public static final String FORM_SUBMIT_VALUE   = "yes";
	public static final String FORM_RANDOMCODE_PARAM = "randomCode";
		
	@Override
    public boolean isSkipWhenCredentialsGranted() {
	    return true;
    }

	@Override
    public boolean isSkipWhenPrincipalGranted() {
	    return true;
    }
	
	public int handle(ISingleSignOnContext context, ILoginContext loginContext, IFlow flow) throws Exception {
		HttpServletRequest request = context.getRequest();
		
		//LoginForm=yes表示提交登录请求
		if(FORM_SUBMIT_VALUE.equalsIgnoreCase(request.getParameter(FORM_SUBMIT_PARAM))){			
			//效验码效验
			String randomCode = request.getParameter(FORM_RANDOMCODE_PARAM);
			if (null == randomCode || "".equals(randomCode = randomCode.trim())) {
				CredentialValidateException.throwException("请输入验证码");
			} else if (!ValidateCodeUtil.validateCode(randomCode, request)) {
				CredentialValidateException.throwException("验证码不正确");
			}
		}
		
		return flow.next();
    }
	
	
}