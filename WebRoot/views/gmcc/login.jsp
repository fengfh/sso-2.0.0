<%@page session="false" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@include file="/common/header.jsp"%>
<%
	String  errors  = (String)request.getAttribute("login.errors");
	boolean isError = null != errors && !"".equals(errors.trim());
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title><spring:message code="login.form.title"/></title>
		<%@include file="/common/meta.jsp"%>
		<link href="${viewPath}/login.css" type="text/css" rel="stylesheet" />
		<script src="${viewPath}/login.js" type="text/javascript"></script>
		<script type="text/javascript">
	    	$(document).ready(function(){
				$('#username').focus().enterkeydown(function(){
					doSubmit();
				});
				$('#password').enterkeydown(function(){
					doSubmit();
				});
	        });
		</script>
	</head>
	<body>
		<%-- 改造登录页面需要注意以下内容必须定义：
		     1. <form action="${loginAction}">
		     2. <input type="hidden" name="LoginForm" value="yes"/>
		     3. <input name="username"/>
		     3. <input name="password"/>
		 --%>
		<form method="post" action="${loginAction}">
			<input type="hidden" name="LoginForm" value="yes"/>
			<table width="100%" cellpadding="0" cellspacing="0" height="100%" border="0">
				<tr>
					<td height="100%" align="center">
						<div class="lgn_body">
							<div class="lgn_fim_mg">
								<table cellSpacing="0" cellPadding="0" border="0" style="margin-top:100px;padding-left:240px;padding-right:30px">
									<% if(isError){ %>
										<tr>
											<td class="lgn_fim_l">
											</td>										
											<td class="lgn_fim_r">
												<font color="red">&nbsp;<spring:message code="<%=errors%>"/></font>
											</td>
										</tr>
									<% } %>
									<tr>
										<td class="lgn_fim_l">帐号类型：</td>
										<td class="lgn_fim_r">
										<select id="loginType" name="loginType" style="width:195px;ime-mode:disabled;">
											<option value="DefaultAccount">本地帐户</option>
											<option value="PortalAccount">PORTAL帐户</option>
										</select>
										</td>
									</tr>
									<tr>
										<td class="lgn_fim_l">
											<spring:message code="login.form.username"/>：
										</td>
										<td class="lgn_fim_r">
											<input id="username" name="username" style="width: 195px;" tabindex="1" accesskey="u" />
										</td>
									</tr>
									<tr>
										<td class="lgn_fim_l">
											<spring:message code="login.form.password"/>：
										</td>
										<td class="lgn_fim_r">
											<input type="password" id="password" name="password" style="width: 195px;" tabindex="2" accesskey="p" />
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<table cellSpacing="0" cellPadding="0" width="*"
												class="lgn_btn_mg">
												<tr>
													<td class="lgn_btn">
														<a href="javascript:void" onclick="doSubmit()" tabindex="3">
															<img src="${viewPath}/images/lgn_bi_1d.gif" border="0" 
																 onmouseover="this.src='${viewPath}/images/lgn_bi_1o.gif'" 
																 onmouseout="this.src='${viewPath}/images/lgn_bi_1d.gif'"/></a>
														&nbsp;&nbsp;
														<a href="javascript:void" onclick="window.close();" tabindex="4">
															<img src="${viewPath}/images/lgn_bi_2d.gif" border="0"
																 onmouseover="this.src='${viewPath}/images/lgn_bi_2o.gif'" 
																 onmouseout="this.src='${viewPath}/images/lgn_bi_2d.gif'"/>
														</a>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>