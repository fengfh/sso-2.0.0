<%@page import="bingo.sso.server.web.SecurityContextUtil"%><%@page import="bingo.sso.core.utils.WebUtils"%><%
String serverViewPath = bingo.sso.server.web.WebUtils.getViewPath(pageContext.getServletContext());
boolean isLogined = SecurityContextUtil.isLogined(request,response);
if(isLogined){
	String successUrl = serverViewPath + "/login.success.jsp";
	request.getRequestDispatcher(successUrl).forward(request,response);
}else{
	String loginUrl = "/signon/login?returnUrl=" + WebUtils.getServerBaseUrl(request) + "/index.jsp";
	request.getRequestDispatcher(loginUrl).forward(request,response);
}
%>