package service.impl;


import entity.Customer;
import repository.CustomerRepository;
import service.IService;

import java.util.List;

public class CustomerService implements IService {
    private static CustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> getAll() {
        List<Customer> customers = customerRepository.getAll();
        return customers;
    }
}
