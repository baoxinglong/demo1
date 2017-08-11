<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/common.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

    <script type="text/javascript">  
    jQuery.ajaxSetup({cache:false});//ajax不缓存
	jQuery(function($){
		//设置菜单鼠标变色效果
		$(".menuul li").mouseover(function(){
			$(this).css("background-color","#D0E5F5");
		});
		$(".menuul li").mouseout(function(){
			$(this).css("background-color","#FFF");
		});
		var content = '<iframe scrolling="auto" frameborder="0" src="${ctx }/jsp/manager.jsp" style="width:100%;height:100%;"></frame>';
		$('#tabRegion').tabs('add',{
				title: '首页',
				content: content,
				closable: true
			});
		});
        function setmain(menuName,menuUrl){
        	
			if($("#tabRegion").tabs('exists',menuName)){
				
				$('#tabRegion').tabs('select',menuName);
			}
			else{
				var content = '<iframe scrolling="auto" frameborder="0" src="'+ menuUrl +'" style="width:100%;height:100%;"></frame>';
				$('#tabRegion').tabs('add',{
					title: menuName,
					content: content,
					closable: true
				});
			}		
		}
        /** 刷新当前选项卡 */
		function freshTab(){
			var tabRegion=$("#tabRegion");
			var tab = tabRegion.tabs('getSelected');
			tabRegion.tabs('update',{
				tab:tab,
				options:{}
			});
		} 
        //弹出窗口  
        function showWindow(options){  
            jQuery("#MyPopWindow").window(options);  
        }  
        //关闭弹出窗口  
        function closeWindow(){  
            $("#MyPopWindow").window('close');  
        }  
    </script>   
      
		
	</style> 
  </head>
 
  <!-- easyui-layout 可分上下左右中五部分，中间的是必须的，支持href，这样就可以不用iframe了 -->  
  <body class="easyui-layout" id="mainBody">  
        <!-- 上 -->  
        <div region="north" split="false" style="height:100px;text-align: center;" border="false">  
            <h1>欢迎： ${ctx}</h1>  
        </div>  
          
        <!-- 左-->  
		<div region="west" class="menudiv" split="true" title="系统菜单" icon="icon-redo" style="width:200px;overflow:hidden;">
			<div id="menuDiv" class="easyui-accordion" fit="true" border="false" animate="false">
				<div title="资源管理" style="overflow:hidden;">
					<ul class="menuul">                  
                        <li style="cursor: pointer;"   
                            onclick="setmain('用户管理','${ctx}/jsp/manager.jsp')" >用户管理</li>  
                    </ul>   
                    <ul>                    
                        <li style="cursor: pointer;"   
                            onclick="setmain('系统管理','${ctx}/jsp/one.jsp')" >系统管理</li>  
                    </ul>   
                    <ul>                    
                        <li style="cursor: pointer;"   
                            onclick="setmain('日志管理','${ctx}/jsp/two.jsp')" >日志管理</li>  
                    </ul>                       
                </div>  
                <div title="部门管理" style="overflow:hidden;">  
                    <ul>                    
                        <li id="rightLi${child.id}">部门管理</li>  
                        <li id="rightLi${child.id}">部门管理</li>     
                    </ul>                   
                </div>  
                <div title="XXX管理" style="overflow:hidden;">  
                    <ul>                    
                        <li id="rightLi${child.id}">XXX管理</li>  
                        <li id="rightLi${child.id}">XXX管理</li>    
                    </ul>                   
                </div>  
                <div title="XXX管理" style="overflow:hidden;">  
                    <ul>                    
                        <li id="rightLi${child.id}">XXX管理</li>  
                        <li id="rightLi${child.id}">XXX管理</li>  
                        <li id="rightLi${child.id}">XXX管理</li>    
                    </ul>                   
                </div>  
            </div>  
        </div>  
         
        <!-- 中 -->  
       <div region="center" class="maindiv" icon="icon-person" title="当前登录用户:${user.quName}&nbsp;[<a href='${ctx}/admin/logout.adm'>退出</a>]" style="overflow-x:hidden;">
			<div id="tabRegion" class="easyui-tabs" fit="true" border="false" tools="#tab-tools">
			</div>
		</div>
		<div id="tab-tools">
			<a href="#" class="easyui-linkbutton" plain="true" title="刷新当前窗口" iconCls="icon-reload" onclick="freshTab();">刷新窗口</a>
			<a href="#" class="easyui-linkbutton" plain="true" title="刷新系统缓存" iconCls="icon-promotion" onclick="freshCache();">刷新缓存</a>
		</div>
		<div id="MyPopWindow" modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false" style="margin: 0px;padding: 0px;overflow: auto;"></div>
  </body>
</html>