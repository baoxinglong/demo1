<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 引入JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- 引入EasyUI -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/themes/default/easyui.css" type="text/css"/>
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/themes/icon.css" type="text/css"/>
<title>Insert title here</title>

</head>
<body>

		<c:forEach var="parentMenu" items="${msg}">
		<tr>
			<td>${parentMenu.name}</td>
			<td>${parentMenu.age}</td>
			<td>${parentMenu.gender}</td>
		
		</tr>
		</c:forEach>


</body>
</html>