import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")

public class AddToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name =
        request.getParameter("name");

        String price =
        request.getParameter("price");

        String item =
        name + "," + price;

        HttpSession session =
        request.getSession();

        List<String> cart =
        (List<String>) session.getAttribute("cart");

        if(cart == null){

            cart = new ArrayList<String>();

        }

        cart.add(item);

        session.setAttribute("cart", cart);

        // RETURN BACK TO HOMEPAGE

        response.sendRedirect("Homepage.jsp");

    }
}