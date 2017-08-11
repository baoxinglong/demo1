
	 var url;  
     function deleteUser(){  
         var row=$('#dg').datagrid('getSelected');  
         if(row){  
             $.messager.confirm("系统提示","您确定要删除这条记录吗?",function(r){  
                 if(r){  
                     $.post('userDelete',{delId:row.id},function(result){  
                         if(result.success){  
                             $.messager.alert("系统提示","已成功删除这条记录!");  
                             $("#dg").datagrid("reload");  
                         }else{  
                             $.messager.alert("系统提示",result.errorMsg);  
                         }  
                     },'json');  
                 }  
             });  
         }  
     }  
   
     function newUser(){  
    	 
         $("#dlg").dialog('open').dialog('setTitle','添加用户');  
         $('#fm').form('clear');  
         url='userSave';  
     }  
       
       
     function editUser(){  
         var row=$('#dg').datagrid('getSelected');  
         if(row){  
             $("#dlg").dialog('open').dialog('setTitle','编辑用户');  
             $('#fm').form('load',row);  
             url='userSave?id='+row.id;  
         }  
     }  
       
       
     function saveUser(){  
         $('#fm').form('submit',{  
             url:url,  
             onSubmit:function(){  
                 return $(this).form('validate');  
             },  
             success:function(result){  
                 var result=eval('('+result+')');  
                 if(result.errorMsg){  
                     $.messager.alert("系统提示",result.errorMsg);  
                     return;  
                 }else{  
                     $.messager.alert("系统提示","保存成功");  
                     $('#dlg').dialog('close');  
                     $("#dg").datagrid("reload");  
                 }  
             }  
         });  
     }  
	 
	 
