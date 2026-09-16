import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        try {

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/beautycare","root","password");

            out.println("<html><body>");

            // ADD PRODUCT
            if(action.equals("Add Product")) {

                String product = request.getParameter("product");

                String query = "INSERT INTO products(product_name) VALUES(?)";

                PreparedStatement pst = con.prepareStatement(query);

                pst.setString(1, product);

                pst.executeUpdate();

                out.println("<h2>Product Added Successfully!</h2>");
            }

            // DELETE PRODUCT
            else if(action.equals("Delete Product")) {

                String product = request.getParameter("product");

                String query = "DELETE FROM products WHERE product_name=?";

                PreparedStatement pst = con.prepareStatement(query);

                pst.setString(1, product);

                pst.executeUpdate();

                out.println("<h2>Product Deleted Successfully!</h2>");
            }

            // VIEW ORDERS
            else if(action.equals("View Orders")) {

                String query = "SELECT * FROM orders";

                PreparedStatement pst = con.prepareStatement(query);

                ResultSet rs = pst.executeQuery();

                out.println("<h2>Orders List</h2>");

                while(rs.next()) {

                    out.println("Order ID: " +
                            rs.getString("order_id") + "<br>");
                }
            }

            // VIEW USERS
            else if(action.equals("View Users")) {

                String query = "SELECT * FROM users";

                PreparedStatement pst = con.prepareStatement(query);

                ResultSet rs = pst.executeQuery();

                out.println("<h2>User List</h2>");

                while(rs.next()) {

                    out.println("Username: " +
                            rs.getString("username") + "<br>");
                }
            }

            out.println("<br><a href='admin.jsp'>Back</a>");

            out.println("</body></html>");

            con.close();

        } catch(Exception e) {

            out.println(e);

        }
    }
}