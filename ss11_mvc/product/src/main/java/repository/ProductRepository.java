package repository;

import entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    private static List<Product> products = new ArrayList<Product>();

    static {
        products.add(new Product("kitkat", 10, "matcha"));
        products.add(new Product("bueno", 20, "chocolate"));
        products.add(new Product("ritter", 30, "mix"));
    }

    public List<Product> getAll() {
        return products;
    }

    public void add(Product product) {
        product.setId(products.get(products.size() - 1).getId() + 1);
        products.add(product);
    }

    public void update(Product product) {
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getId() == product.getId()) {
                products.set(i, product);
                break;
            }
        }
    }


    public Product getById(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }

    public void delete(int id) {
        for (Product product : products) {
            if (product.getId() == id) {
                products.remove(product);
                break;
            }
        }
    }

    public List<Product> searchByName(String name) {
        List<Product> result = new ArrayList<>();
        if (name == null || name.isEmpty()) {
            return result;
        }
        for (Product product : products) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(product);
            }
        }
        return result;

    }
}