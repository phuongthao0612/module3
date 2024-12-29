package service.impl;

import model.User;
import repository.UserRepository;
import service.IService;

import java.util.Comparator;
import java.util.List;

public class UserService implements IService {
    private static UserRepository userRepository = new UserRepository();

    @Override
    public List<User> getAll() {
        List<User> users = userRepository.getAll();
        return users;
    }

    @Override
    public void add(User user) {
        userRepository.add(user);

    }

    @Override
    public void update(User user) {
        userRepository.update(user);

    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);

    }

    @Override
    public User getById(int id) {
        return userRepository.getById(id);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return userRepository.searchByCountry(country);
    }

    @Override
    public List<User> getSortByName() {
        List<User> users = getAll();
        users.sort(Comparator.comparing(User::getName));
        return users;
    }

}
