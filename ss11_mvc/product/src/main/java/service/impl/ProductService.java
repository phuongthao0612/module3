package service.impl;

import entity.Product;
import repository.ProductRepository;
import service.IService;

import java.util.List;

public class ProductService implements IService {
    private static ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getAll() {
        List<Product> products = productRepository.getAll();
        return products;
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);

    }

    @Override
    public void update(Product product) {
        productRepository.update(product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product getById(int id) {
        return productRepository.getById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.searchByName(name);
    }

}
