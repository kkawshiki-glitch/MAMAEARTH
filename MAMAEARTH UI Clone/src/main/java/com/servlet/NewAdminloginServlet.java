package com.servlet;

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

@WebServlet("/NewAdminlogin")
public class NewAdminloginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/beautycare",
                "root",
                "password"
            );

            // SQL Query
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO admin(name,email,username,password) VALUES(?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);

            int i = ps.executeUpdate();

            if(i > 0){

                response.sendRedirect("Product.jsp");

            } else {

                out.println("<h3>Admin Registration Failed!</h3>");

            }

            con.close();

        } catch(Exception e) {

            out.println(e);

        }
    }
}