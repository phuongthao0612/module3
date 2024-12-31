package repository;

import model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {
    private static List<User> users = new ArrayList<>();

    public List<User> getAll(String country) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        if (country != null && !country.isEmpty()) {
            sql += " WHERE country LIKE ?";
        }

        try (PreparedStatement statement = BaseRepository.getConnection().prepareStatement(sql)) {
            if (country != null && !country.isEmpty()) {
                statement.setString(1, "%" + country + "%");
            }
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name_user");
                String email = resultSet.getString("email");
                String countryFromDB = resultSet.getString("country");
                users.add(new User(id, name, email, countryFromDB));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }


    public void add(User user) {
        try {
            PreparedStatement statement = BaseRepository.getConnection().
                    prepareStatement("insert into users(name_user,email,country) values (?,?,?)");
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void update(User user) {
        try {
            PreparedStatement statement = BaseRepository.getConnection().
                    prepareStatement("UPDATE users SET name_user = ?, email = ?, country = ? WHERE id = ?");
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public void delete(int id) {
        PreparedStatement statement = null;
        try {
            statement = BaseRepository.getConnection()
                    .prepareStatement("delete from users where id = ?");
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public User getById(int id) {
        User user = null;
        try {
            PreparedStatement statement = BaseRepository.getConnection().
                    prepareStatement("select * from users where id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name_user");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

}
