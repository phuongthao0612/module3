package service;

import model.User;

import java.util.List;

public interface IService {
    List<User> getAll(String country);

    void add(User user);

    void update(User user);

    void delete(int id);


    User getById(int id);

    List<User> getSortByName();
}
