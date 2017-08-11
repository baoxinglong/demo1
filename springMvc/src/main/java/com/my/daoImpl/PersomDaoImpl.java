package com.my.daoImpl;

import java.io.Serializable;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.my.dao.PersonDao;
import com.my.model.DataGrid;
import com.my.model.PageHelper;
import com.my.model.Person;
import com.mysql.jdbc.Connection;

@Repository("PersomDao")  
public class PersomDaoImpl implements PersonDao{
	
	@Resource
	
	private SessionFactory sessionFactory;  
	  	  	    
	@Override
	@Transactional(readOnly=true)
	public DataGrid findPerson(PageHelper pg) {
		// TODO Auto-generated method stub		
		DataGrid dg = new DataGrid();
		int page = pg.getPage();
		int rows = pg.getRows();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageSize", rows);   //页面的大小
		map.put("curRow",(page-1)*rows);  //当前记录数
		List<Person> person = sessionFactory.getCurrentSession().createQuery("from Person").setFirstResult((page-1)*rows).setMaxResults(rows).list();
		dg.setRows(person);    //设置数据
		
		System.out.println(sessionFactory.getCurrentSession().createQuery("select count(*) from Person").uniqueResult());
		dg.setTotal((long)sessionFactory.getCurrentSession().createQuery("select count(*) from Person").uniqueResult());   //设置数据表格记录数				
		return dg;
	}

	@Override
	@Transactional(readOnly=false)
	public Serializable addPerson(Person p) {		
		return sessionFactory.getCurrentSession().save(p);
	
	}
	@Override
	public List<Person> findallPerson() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Person").list();
	}

	
	
	public void addPersonTest() {
		Person person=new Person();
		person.setName("张三");
		person.setAge(13);
		person.setGender("男");
		sessionFactory.getCurrentSession().save(person);
	
	}
	
	
	public void say(){
		ApplicationContext ac = new ClassPathXmlApplicationContext("/config/hibernate.cfg.xml");
		SessionFactory fc=(SessionFactory) ac.getBean("sessionFactory");
		Session session=fc.openSession();
		Person person=new Person();
		person.setName("张三");
		person.setAge(12);
		person.setGender("男");
		session.save(person);
		
		
		
	     
	}
	@Test
	public void test(){
	    String url = "jdbc:mysql://127.0.0.1/test";  
	    String name = "com.mysql.jdbc.Driver";  
	    String user = "root";  
	    String password = "9721";  
	  
	    Connection conn = null;  
	    PreparedStatement pst = null;  
	  
	    
	        try {  
	            Class.forName(name);//指定连接类型  
	            conn = (Connection) DriverManager.getConnection(url, user, password);//获取连接  
	            System.out.println(conn);
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	     
	  
	}
	public static void main(String[] args) {
		PersomDaoImpl p=new PersomDaoImpl();
		System.out.println(p.sessionFactory);
	
	}

	
	

}
