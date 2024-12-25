package repository;

import entity.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {
    private static List<Customer> customers = new ArrayList<Customer>();

    static {
        customers.add(new Customer("Shinichi", "04/05/2000", "Tokyo", "https://cly.1cdn.vn/2014/11/02/congly-vn_kudojpg1414806854.jpg"));
        customers.add(new Customer("Ran", "01/10/2000", "Tokyo", "https://cdn.popsww.com/blog/sites/2/2023/03/ran-mori-thien-than-anh-sang.jpg"));
        customers.add(new Customer("Heiji", "01/08/2000", "Osaka", "https://cdn.popsww.com/blog/sites/2/2023/03/Hattori-Heiji-luc-nho.jpg"));
        customers.add(new Customer("Kazuha", "01/09/2000", "Osaka", "https://www.detectiveconanworld.com/wiki/images/thumb/7/77/Kazuha_Toyama_Profile.jpg/413px-Kazuha_Toyama_Profile.jpg"));
    }

    public List<Customer> getAll() {
        return customers;
    }
}
