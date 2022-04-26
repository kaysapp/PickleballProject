package services;

import models.InstructorModel;
import models.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLdb {
    String url = "jdbc:mysql://localhost:3306/library_catalog";
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
            String name = resultSet.getString("name");
            String pass = resultSet.getString("password");
            int uid = resultSet.getInt("user_id");

            userModel = new UserModel(uid,userid,name,pass);
        }
        resultSet.close();
 //       statement.close();
        preparedStatement.close();
        return userModel;

    }

   /* public List<BookModel> fetchBooks(int authorid) throws SQLException {
        String qGetBooks = null;
        List<BookModel> list = new ArrayList<>();
        if(authorid == 999) {
            qGetBooks = "SELECT A.author_name, B.book_name, B.book_id, A.author_id FROM authors as A, books as B WHERE A.author_id = B.author_id";
        } else {
            qGetBooks = "SELECT A.author_name, B.book_name, B.book_id, A.author_id FROM authors as A, books as B WHERE A.author_id = B.author_id AND A.author_id = '"+authorid+"'";
        }
        PreparedStatement preparedStatement = connection.prepareStatement(qGetBooks);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            int book_id = resultSet.getInt("book_id");
            int author_id = resultSet.getInt("author_id");
            String book_name = resultSet.getString("book_name");
            String author_name = resultSet.getString("author_name");
            BookModel bookModel = new BookModel(book_id, author_id, book_name, author_name);

            list.add(bookModel);
        }
        resultSet.close();
        preparedStatement.close();

        return list;
    }

    public List<BookModel> getReservedBooks(int userid) throws SQLException {
        List<BookModel> list = new ArrayList<>();
        String qGetReserved = "SELECT B.book_id, A.author_id, B.book_name, A.author_name FROM books as B, authors as A, reservations as R WHERE R.book_id = B.book_id AND B.author_id = A.author_id AND R.user_id = '"+userid+"'";
        PreparedStatement preparedStatement = connection.prepareStatement(qGetReserved);
        ResultSet resultSet = preparedStatement.executeQuery();
        while(resultSet.next()) {
            int author_id = resultSet.getInt("author_id");
            String author_name = resultSet.getString("author_name");
            int book_id = resultSet.getInt("book_id");
            String book_name = resultSet.getString("book_name");
            BookModel bookModel = new BookModel(book_id, author_id, book_name, author_name);
            list.add(bookModel);
        }
        resultSet.close();
        preparedStatement.close();
        return list;
    }*/

}
