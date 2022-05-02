package servlets;

import models.UserModel;
import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet(name = "EnrollServlet", value = "/EnrollServlet")
public class EnrollServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int class_id = Integer.parseInt(request.getParameter("class_id"));
        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();
        if (session != null) {
            if (session.getAttribute("user") != null) {
                try {
                    UserModel user = (UserModel) session.getAttribute("user");
                    boolean result = db.doReserve(user.getUser_id(), class_id);

                    if(result) {
                        out.println("enrolling");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("classes.jsp");
                        request.setAttribute("message", "You are enrolled.!");
                        requestDispatcher.forward(request, response);
                    } else {
                        out.println("not enrolling");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("classes.jsp");
                        request.setAttribute("message", "Something went wrong! Did not get true result.!");
                        requestDispatcher.forward(request, response);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("classes.jsp");
                request.setAttribute("error", "Please login to continue..!!!");
                requestDispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("classes.jsp");
            request.setAttribute("error", "Please login to continue..!!!");
            requestDispatcher.forward(request, response);
        }
    }
}
