package com.servlet;

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
import jakarta.servlet.http.HttpSession;

@WebServlet("/Adminlogin")

public class AdminloginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        PrintWriter out = response.getWriter();

        String email =
        request.getParameter("email");

        String password =
        request.getParameter("password");

        try {

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

                "SELECT * FROM admin WHERE email=? AND password=?"

            );

            ps.setString(1, email);

            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            // LOGIN SUCCESS

            if(rs.next()) {

                HttpSession session =
                request.getSession();

                session.setAttribute(
                "admin", email);

                // REDIRECT TO product.jsp

                response.sendRedirect("Product.jsp");

            }

            // LOGIN FAILED

            else {

                out.println(

                "<h3 style='color:red;text-align:center;'>Invalid Admin Login!</h3>"

                );

            }

            con.close();

        }

        catch(Exception e) {

            out.println(e);

        }

    }
}