package service;

import model.Product;

import java.util.List;

public interface IService {
    List<Product> getAll();
    void add(Product product);
}
