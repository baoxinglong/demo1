<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/common.jsp"></jsp:include>
<title>Insert title here</title>
</head>
<body>
		<form action="" id="cityForm" method="post">
		<div style="margin-bottom:20px;text-align: center;margin-top:30px;">
			姓名：<input class="easyui-textbox" name="name" style="width:400;height:30px;padding:12px" data-options="prompt:'姓名',iconCls:'icon-man',iconWidth:38">
		</div>
		<div style="margin-bottom:20px;text-align: center;">
			年龄：<input class="easyui-textbox" name="age" style="width:400;height:30px;padding:12px" data-options="prompt:'年龄',iconCls:'icon-man',iconWidth:38">
		</div>
		<div style="margin-bottom:20px;text-align: center;">
			性别：<input class="easyui-textbox" name="gender" style="width:400;height:30px;padding:12px" data-options="prompt:'性别',iconCls:'icon-man',iconWidth:38">
		</div>
		<div style="text-align: center;">
			<a href="#" class="easyui-linkbutton" onclick="chgAdd();" data-options="iconCls:'icon-save'" style="padding:5px 0px;width:400">
				<span style="font-size:14px;">保存</span>
			</a>
		</div>
		</form>
</body>
</html>