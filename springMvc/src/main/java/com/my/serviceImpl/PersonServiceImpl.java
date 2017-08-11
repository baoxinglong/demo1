package com.my.serviceImpl;

import java.io.Serializable;
import java.util.List;




import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import org.springframework.transaction.annotation.Transactional;

import com.my.daoImpl.PersomDaoImpl;
import com.my.model.DataGrid;
import com.my.model.PageHelper;
import com.my.model.Person;
import com.my.service.PersonService;

@Service("PersonService")
public class PersonServiceImpl implements PersonService{
	@Resource
	private PersomDaoImpl dao;
	@Override
	public DataGrid findPerson(PageHelper pg) {
		// TODO Auto-generated method stub
		return dao.findPerson(pg);
	}

	@Override
	public Serializable addPerson(Person p) {
		
		return dao.addPerson(p);
		
	}

	@Override
	public List<Person> findallPerson() {
		// TODO Auto-generated method stub
		return dao.findallPerson();
	}

}
