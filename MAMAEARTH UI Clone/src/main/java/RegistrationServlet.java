import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegistrationServlet")

public class RegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // GET FORM DATA

        String fname =
        request.getParameter("fname");

        String lname =
        request.getParameter("lname");

        String email =
        request.getParameter("email");

        String phone =
        request.getParameter("phone");

        String password =
        request.getParameter("password");

        String gender =
        request.getParameter("gender");

        try {

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

            // INSERT USER

            PreparedStatement ps =
            con.prepareStatement(

            "insert into users(fname,lname,email,phone,password,gender) values(?,?,?,?,?,?)"

            );

            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, password);
            ps.setString(6, gender);

            int i =
            ps.executeUpdate();

            if(i > 0){

                // CREATE SESSION

                HttpSession session =
                request.getSession();

                // STORE USER NAME

                session.setAttribute(
                "name",
                fname
                );

                // STORE USER EMAIL

                session.setAttribute(
                "email",
                email
                );

                // REDIRECT TO HOME PAGE

                response.sendRedirect(
                "Homepage.jsp"
                );

            }
            else{

                response.getWriter().println(

                "<h2 style='color:red;text-align:center;'>Registration Failed</h2>"

                );

            }

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(e);

        }

    }
}