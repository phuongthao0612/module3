package controller;

import model.User;
import service.IService;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    private static final IService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                req.getRequestDispatcher("WEB-INF/view/user/create.jsp").forward(req, resp);
                break;
            case "update":
                showEditForm(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            case "sortByName":
                sortByName(req, resp);
                break;
            default:
                searchByCountry(req, resp);
                break;
        }
    }

    private static void searchByCountry(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String countrySearch = req.getParameter("country");
        List<User> users;
        if (countrySearch != null && !countrySearch.isEmpty()) {
            users = userService.searchByCountry(countrySearch);
        } else {
            users = userService.getAll();
        }
        req.setAttribute("users", users);
        req.setAttribute("countrySearch", countrySearch);
        req.getRequestDispatcher("WEB-INF/view/user/list.jsp").forward(req, resp);
    }


    private void sortByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userService.getSortByName();
        req.setAttribute("users", users);
        req.getRequestDispatcher("WEB-INF/view/user/list.jsp").forward(req, resp);
    }


    private static void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            User userToUpdate = userService.getById(Integer.parseInt(id));
            req.setAttribute("user", userToUpdate);
            req.getRequestDispatcher("WEB-INF/view/user/update.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/user");
        }
    }

    private static void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idToDelete = req.getParameter("id");
        if (idToDelete != null) {
            userService.delete(Integer.parseInt(idToDelete));
            resp.sendRedirect("/user?message=deleted");
        } else {
            resp.sendRedirect("/user");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertUser(req, resp);
                break;
            case "update":
                updateUser(req, resp);
                break;
        }
    }

    private static void insertUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email, country);
        userService.add(user);
        resp.sendRedirect("/user?message=created");
    }

    private static void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        String updatedName = req.getParameter("updatedName");
        String updatedEmail = req.getParameter("updatedEmail");
        String updatedCountry = req.getParameter("updatedCountry");
        if (id != null && !id.isEmpty()) {
            User user = userService.getById(Integer.parseInt(id));
            if (user != null) {
                if (updatedName != null && !updatedName.isEmpty()) {
                    user.setName(updatedName);
                }
                if (updatedEmail != null && !updatedEmail.isEmpty()) {
                    user.setEmail(updatedEmail);
                }
                if (updatedCountry != null && !updatedCountry.isEmpty()) {
                    user.setCountry(updatedCountry);
                }
                userService.update(user);
                resp.sendRedirect("/user?message=updated");
            } else {
                resp.sendRedirect("/user?error=user_not_found");
            }
        } else {
            resp.sendRedirect("/user");
        }
    }
}
