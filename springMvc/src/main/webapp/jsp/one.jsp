<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$('#addPerson').window({
	title: '增加',
	width: 400,
	height: 200,
	closed: false,
	cache: false,
    modal: true,
    minimizable:true,
    maximizable:true , 
    buttons: [{  
        id: 'btnAdd',  
        text: '添加',  
        iconCls: 'icon-add',  
        handler: function () {  
            //让表单提交  
              
            $('#addOrEditForm').form("submit",{  
                url:'emplAction!add.action',  
                onSubmit:function(){  
                    return $(this).form('validate');  
                },  
                success:function(data){  
                    $.messager.show({  
                           title : '提示',  
                           msg : data ,  
                       });  
                      $('#mydialog').dialog('close');   
                      $('#dg').datagrid('load');  
                      $('#dg').datagrid('loaded');  
                }  
            });   
        }  
    }, {  
        id: 'btnCancelAdd',  
        text: '取消',  
        iconCls: 'icon-cancel',  
        handler: function () {  
            $("#addDiv").dialog("close");  
        }  
    }]  
	});
	    
</script>
</head>
<body>
<h1>111</h1>
</body>
</html>