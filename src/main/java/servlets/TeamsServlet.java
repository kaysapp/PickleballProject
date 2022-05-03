package servlets;

import models.TeamsModel;
import services.MySQLdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import static java.lang.System.out;

@WebServlet(name = "TeamsServlet", value = "/TeamsServlet")
public class TeamsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ttype = request.getParameter("ttype");
        MySQLdb db = MySQLdb.getInstance();
        try {
            List<String> teamtypes = db.fetchTeamTypes();
            request.setAttribute("list_of_types", teamtypes);

            List<TeamsModel> teamsModelList = db.fetchTeams(ttype);
            request.setAttribute("list_of_teams", teamsModelList);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("teams.jsp");
        requestDispatcher.forward(request, response);
    }
}

