import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateProductServlet")

public class UpdateProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // GET FORM DATA

        String id =
        request.getParameter("id");

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

            // UPDATE QUERY

            PreparedStatement ps =
            con.prepareStatement(

            "update products set pname=?, price=?, category=?, image=?, description=? where id=?"

            );

            // SET VALUES

            ps.setString(1, pname);

            ps.setInt(2,
            Integer.parseInt(price));

            ps.setString(3, category);

            ps.setString(4, image);

            ps.setString(5, description);

            ps.setInt(6,
            Integer.parseInt(id));

            // EXECUTE

            ps.executeUpdate();

            // CLOSE

            con.close();

            // REDIRECT

            response.sendRedirect(
            "EditProduct.jsp");

        }

        catch(Exception e){

            System.out.println(e);

        }

    }
}