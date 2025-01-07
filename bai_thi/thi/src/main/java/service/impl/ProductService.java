package service.impl;

import model.Product;
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
}
