package controller;

import service.CalculatorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {

    private CalculatorService calculatorService = new CalculatorService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/view/calculator.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num1Str = req.getParameter("num1");
        String num2Str = req.getParameter("num2");
        String operation = req.getParameter("operation");

        if (num1Str == null || num2Str == null || operation == null || num1Str.isEmpty() || num2Str.isEmpty()) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
            req.getRequestDispatcher("WEB-INF/view/calculator.jsp").forward(req, resp);
            return;
        }

        try {
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);
            double result = calculatorService.calculate(num1, num2, operation);
            req.setAttribute("result", "Kết quả: " + result);
            req.setAttribute("num1", num1);
            req.setAttribute("num2", num2);
            req.setAttribute("operation", operation);

        } catch (NumberFormatException e) {
            req.setAttribute("error", "Dữ liệu không hợp lệ.");
        } catch (ArithmeticException | IllegalArgumentException e) {
            req.setAttribute("error", "Lỗi: " + e.getMessage());
        }
        req.getRequestDispatcher("WEB-INF/view/calculator.jsp").forward(req, resp);
    }
}
