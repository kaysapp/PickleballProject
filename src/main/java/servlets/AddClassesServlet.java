package servlets;

import models.ClassModel;
import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "AddClassesServlet", value = "/AddClassesServlet")
public class AddClassesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sdate = request.getParameter("cdate");
        String stime = request.getParameter("ctime");
        String teacher = request.getParameter("cteacher");
        String level = request.getParameter("clevel");
        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();
        try {
            boolean result = db.addClasses(sdate, stime, teacher, level);
            if (result) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminpage.jsp");
                request.setAttribute("message", "Class Added");
                requestDispatcher.forward(request, response);
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminpage.jsp");
                request.setAttribute("message", "Something went wrong! Did not work.");
                requestDispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
