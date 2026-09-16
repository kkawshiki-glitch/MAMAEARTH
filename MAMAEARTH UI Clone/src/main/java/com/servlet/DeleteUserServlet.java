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

@WebServlet("/DeleteUserServlet")

public class DeleteUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // GET USER ID

        String id =
        request.getParameter("id");

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

            "delete from users where id=?"

            );

            // SET ID

            ps.setInt(1,
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