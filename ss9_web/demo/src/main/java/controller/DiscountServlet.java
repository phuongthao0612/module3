package controller;

import service.DiscountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/discount")
public class DiscountServlet extends HttpServlet {
    private DiscountService discountService = new DiscountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/view/discount.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String priceStr = req.getParameter("price");
        String discountPercentStr = req.getParameter("percent");
        if (priceStr == null || discountPercentStr == null || priceStr.isEmpty() || discountPercentStr.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
            req.getRequestDispatcher("WEB-INF/view/discount.jsp").forward(req, resp);
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);
            double discountPercent = Double.parseDouble(discountPercentStr);

            if (price <= 0 || discountPercent < 0 || discountPercent > 100) {
                req.setAttribute("error", "Giá và phần trăm giảm phải hợp lệ.");
            } else {
                double discount = discountService.calculateDiscount(price, discountPercent);
                double discountPrice = discountService.calculateDiscountPrice(price, discount);
                req.setAttribute("price", price);
                req.setAttribute("percent", discountPercent);
                req.setAttribute("discount", discount);
                req.setAttribute("discountPrice", discountPrice);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Dữ liệu không hợp lệ.");
        }

        req.getRequestDispatcher("WEB-INF/view/discount.jsp").forward(req, resp);
    }
}
