<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@include file="/common/header.jsp"%>
<%
	String returnTo  = (String)request.getAttribute("returnUrl");
	boolean isReturn = null != returnTo && !"".equals(returnTo.trim());	
	
	//construts logout scripts
	StringBuilder scripts = new StringBuilder();
	List<String> logoutUrls = (List<String>)request.getAttribute("logoutUrls");
	if(null != logoutUrls){
		for(String logoutUrl : logoutUrls){
			scripts.append("<script type=\"text/javascript\" src=\"")
			       .append(logoutUrl)
			       .append("\"></script>")
			       .append("\n");
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
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