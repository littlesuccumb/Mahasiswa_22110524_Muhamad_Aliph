/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author evote
 */
import java.sql.*;
import java.util.*;

public class MahasiswaDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/kampus";
    private static final String USER = "root";
    private static final String PASS = "";

    private static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public static List<Mahasiswa> getAll() throws Exception {
        List<Mahasiswa> list = new ArrayList<>();
        String sql = "SELECT * FROM mahasiswa";
        try (Connection c = getConnection();
             Statement s = c.createStatement();
             ResultSet r = s.executeQuery(sql)) {
            while (r.next()) {
                list.add(new Mahasiswa(
                    r.getInt("id"),
                    r.getString("nim"),
                    r.getString("nama"),
                    r.getDouble("nilai"),
                    r.getString("matkul"),
                    r.getString("kelas")
                ));
            }
        }
        return list;
    }

    public static Mahasiswa getById(int id) throws Exception {
        String sql = "SELECT * FROM mahasiswa WHERE id=?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet r = ps.executeQuery();
            if (r.next()) {
                return new Mahasiswa(
                    r.getInt("id"),
                    r.getString("nim"),
                    r.getString("nama"),
                    r.getDouble("nilai"),
                    r.getString("matkul"),
                    r.getString("kelas")
                );
            }
        }
        return null;
    }

    public static void insert(Mahasiswa m) throws Exception {
        String sql = "INSERT INTO mahasiswa (nim, nama, nilai, matkul, kelas) VALUES (?, ?, ?, ?, ?)";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, m.getNim());
            ps.setString(2, m.getNama());
            ps.setDouble(3, m.getNilai());
            ps.setString(4, m.getMatkul());
            ps.setString(5, m.getKelas());
            ps.executeUpdate();
        }
    }

    public static void update(Mahasiswa m) throws Exception {
        String sql = "UPDATE mahasiswa SET nim=?, nama=?, nilai=?, matkul=?, kelas=? WHERE id=?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, m.getNim());
            ps.setString(2, m.getNama());
            ps.setDouble(3, m.getNilai());
            ps.setString(4, m.getMatkul());
            ps.setString(5, m.getKelas());
            ps.setInt(6, m.getId());
            ps.executeUpdate();
        }
    }

    public static void delete(int id) throws Exception {
        String sql = "DELETE FROM mahasiswa WHERE id=?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
