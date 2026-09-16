import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        String product = request.getParameter("product");
        String search = request.getParameter("search");

        try {

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/beautycare","root","password");

            // Insert Query
            String query = "INSERT INTO user_actions(product_name, action_type, search_text) VALUES(?,?,?)";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, product);
            pst.setString(2, action);
            pst.setString(3, search);

            pst.executeUpdate();

            out.println("<html><body>");

            if(search != null){
                out.println("<h2>Search Result for: " + search + "</h2>");
            }

            if(action != null){

                if(action.equals("Add to Cart")){
                    out.println("<h2>" + product + " added to cart!</h2>");
                }

                else if(action.equals("Wishlist")){
                    out.println("<h2>" + product + " added to wishlist!</h2>");
                }

                else if(action.equals("Checkout")){
                    out.println("<h2>Proceeding to Checkout...</h2>");
                }
            }

            out.println("<br><a href='User.jsp'>Back</a>");

            out.println("</body></html>");

            con.close();

        } catch (Exception e) {

            out.println(e);

        }
    }
}