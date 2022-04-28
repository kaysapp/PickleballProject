package servlets;

import models.UserModel;
import services.MySQLdb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid = request.getParameter("username");
        String password = request.getParameter("password");


        MySQLdb db = MySQLdb.getInstance();
        UserModel userModel = null;
        try {
            userModel = db.doLogin(userid, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (userModel != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", userModel);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
            request.setAttribute("error1", "Incorrect email or password. Please try again or Sign Up");
            requestDispatcher.forward(request, response);
        }
    }
}
