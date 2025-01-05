
package controller;

import dto.CustomerDTO;
import model.Customer;
import model.GymClass;
import service.ICustomerService;
import service.IGymClassService;
import service.impl.CustomerService;
import service.impl.GymClassService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerController", value = "/customer")
public class CustomerController extends HttpServlet {
    private static ICustomerService customerService = new CustomerService();
    private static IGymClassService gymClassService = new GymClassService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        // Xử lý nếu không có action, nhưng có tham số searchName
        if (action.isEmpty() && req.getParameter("searchName") != null) {
            // Gọi hàm tìm kiếm nếu có tham số searchName
            searchCustomer(req, resp);
            return; // Dừng lại ở đây để không tiếp tục thực hiện default case
        }

        switch (action) {
            case "create":
                List<GymClass> gymClasses = gymClassService.getAll();
                System.out.println(gymClasses);
                req.setAttribute("gymClasses", gymClasses);
                req.getRequestDispatcher("WEB-INF/view/customer/create.jsp").forward(req, resp);
                break;
            case "update":
                showEditForm(req, resp);
                break;
            case "delete":
                deleteCustomer(req, resp);
                break;
            case "search":
                searchCustomer(req, resp);
                break;
            default:
                String message = req.getParameter("message");
                if (message != null) {
                    if (message.equals("deleted")) {
                        req.setAttribute("message", "Xóa thành công.");
                    } else if (message.equals("created")) {
                        req.setAttribute("message", "Têm mới thành công.");
                    }
                }
                List<CustomerDTO> customers = customerService.getAllDTO();
                req.setAttribute("customers", customers);
                req.getRequestDispatcher("WEB-INF/view/customer/list.jsp").forward(req, resp);
                break;
        }
    }

    private void searchCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchName = req.getParameter("searchName");
        List<CustomerDTO> customers;
        if (searchName != null && !searchName.isEmpty()) {

            customers = customerService.searchByName(searchName);
            req.setAttribute("searchName", searchName);
        } else {
            customers = customerService.getAllDTO();
        }
        req.setAttribute("customers", customers);

        req.getRequestDispatcher("WEB-INF/view/customer/list.jsp").forward(req, resp);
    }



    private static void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id != null) {
            Customer customerToUpdate = customerService.getById(Integer.parseInt(id));
            req.setAttribute("customer", customerToUpdate);
            List<GymClass> gymClasses = gymClassService.getAll();
            req.setAttribute("gymClasses", gymClasses);

            req.getRequestDispatcher("WEB-INF/view/customer/update.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("/customer");
        }
    }


    private static void deleteCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String idToDelete = req.getParameter("id");
        if (idToDelete != null) {
            customerService.delete(Integer.parseInt(idToDelete));
            resp.sendRedirect("/customer?message=deleted");
        } else {
            resp.sendRedirect("/customer");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertCustomer(req, resp);
                break;
            case "update":
                updateCustomer(req, resp);
                break;
        }
    }

    private static void insertCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        int age = 0;
        String ageParam = req.getParameter("age");
        if (ageParam != null && !ageParam.isEmpty()) {
            try {
                age = Integer.parseInt(ageParam);
            } catch (NumberFormatException e) {
                resp.sendRedirect("Error! Tuổi phải là một số.");
                return;
            }
        } else {
            resp.sendRedirect("Error! Tuổi bắt buộc phải nhập.");
            return;
        }

        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        Integer idClass = null;
        String idClassParam = req.getParameter("idClass");
        if (idClassParam != null && !idClassParam.isEmpty()) {
            try {
                idClass = Integer.valueOf(idClassParam);
            } catch (NumberFormatException e) {
                resp.sendRedirect("errorPage.jsp?error=idClass must be a valid number");
                return;
            }
        } else {
            resp.sendRedirect("errorPage.jsp?error=idClass is required");
            return;
        }
        Customer customer = new Customer(name, phone, age, email, idClass);
        customerService.add(customer);
        resp.sendRedirect("/customer?message=created");
    }

    private static void updateCustomer(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String id = req.getParameter("id");
        String updatedName = req.getParameter("updatedName");
        String updatedAge = req.getParameter("updatedAge");
        String updatedPhone = req.getParameter("updatedPhone");
        String updatedEmail = req.getParameter("updatedEmail");
        String updatedClassId = req.getParameter("updatedClassId");
        if (id == null || updatedName == null || updatedAge == null || updatedPhone == null || updatedEmail == null) {
            resp.sendRedirect("/customer");
            return;
        }
        Customer customer = customerService.getById(Integer.parseInt(id));
        if (customer != null) {
            customer.setName(updatedName);
            customer.setAge(Integer.parseInt(updatedAge));
            customer.setPhone(updatedPhone);
            customer.setEmail(updatedEmail);
            if (updatedClassId != null && !updatedClassId.isEmpty()) {
                customer.setIdClass(Integer.parseInt(updatedClassId));
            }
            customerService.update(customer);
            resp.sendRedirect("/customer?message=updated");
        } else {
            resp.sendRedirect("/customer");
        }
    }
}
