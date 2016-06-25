package servlet;

import util.DB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by mingfei.net@gmail.com
 * 2016/6/25.
 */
@WebServlet(urlPatterns = "/ajax")
public class AjaxServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        Connection connection = DB.getConnection();
        if (connection == null) {
            return;
        }

        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        String sql = "SELECT * FROM db_ajax.user WHERE email = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();

            resp.setContentType("text/html; charset=UTF-8");
            Writer writer = resp.getWriter();
            if (resultSet.next()) {
                writer.write("true");
            } else {
                writer.write("false");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(resultSet, preparedStatement, connection);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet...");
        doPost(req, resp);
    }
}
