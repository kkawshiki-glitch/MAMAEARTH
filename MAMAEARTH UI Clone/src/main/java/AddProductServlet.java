
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddProductServlet")

public class AddProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // GET DATA

        String pname =
        request.getParameter("pname");

        String price =
        request.getParameter("price");

        String category =
        request.getParameter("category");

        String image =
        request.getParameter("image");

        String description =
        request.getParameter("description");

        try{

            // LOAD DRIVER

            Class.forName(
            "com.mysql.cj.jdbc.Driver");
            

            // CONNECTION

            Connection con =
            DriverManager.getConnection(

            "jdbc:mysql://localhost:3306/beautycare",
            "root",
            "password"

            );

            // QUERY

            PreparedStatement ps =
            con.prepareStatement(

            "insert into products(pname,price,category,image,description) values(?,?,?,?,?)"

            );

            // SET VALUES

            ps.setString(1, pname);

            ps.setInt(2,
            Integer.parseInt(price));

            ps.setString(3, category);

            ps.setString(4, image);

            ps.setString(5, description);

            // EXECUTE

            ps.executeUpdate();

            // CLOSE

            con.close();

            // REDIRECT

            response.sendRedirect(
            "Product.jsp");

        }

        catch(Exception e){

            System.out.println(e);

        }

    }
}