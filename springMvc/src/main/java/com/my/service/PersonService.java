package com.my.service;



import java.io.Serializable;
import java.util.List;

import com.my.model.DataGrid;
import com.my.model.PageHelper;
import com.my.model.Person;

public interface PersonService {
	public DataGrid findPerson(PageHelper pg);
	public Serializable addPerson(Person p);
	public List<Person> findallPerson();
}
