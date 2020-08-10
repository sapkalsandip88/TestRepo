package com.example.demo.Repository;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.PaymentDetails;

public interface PaymentDetailsRepo extends CrudRepository<PaymentDetails, Integer> {

}
