

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PaymentServlet")

public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // SESSION

        HttpSession session =
        request.getSession();

        // USER DATA FROM SESSION

        String email =
        (String)session.getAttribute(
        "email");

        String name =
        (String)session.getAttribute(
        "name");

        // FORM DATA

        String productname =
        request.getParameter(
        "productname");

        String price =
        request.getParameter(
        "price");

        String paymentmethod =
        request.getParameter(
        "paymentmethod");

        String address =
        request.getParameter(
        "address");

        String details =
        request.getParameter(
        "details");

        // GENERATE TRANSACTION ID

        String transactionid =
        "TXN" +
        UUID.randomUUID()
        .toString()
        .substring(0,8);

        try{

            // LOAD DRIVER

            Class.forName(
            "com.mysql.cj.jdbc.Driver");

            // DATABASE CONNECTION

            Connection con =
            DriverManager.getConnection(

            "jdbc:mysql://localhost:3306/beautycare",
            "root",
            "password"

            );

            // INSERT QUERY

            PreparedStatement ps =
            con.prepareStatement(

            "insert into orders(transactionid,name,useremail,productname,price,paymentmethod,address,details) values(?,?,?,?,?,?,?,?)"

            );

            // SET VALUES

            ps.setString(1,
            transactionid);

            ps.setString(2,
            name);

            ps.setString(3,
            email);

            ps.setString(4,
            productname);

            ps.setInt(5,
            Integer.parseInt(price));

            ps.setString(6,
            paymentmethod);

            ps.setString(7,
            address);

            ps.setString(8,
            details);

            // EXECUTE QUERY

            ps.executeUpdate();

            // STORE ORDER DETAILS IN SESSION

            session.setAttribute(
            "orderId",
            transactionid);

            session.setAttribute(
            "fullname",
            name);

            // CLOSE CONNECTION

            con.close();

            // REDIRECT

            response.sendRedirect(
            "OrderSuccess.jsp");

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(e);

        }

    }
}