package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.CategoryMaster;

public interface CategoryMasterRepo extends CrudRepository<CategoryMaster, Integer> {

	@Query(value="select distinct categoryname from category_master", nativeQuery = true)
	List<String> findDistinctName();

}
