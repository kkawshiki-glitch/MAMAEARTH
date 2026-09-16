package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateUserServlet")

public class UpdateUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // GET DATA

        String id =
        request.getParameter("id");

        String fname =
        request.getParameter("fname");

        String lname =
        request.getParameter("lname");

        String email =
        request.getParameter("email");

        String phone =
        request.getParameter("phone");

        String gender =
        request.getParameter("gender");

        try{

            // DRIVER

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

            "update users set fname=?, lname=?, email=?, phone=?, gender=? where id=?"

            );

            // SET VALUES

            ps.setString(1, fname);

            ps.setString(2, lname);

            ps.setString(3, email);

            ps.setString(4, phone);

            ps.setString(5, gender);

            ps.setInt(6,
            Integer.parseInt(id));

            // EXECUTE

            ps.executeUpdate();

            // CLOSE

            con.close();

            // REDIRECT

            response.sendRedirect(
            "ManageUsers.jsp");

        }

        catch(Exception e){

            System.out.println(e);

        }

    }
}