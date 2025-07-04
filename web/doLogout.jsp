<%@page import="java.sql.*"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp?logout=success");
%>
