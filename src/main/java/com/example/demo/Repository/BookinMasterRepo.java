package com.example.demo.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.BookingMaster;


public interface BookinMasterRepo extends CrudRepository<BookingMaster, Integer> { 
	
	BookingMaster findByBookingno(String Bookingno);

	
	List<BookingMaster> findAllByBookedby(String lastmodby);

}
