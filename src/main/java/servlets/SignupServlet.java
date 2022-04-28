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

@WebServlet(name = "SignupServlet", value = "/SignupServlet")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean signedup = false;
        String userid = request.getParameter("username2");
        String name = request.getParameter("name2");
        String password = request.getParameter("password2");

        MySQLdb db = MySQLdb.getInstance();
        UserModel userModel = null;
        try {
            signedup = db.doSignup(userid, name, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (signedup){
            try {
                userModel = db.doLogin(userid,password);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (userModel != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", userModel);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
            request.setAttribute("error", "Signup failed..!!!");
            requestDispatcher.forward(request, response);
        }
    }
}
