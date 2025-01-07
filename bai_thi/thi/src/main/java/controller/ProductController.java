package controller;

import model.Product;
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
    private static ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("WEB-INF/product/create.jsp").forward(req, resp);
                break;
            default:
                List<Product> products = productService.getAll();
                req.setAttribute("products", products);
                req.getRequestDispatcher("WEB-INF/home.jsp").forward(req, resp);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = req.getParameter("name");
                Double price = Double.valueOf(req.getParameter("price"));
                Double discount = Double.valueOf(req.getParameter("discount"));
                int stock = Integer.parseInt(req.getParameter("stock"));
                Product product = new Product(name, price, discount, stock);
                productService.add(product);
                resp.sendRedirect("/product?message=created");

        }
    }

}
