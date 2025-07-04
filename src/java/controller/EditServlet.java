package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String nim = req.getParameter("nim");
            String nama = req.getParameter("nama");
            double nilai = Double.parseDouble(req.getParameter("nilai"));
            String matkul = req.getParameter("matkul");
            String kelas = req.getParameter("kelas");

            Mahasiswa m = new Mahasiswa(id, nim, nama, nilai, matkul, kelas);
            MahasiswaDAO.update(m);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect ke halaman setelah update
        res.sendRedirect("home.jsp?menu=mahasiswa&status=updated");
    }
}
