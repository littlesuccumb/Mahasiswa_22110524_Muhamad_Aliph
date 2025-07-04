<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        // Koneksi ke database
        String url = "jdbc:mysql://localhost:3306/kampus";
        String dbUser = "root";
        String dbPass = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // Cek ke database
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, user);
        stmt.setString(2, pass);

        rs = stmt.executeQuery();

        if (rs.next()) {
            session.setAttribute("user", user);
            response.sendRedirect("home.jsp?login=success");
        } else {
            response.sendRedirect("error.jsp");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
