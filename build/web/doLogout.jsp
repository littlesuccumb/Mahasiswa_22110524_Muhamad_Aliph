<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    session.invalidate();
    response.sendRedirect("index.jsp?logout=success");
%>
