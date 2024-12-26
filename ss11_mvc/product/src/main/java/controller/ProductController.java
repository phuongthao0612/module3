package controller;

import entity.Product;
import service.IService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    private static final IService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        String message = req.getParameter("message");
        if (message != null) {
            switch (message) {
                case "created":
                    req.setAttribute("message", "Thêm mới thành công");
                    break;
                case "updated":
                    req.setAttribute("message", "Cập nhật thành công");
                    break;
                case "deleted":
                    req.setAttribute("message", "Xóa thành công");
                    break;
                default:
                    req.setAttribute("message", "Có lỗi xảy ra");
                    break;
            }
        }
        String keyword = req.getParameter("keyword");
        List<Product> products;
        if (keyword != null && !keyword.isEmpty()) {
            products = productService.searchByName(keyword);
        } else {
            products = productService.getAll();
        }
        req.setAttribute("products", products);

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                req.getRequestDispatcher("WEB-INF/view/product/create.jsp").forward(req, resp);
                break;
            case "update":
                String idToUpdate = req.getParameter("id");
                if (idToUpdate != null) {
                    Product productToUpdate = productService.getById(Integer.parseInt(idToUpdate));
                    req.setAttribute("product", productToUpdate);
                    req.getRequestDispatcher("WEB-INF/view/product/update.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("/product");
                }
                break;
            case "delete":
                String idToDelete = req.getParameter("id");
                if (idToDelete != null) {
                    productService.delete(Integer.parseInt(idToDelete));
                    resp.sendRedirect("/product?message=deleted");
                } else {
                    resp.sendRedirect("/product");
                }
                break;
            default:
                req.getRequestDispatcher("WEB-INF/view/product/list.jsp").forward(req, resp);
                break;
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
                String name = req.getParameter("name");
                String price = req.getParameter("price");
                String description = req.getParameter("description");
                Product product = new Product(name, Double.parseDouble(price), description);
                productService.add(product);
                resp.sendRedirect("/product?message=created");
                break;
            case "update":
                String id = req.getParameter("id");
                String updatedName = req.getParameter("name");
                String updatedPrice = req.getParameter("price");
                String updatedDescription = req.getParameter("description");

                if (id != null) {
                    Product updatedProduct = new Product(Integer.parseInt(id), updatedName, Double.parseDouble(updatedPrice), updatedDescription);
                    productService.update(updatedProduct);
                    resp.sendRedirect("/product?message=updated");
                } else {
                    resp.sendRedirect("/product");
                }
                break;
        }
    }

}
