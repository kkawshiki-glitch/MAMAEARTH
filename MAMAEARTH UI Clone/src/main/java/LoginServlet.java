import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // GET FORM DATA

        String email =
        request.getParameter("email");

        String password =
        request.getParameter("password");

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

            // SQL QUERY

            PreparedStatement ps =
            con.prepareStatement(

            "select * from users where email=? and password=?"

            );

            // SET VALUES

            ps.setString(1, email);

            ps.setString(2, password);

            // EXECUTE QUERY

            ResultSet rs =
            ps.executeQuery();

            // LOGIN SUCCESS

            if(rs.next()){

                // CREATE SESSION

                HttpSession session =
                request.getSession();

                // STORE USER NAME

                session.setAttribute(

                "name",

                rs.getString("fname")

                );

                // STORE EMAIL

                session.setAttribute(

                "email",

                rs.getString("email")

                );

                // REDIRECT

                response.sendRedirect(

                "Homepage.jsp"

                );

            }

            // LOGIN FAILED

            else{

                response.getWriter().println(

                "<h2 style='color:red;text-align:center;'>Invalid Email or Password</h2>"

                );

            }

            // CLOSE CONNECTION

            con.close();

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(e);

        }

    }
}