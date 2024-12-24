package com.example.demo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/view/discount.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String discountPercentStr = req.getParameter("percent");
        if (description == null || priceStr == null || discountPercentStr == null || priceStr.isEmpty() || discountPercentStr.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
            req.getRequestDispatcher("WEB-INF/view/discount.jsp").forward(req, resp);
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);
            double discountPercent = Double.parseDouble(discountPercentStr);
            if (price < 0 || discountPercent < 0 || discountPercent > 100) {
                req.setAttribute("error", "Giá trị không hợp lệ. Giá phải >= 0 và phần trăm giảm giá phải từ 0 đến 100.");
                req.getRequestDispatcher("WEB-INF/view/discount.jsp").forward(req, resp);
                return;
            }
            double discount = price * discountPercent * 0.01;
            double discountPrice = price - discount;
            req.setAttribute("description", description);
            req.setAttribute("price", price);
            req.setAttribute("percent", discountPercent);
            req.setAttribute("discount", discount);
            req.setAttribute("discountPrice", discountPrice);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Vui lòng nhập số hợp lệ cho giá và phần trăm.");
        }
        req.getRequestDispatcher("WEB-INF/view/discount.jsp").forward(req, resp);
    }

}
