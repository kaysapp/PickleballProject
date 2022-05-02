package services;

import models.ClassModel;
import models.TeamsModel;
import models.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static java.lang.System.out;

public class MySQLdb {
    String url = "jdbc:mysql://localhost:3306/pickleball";
    String username = "root";
    String password = "COMP6000p@ss";
    Connection connection = null;
    static MySQLdb instance = null;


    public MySQLdb() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
    }

    public static synchronized MySQLdb getInstance() {
        if(instance == null) {
            instance = new MySQLdb();
        }
        return instance;
    }

    public UserModel doLogin(String userid, String password) throws SQLException {
        UserModel userModel = null;
        // PreparedStatement

        String qLogin = "SELECT * FROM members WHERE username = ? AND password = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(qLogin);
        preparedStatement.setString(1, userid);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();

        if(resultSet.next()) {
            String name = resultSet.getString("member_name");
            String pass = resultSet.getString("password");
            int uid = resultSet.getInt("user_id");

            userModel = new UserModel(uid,name,username,pass);
        }
        resultSet.close();
 //       statement.close();
        preparedStatement.close();
        return userModel;

    }

    public Boolean doSignup(String uname, String fullname, String pass) throws SQLException {
        Boolean signup = false;
        String qDoReserve = "INSERT INTO members(member_name,username,password) VALUES(?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(qDoReserve);
        preparedStatement.setString(1, fullname);
        preparedStatement.setString(2, uname);
        preparedStatement.setString(3, pass);
        int rows_update = preparedStatement.executeUpdate();
        if(rows_update > 0) {
            signup = true;
        }
        preparedStatement.close();
        return signup;
    }

    public List<ClassModel> fetchClasses(String c_level) throws SQLException {
        String qGetClass = null;
        List<ClassModel> list = new ArrayList<>();
        if(Objects.equals(c_level, "all")) {
            qGetClass = "SELECT * FROM lessons WHERE class_date >= CURRENT_DATE ";
        } else {
            qGetClass = "SELECT * FROM lessons WHERE class_date >= CURRENT_DATE AND level = '"+c_level+"'";
        }
        PreparedStatement preparedStatement = connection.prepareStatement(qGetClass);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            int class_id = resultSet.getInt("class_id");
            String class_date = resultSet.getString("class_date");
            String class_time= resultSet.getString("class_time");
            String instructor2 = resultSet.getString("instructor");
            String level = resultSet.getString("level");
            ClassModel classModel = new ClassModel(class_id, class_date, class_time, instructor2, level);

            list.add(classModel);
        }
        resultSet.close();
        preparedStatement.close();

        return list;
    }
    public List<String> fetchLevels(String t_name) throws SQLException {
        String qGetLevels = null;
        List<String> list = new ArrayList<>();
        qGetLevels = "SELECT  distinct level FROM lessons";
        PreparedStatement preparedStatement = connection.prepareStatement(qGetLevels);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            String level_name = resultSet.getString("level");
            list.add(level_name);
        }
        resultSet.close();
        preparedStatement.close();
        return list;
    }
    public boolean doReserve(int userid, int class_id) throws SQLException {
        boolean result = false;
        List<String> list = new ArrayList<>();
        String qGetStudName = "SELECT member_name FROM members WHERE user_id ='"+userid+"'";
        String qDoReserve = "INSERT INTO enrollment(class_id, student_id, student_name) VALUES(?, ?, ?)";
        //find student name to add to enrollment
        PreparedStatement preparedStatement = connection.prepareStatement(qGetStudName);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            String member_name = resultSet.getString("member_name");
            list.add(member_name);
        }
        String student_name = list.get(0);
        out.println("Student name "+ student_name);
        resultSet.close();
        preparedStatement.close();
        //new sql to add all fields to enrollment table
        PreparedStatement preparedStatement2 = connection.prepareStatement(qDoReserve);
        preparedStatement2.setInt(1, class_id);
        preparedStatement2.setInt(2, userid);
        preparedStatement2.setString(3, student_name);
        int rows_update = preparedStatement2.executeUpdate();
        if(rows_update > 0) {
            result = true;
        }
        preparedStatement2.close();
        return result;
    }

    public List<TeamsModel> fetchTeams(String t_type) throws SQLException {
        String qGetTeams = null;
        List<TeamsModel> list = new ArrayList<>();
        if(t_type == "all") {
            qGetTeams = "SELECT team_name, team_type FROM teams";
        } else {
            qGetTeams = "SELECT team_name, team_type FROM teams WHERE class_level = '"+t_type+"'";
        }
        PreparedStatement preparedStatement = connection.prepareStatement(qGetTeams);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            String team_name = resultSet.getString("team_name");
            String team_type = resultSet.getString("team_type");

            TeamsModel teamsModel = new TeamsModel(team_name, team_type);
            list.add(teamsModel);
        }
        resultSet.close();
        preparedStatement.close();
        return list;
    }
    public List<String> fetchTeamMembers(String t_name) throws SQLException {
        String qGetTeamMembers = null;
        List<String> list = new ArrayList<>();
        if(t_name == "all") {
            qGetTeamMembers = "SELECT member_name FROM teams";
        } else {
            qGetTeamMembers = "SELECT member_name FROM teams WHERE team_name = '"+t_name+"'";
        }
        PreparedStatement preparedStatement = connection.prepareStatement(qGetTeamMembers);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            String team_name = resultSet.getString("team_name");
            list.add(team_name);
        }
        resultSet.close();
        preparedStatement.close();
        return list;
    }

}
