package com.example.demo.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.PackagesMasters;


public interface PackageMasterRepo extends CrudRepository<PackagesMasters, Integer> {

	PackagesMasters findByPackagename(String packagename);

	Page<PackagesMasters> findAll(Pageable pageable);

}
