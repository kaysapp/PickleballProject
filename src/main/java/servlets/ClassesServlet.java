package servlets;

import models.ClassModel;
import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "ClassesServlet", value = "/ClassesServlet")
public class ClassesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teacher="all";
        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();
        try {
//            out.println(teacher);
            List<ClassModel> classModelList = db.fetchClasses(teacher);
            request.setAttribute("list_of_classes", classModelList);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("learn.jsp");
        requestDispatcher.forward(request, response);

    }
}
