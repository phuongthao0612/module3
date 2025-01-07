package repository;

import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository {
    public List<Product> getAll() {
        List<Product> products = new ArrayList<Product>();
        try (PreparedStatement statement = BaseRepository.getConnection().prepareStatement("select * from products");
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                double discount = resultSet.getDouble("discount");
                int stock = resultSet.getInt("stock");
                products.add(new Product(id, name, price, discount, stock));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return products;
    }

    public void add(Product product) {
        try (PreparedStatement statement = BaseRepository.getConnection()
                .prepareStatement("insert into products (product_name, product_price, discount, stock) values (?,?,?,?)")) {
            statement.setString(1, product.getName());
            statement.setDouble(2,product.getPrice());
            statement.setDouble(3,product.getDiscount());
            statement.setInt(4, product.getStock());
            statement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void searchProduct(String productName) {}
}
