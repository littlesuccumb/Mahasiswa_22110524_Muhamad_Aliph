/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author evote
 */
public class Mahasiswa {
    private int id;
    private String nim, nama, matkul, kelas;
    private double nilai;

    public Mahasiswa(int id, String nim, String nama, double nilai, String matkul, String kelas) {
        this.id = id;
        this.nim = nim;
        this.nama = nama;
        this.nilai = nilai;
        this.matkul = matkul;
        this.kelas = kelas;
    }
    // Overload untuk insert tanpa ID
    public Mahasiswa(String nim, String nama, double nilai, String matkul, String kelas) {
        this(0, nim, nama, nilai, matkul, kelas);
    }

    // Getters dan Setters
    public int getId() { return id; }
    public String getNim() { return nim; }
    public String getNama() { return nama; }
    public double getNilai() { return nilai; }
    public String getMatkul() { return matkul; }
    public String getKelas() { return kelas; }

    public void setId(int id) { this.id = id; }
    public void setNim(String nim) { this.nim = nim; }
    public void setNama(String nama) { this.nama = nama; }
    public void setNilai(double nilai) { this.nilai = nilai; }
    public void setMatkul(String matkul) { this.matkul = matkul; }
    public void setKelas(String kelas) { this.kelas = kelas; }
}


