import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BuyNowServlet")

public class BuyNowServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name =
        request.getParameter("name");

        String price =
        request.getParameter("price");

        HttpSession session =
        request.getSession();

        // CREATE TEMP CART

        List<String> buyNowCart =
        new ArrayList<String>();

        buyNowCart.add(name + "," + price);

        // STORE TEMP CART

        session.setAttribute(
        "cart", buyNowCart);

        // STORE TOTAL

        double total =
        Double.parseDouble(price);

        session.setAttribute(
        "cartTotal", total);

        // DIRECT CHECKOUT

        response.sendRedirect(
        "Checkout.jsp");

    }
}