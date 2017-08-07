<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>



<%@page import="bingo.sso.plugin.gmcc.portal.DESHelper"%><html>
	<head>
		<title>登录请求处理中</title>
	</head>
  	<body scroll="no" onload="portalLoginForm.submit();">
  		
  		<img src="${path}/login/loading.gif" border="0" height="25" width="25" align="absmiddle">登录请求处理中……
  		<%
  			DESHelper DES = new DESHelper("cr@bg.ic");
  			String username = request.getParameter("username");
  			String password = request.getParameter("password");
  			username = DES.decrypt(username);
  			password = DES.decrypt(password);
  			String callbackURL =  request.getParameter("PortalLoginHandlerReturnTo");
  		%>
		<form name="portalLoginForm" action="<%=new String("http://portal.gmcc.net:7001/amserver/UI/Login") %>" method="post">
			<input type="hidden" name="goto" value="<%=callbackURL%>"/>
			<input type="hidden" name="Login.Token1" value="<%=username%>"/>
			<input type="hidden" name="Login.Token2" value="<%=password%>"/>
			<input type="hidden" name="module" value="LDAP"/>
		</form>
	</body>
</html>