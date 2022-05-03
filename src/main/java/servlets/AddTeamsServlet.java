package servlets;

import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddTeamsServlet", value = "/AddTeamsServlet")
public class AddTeamsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tname = request.getParameter("tname");
        String member1 = request.getParameter("member1");
        String member2 = request.getParameter("member2");
        String ttype = request.getParameter("teamtype");
        HttpSession session = request.getSession();
        MySQLdb db = MySQLdb.getInstance();
        try {
            boolean result = db.addTeams(tname, member1, member2, ttype);
            if (result) {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminpage.jsp");
                request.setAttribute("message2", "Team Added");
                requestDispatcher.forward(request, response);
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminpage.jsp");
                request.setAttribute("message2", "Something went wrong! Did not work.");
                requestDispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
