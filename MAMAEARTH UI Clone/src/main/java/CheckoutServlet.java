import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckoutServlet")

public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // GET FORM DATA

        String fullname =
        request.getParameter("fullname");

        String phone =
        request.getParameter("phone");

        String address =
        request.getParameter("address");

        String city =
        request.getParameter("city");

        String state =
        request.getParameter("state");

        String pincode =
        request.getParameter("pincode");

        String payment =
        request.getParameter("payment");

        // SESSION

        HttpSession session =
        request.getSession();

        // STORE DATA

        session.setAttribute(
        "fullname", fullname);

        session.setAttribute(
        "phone", phone);

        session.setAttribute(
        "address", address);

        session.setAttribute(
        "city", city);

        session.setAttribute(
        "state", state);

        session.setAttribute(
        "pincode", pincode);

        // IMPORTANT

        session.setAttribute(
        "payment", payment);

        // REDIRECT

        response.sendRedirect(
        "Payment.jsp");

    }
}