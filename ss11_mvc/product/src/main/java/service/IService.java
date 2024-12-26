package service;

import entity.Product;

import java.util.List;

public interface IService {
    List<Product> getAll();
    void add(Product product);
    void update(Product product);
    void delete(int id);
    Product getById(int id);

    List<Product> searchByName(String name);
}