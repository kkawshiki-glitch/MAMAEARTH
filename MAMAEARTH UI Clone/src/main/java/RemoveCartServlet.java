import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RemoveCartServlet")

public class RemoveCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String item =
        request.getParameter("item");

        HttpSession session =
        request.getSession();

        List<String> cart =
        (List<String>) session.getAttribute("cart");

        if(cart != null){

            cart.remove(item);

        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");

    }
}