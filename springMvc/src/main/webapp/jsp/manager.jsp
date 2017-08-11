<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/common.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>

 <script type="text/javascript">  
    jQuery(function($){  
    	
        $('#userTable').datagrid({          	
            title:'用户列表', //标题  
            method:'post',  
            iconCls:'icon-edit', //图标  
            singleSelect:false, //多选  
            height:360, //高度  
            fitColumns: true, //自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。  
            striped: true, //奇偶行颜色不同  
            collapsible:true,//可折叠  
            url:"../hello/manager", //数据来源  
            sortName: 'id', //排序的列  
            sortOrder: 'desc', //倒序  
            remoteSort: true, //服务器端排序  
            idField:'id', //主键字段  
            queryParams:{}, //查询条件  
            pagination:true, //显示分页  
            rownumbers:true, //显示行号  
            columns:[[  
                {field:'ck',checkbox:true,width:2}, //显示复选框  
                {field:'name',title:'姓名',width:20,sortable:true,},  
                {field:'age',title:'年龄',width:20,sortable:true,},  
                {field:'gender',title:'性别',width:30,sortable:true,},                
            ]],  
            toolbar:[{  
                text:'新增',  
                iconCls:'icon-add',  
                handler:function(){  
                	
                    addrow();  
                }  
            },'-',{  
                text:'更新',  
                iconCls:'icon-edit',  
                handler:function(){  
                    updaterow();  
                }  
            },'-',{  
                text:'删除',  
                iconCls:'icon-remove',  
                handler:function(){  
                    deleterow();  
                }  
            },'-',{  
                text:'下载',  
                iconCls:'icon-remove',  
                handler:function(){  
                    dwonload();  
                }  
            },'-'],  
            onLoadSuccess:function(){  
                $('#userTable').datagrid('clearSelections'); //一定要加上这一句，要不然datagrid会记住之前的选择状态，删除时会出问题  
            },
            success:function(data){
            	alert(data)
            }
        });  
     
  
  
        //不知道新版本修正了没有，我目前的做法是点击菜单的时候手动清除一下。  
        $('#deptCombo').combogrid({  
            idField:'id', //ID字段  
            textField:'name', //显示的字段  
            url:"dept/queryAll",  
            fitColumns: true,  
            striped: true,  
            editable:false,//不可编辑，只能选择  
            columns:[[  
                {field:'code',title:'编号',width:100},  
                {field:'name',title:'名称',width:150}  
            ]]  
        });  
  
    });  
    //新增 窗口
    function addrow(){ 
    	$("#MyPopWindow").window({
  			title:'增加',
  			href:'../hello/toaddpage',
  			width:500,
  			height:300,
  			draggable:true,
  			onLoad: function(){
  				
  				
  			}
  		});

    }  
   function chgAdd(){
	   var url;
	   url="${ctx}/hello/add";
	   $.post(url,$("#cityForm").serializeArray(),function(data){
			if(data.success){//操作成功
				
				$.messager.alert('提示','操作成功','info');
				$('#userTable').datagrid('reload');//刷新数据
				$('#MyPopWindow').window('close');//关闭窗口
				
			}else{
				$('#MyPopWindow').window('close');//关闭窗口
				$.messager.alert('提示',data.msg,'warning');	
			}
		});
		
   }
   function  dwonload(){
	   var url;
	   url="${ctx}/hello/dwonload";
	   $.post(url,function(data){
			if(data.success){//操作成功
				
				$.messager.alert('提示','操作成功','info');
				$('#userTable').datagrid('reload');//刷新数据
				$('#MyPopWindow').window('close');//关闭窗口
				
			}else{
				$('#MyPopWindow').window('close');//关闭窗口
				$.messager.alert('提示',"下载失败",'warning');	
			}
		});
   }
   
  //更新  
    function updaterow(){  
        var rows = $('#userTable').datagrid('getSelections');  
        //<span style="color: #ff0000;">这里有一个jquery easyui datagrid的一个小bug，必须把主键单独列出来，要不然不能多选</span>  
  
  
        if(rows.length==0){  
            $.messager.alert('提示',"请选择你要更新的用户",'info');  
            return;  
        }  
        if(rows.length > 1){  
            $.messager.alert('提示',"只能选择一位用户进行更新",'info');  
            return;  
        }  
        showWindow({  
            title:'更新用户信息',  
            href:'user/popWindow',  
            width:300,  
            height:250,  
            onLoad: function(){    
                $("#userForm").form('load', rows[0].user);  
            }  
        });  
    }  
      
  //删除  
    function deleterow(){  
        $.messager.confirm('提示','确定要删除吗?',function(result){  
            if (result){  
                var rows = $('#userTable').datagrid('getSelections');  
                var ps = "";  
                $.each(rows,function(i,n){  
                    if(i==0)   
                        ps += "?uid="+n.uid;  
                    else  
                        ps += "&uid="+n.uid;  
                });  
                $.post('user/delete'+ps,function(data){  
                    $('#userTable').datagrid('reload');   
                    $.messager.alert('提示',data.mes,'info');  
                });  
            }  
        });  
    }  
    //表格查询  
    function searchUser(){  
        var params = $('#userTable').datagrid('options').queryParams; //先取得 datagrid 的查询参数  
        var fields =$('#queryForm').serializeArray(); //自动序列化表单元素为JSON对象  
        $.each( fields, function(i, field){  
            params[field.name] = field.value; //设置查询参数  
        });   
        $('#userTable').datagrid('reload'); //设置好查询参数 reload 一下就可以了  
    }  
    //清空查询条件  
    function clearForm(){  
        $('#queryForm').form('clear');  
        searchUser();  
    }  
      
    </script>   
  </head>  
    
  <body>  
   
    <div style="padding:10" id="tabdiv" class="easyui-panel">  
        <table id="userTable"></table>  
    </div> 
    <div id="MyPopWindow"  modal="true" shadow="false" minimizable="false" cache="false" maximizable="false" collapsible="false" resizable="false"  draggable="false" style="margin: 0px;padding: 0px;overflow: auto;+position:relative;">
    
    </div>			   
  </body>  
</html>