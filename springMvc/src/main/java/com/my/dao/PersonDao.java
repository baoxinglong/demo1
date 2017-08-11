package com.my.dao;

import java.io.Serializable;
import java.util.List;



import java.util.Map;



import com.my.model.DataGrid;
import com.my.model.PageHelper;
import com.my.model.Person;


public interface PersonDao {
	public DataGrid findPerson(PageHelper pg);
	public Serializable addPerson(Person p);
	public List<Person> findallPerson();
	

}
