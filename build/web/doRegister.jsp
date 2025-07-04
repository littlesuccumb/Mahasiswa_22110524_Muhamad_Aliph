<%@page import="java.sql.*"%>
<%
String user = request.getParameter("username");
String email = request.getParameter("email");
String pass = request.getParameter("password");

String url = "jdbc:mysql://localhost:3306/kampus";
String dbUser = "root";
String dbPass = "";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, dbUser, dbPass);

    // Cek apakah username sudah ada
    String checkSql = "SELECT * FROM users WHERE username=?";
    PreparedStatement checkStmt = conn.prepareStatement(checkSql);
    checkStmt.setString(1, user);
    ResultSet rs = checkStmt.executeQuery();

    if (rs.next()) {
        response.sendRedirect("index.jsp?register=fail");
    } else {
        // Simpan akun baru
        String insertSql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
        PreparedStatement insertStmt = conn.prepareStatement(insertSql);
        insertStmt.setString(1, user);
        insertStmt.setString(2, email);
        insertStmt.setString(3, pass);
        insertStmt.executeUpdate();

        response.sendRedirect("index.jsp?register=success");
    }

    rs.close();
    checkStmt.close();
    conn.close();

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
