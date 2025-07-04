package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class TambahServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // Set encoding untuk dukungan karakter non-ASCII
        req.setCharacterEncoding("UTF-8");

        try {
            // Ambil data dari form
            String nim = req.getParameter("nim");
            String nama = req.getParameter("nama");
            double nilai = Double.parseDouble(req.getParameter("nilai"));
            String matkul = req.getParameter("matkul");
            String kelas = req.getParameter("kelas");

            // Buat objek Mahasiswa
            Mahasiswa m = new Mahasiswa(nim, nama, nilai, matkul, kelas);

            // Simpan ke database lewat DAO
            MahasiswaDAO.insert(m);

            // Redirect kembali ke daftar mahasiswa
            res.sendRedirect("home.jsp?menu=mahasiswa&status=added");
        } catch (Exception e) {
            e.printStackTrace();
            // Jika error, redirect ke halaman tambah dengan pesan error
            res.sendRedirect("home.jsp?menu=tambah&error=1");
        }
    }
}
