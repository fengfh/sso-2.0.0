<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="/common/header.jsp"%>
<%
	String returnTo  = (String)request.getAttribute("return_to");
	boolean isReturn = null != returnTo && !"".equals(returnTo.trim());
	
	//construts return_to url
	if(isReturn){
		StringBuilder url = new StringBuilder();
		url.append(returnTo);
		
		int index = returnTo.lastIndexOf("?");
		if(index < 0){
			url.append("?");
		}else{
			url.append("&");
		}
		url.append(Constants.OPENID_MODE).append("=").append(Constants.MODE_LOGOUT_RES);
		
		returnTo = url.toString();
	}
	
	//construts logout scripts
	StringBuilder scripts = new StringBuilder();
	List<CasWebApplicationService> services = (List<CasWebApplicationService>)request.getAttribute("services");
	if(null != services){
		for(CasWebApplicationService service : services){
			scripts.append("<script type=\"text/javascript\" src=\"")
			       .append(service.getLogoutUrl())
			       .append("\"></script>")
			       .append("\n");
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<%@page import="bingo.sso.openid.Constants"%><html>
<head>
	<title><spring:message code="logout.view.title"/></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<img id="loading" src="${viewPath}/images/loading.gif"/>

<%=scripts.toString()%>

<%--
<script type="text/javascript">
	document.getElementById('loading').style.display = "none";
</script>
--%>
 
<% if(isReturn){ %>

<span id="returnUrl" style="display:none"><%=returnTo%></span>
<script type="text/javascript">
window.location.href = '<%=returnTo %>';
</script>			

<%  }else{ %>
<script type="text/javascript">
	window.location.href = '${viewPath}/logout.success.jsp';
</script>			
<% 
	}
%>