package service;

public class DiscountService {
    public double calculateDiscount(double price, double discountPercent) {
        return price * discountPercent * 0.01;
    }

    public double calculateDiscountPrice(double price, double discount) {
        return price - discount;
    }
}
