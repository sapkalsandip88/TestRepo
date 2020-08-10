package com.example.demo.Repository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.MaxSerailNumber;


public interface MaxSerailNumberRepo extends CrudRepository<MaxSerailNumber, Integer> {

	MaxSerailNumber findByType(String string);

}
