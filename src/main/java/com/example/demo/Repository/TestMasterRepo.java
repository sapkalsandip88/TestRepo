package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.TestMaster;


public interface TestMasterRepo extends PagingAndSortingRepository<TestMaster, Integer> {

	TestMaster findByTestname(String testname);

	@Query(value = "SELECT * FROM test_master t WHERE t.testname like LOWER(CONCAT('%',:testname, '%'))", nativeQuery = true)
	List<TestMaster> findAllByChar(@Param("testname") String testname);

	Page<TestMaster> findAll(Pageable pageable);
	
	@Query(value = "SELECT * FROM test_master t WHERE t.category =:categoryName", nativeQuery = true)
	Page<TestMaster> findByCategoryName(Pageable pageable, String categoryName);

	@Query(value = "SELECT * FROM test_master t WHERE t.discount >:discount", nativeQuery = true)
	Page<TestMaster> findByDiscount(Pageable pageable, float discount);
	
	
}
