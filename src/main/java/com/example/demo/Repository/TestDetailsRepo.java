package com.example.demo.Repository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.TestDetails;


public interface TestDetailsRepo extends CrudRepository<TestDetails, Integer> {

}
