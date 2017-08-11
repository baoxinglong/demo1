package com.my.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.my.model.DataGrid;
import com.my.model.PageHelper;
import com.my.model.Person;
import com.my.service.PersonService;
import com.my.serviceImpl.PersonServiceImpl;




@Controller
@RequestMapping(value="/hello")
public class HelloConctroller {
	
	@Resource
	private PersonServiceImpl service;
	@RequestMapping(value="/show")
	public String helloworld(Model model){
		System.out.println("进入了controller====show");
		
		
	
		
		return "hello";
		
	}
	@RequestMapping(value="/add")
	@ResponseBody
	public Map<String, Object> addPerson(Model model,Person person){
		Map<String, Object> map=new HashMap<String, Object>();	
		try {
			service.addPerson(person);
			map.put("success", true);
		} catch (Exception e) {
			// TODO: handle exception
			map.put("fail", true);
		}
		
		return map;						
		
	}
	@RequestMapping(value="/toaddpage")
	public ModelAndView toAddPage(){		
		System.out.println("进入了page");
		return new ModelAndView("../jsp/addperson");
	}
	@ResponseBody
	@RequestMapping(value="/manager")
	
	public DataGrid findPerson(Model model,PageHelper pg){
		System.out.println(service.findPerson(pg));
		return service.findPerson(pg);		
	}
	@ResponseBody
	@RequestMapping(value="/dwonload")
	public Map<String, Object> dwonload(){
		Map<String, Object> map=new HashMap<String, Object>();	
		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook(); 
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("person表");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("ID");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);  
        cell.setCellValue("姓名");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("年龄");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3);  
        cell.setCellValue("性别");  
        cell.setCellStyle(style);  
        List list = service.findallPerson();  
        for (int i = 0; i < list.size(); i++)  
        {  
            row = sheet.createRow((int) i + 1);  
            Person person = (Person) list.get(i);  
            // 第四步，创建单元格，并设置值  
            row.createCell((short) 0).setCellValue((double) person.getId());  
            row.createCell((short) 1).setCellValue(person.getName());  
            row.createCell((short) 2).setCellValue((double) person.getAge());  
            row.createCell((short) 3).setCellValue(person.getGender());
            FileOutputStream fout;
			try {
				 fout = new FileOutputStream("D:/person.xls");
				 wb.write(fout);  
		         fout.close();  
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
           
        }  
        map.put("success", true);
		return map;
		
	}
}
