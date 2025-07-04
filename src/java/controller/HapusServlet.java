package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class HapusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            MahasiswaDAO.delete(id); // Ganti sesuai method di DAO kamu
            res.sendRedirect("home.jsp?menu=mahasiswa&status=deleted");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("home.jsp?menu=mahasiswa&status=error");
        }
    }
}
