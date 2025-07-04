# 🎓 Aplikasi Web Mahasiswa - JSP & Servlet

Ini adalah aplikasi web berbasis **Java JSP dan Servlet** yang mensimulasikan proses login, logout, registrasi, serta pengelolaan data mahasiswa. Project ini mengikuti pola **MVC (Model-View-Controller)** dan dibangun menggunakan **NetBeans**.

---

## 👤 Identitas Mahasiswa

- **Nama:** Muhamad Aliph Fauzansyah  
- **NIM:** 22110524  
- **Kelas:** L2022  
- **Mata Kuliah:** Pemrograman Java Lanjut

---

## 🚀 Fitur Aplikasi

- 🔐 Login & Logout  
- 📝 Registrasi pengguna  
- 🏠 Halaman Home setelah login  
- ➕ Tambah, Edit, Hapus data mahasiswa  
- ❌ Penanganan error melalui `error.jsp`  
- 🎨 Styling dengan CSS  
- 💡 Interaktif dengan JavaScript  

---

## 🛠 Teknologi yang Digunakan

- Java Server Pages (JSP)  
- Jakarta Servlet  
- HTML, CSS, JavaScript  
- NetBeans (Ant Project)  
- MVC Pattern (Model - View - Controller)  

---

## 📂 Struktur Proyek

```
Mahasiswa_22110524_Muhamad_Aliph_Fauzansyah/
├── Web Pages/
│   ├── css/
│   │   ├── 404.css
│   │   ├── home.css
│   │   └── login.css
│   ├── js/
│   │   ├── 404.js
│   │   ├── home.js
│   │   └── login.js
│   ├── doLogin.jsp
│   ├── doLogout.jsp
│   ├── doRegister.jsp
│   ├── error.jsp
│   ├── home.jsp
│   └── index.jsp
├── Source Packages/
│   └── controller/
│       ├── EditServlet.java
│       ├── HapusServlet.java
│       ├── Mahasiswa.java
│       ├── MahasiswaDAO.java
│       └── TambahServlet.java
```

---

## ⚙️ Cara Menjalankan

1. Buka project di **NetBeans**  
2. Jalankan server seperti **Tomcat** atau **GlassFish**  
3. Akses melalui browser:
```
http://localhost:8080/Mahasiswa_22110524_Muhamad_Aliph_Fauzansyah/
```

---

## 💾 Instalasi & Penggunaan Database

1. Buka **phpMyAdmin** atau MySQL Workbench  
2. Buat database baru dengan nama:
   ```
   kampus
   ```
3. Import file `kampus.sql` yang ada di folder project:
   - **Via phpMyAdmin**: klik database `kampus` → pilih tab **Import** → unggah file `kampus.sql`
   - **Via terminal / command prompt**:
     ```bash
     mysql -u [username] -p kampus < path/to/kampus.sql
     ```
4. Sesuaikan konfigurasi koneksi database di file `MahasiswaDAO.java` atau class koneksi Anda:
   ```java
   String url = "jdbc:mysql://localhost:3306/kampus";
   String username = "root";
   String password = ""; // Sesuaikan dengan password database lokal Anda
   ```

---

## 📌 Catatan

- Semua proses seperti login, registrasi, dan CRUD disimulasikan secara langsung dalam aplikasi  
- Database `kampus` digunakan untuk menyimpan data mahasiswa  
- Cocok untuk latihan dasar pemrograman Java Web  

---

## 📬 Kontak

- GitHub: [@littlesuccumb](https://github.com/littlesuccumb)

---

> Proyek ini dibuat untuk keperluan tugas kuliah **Pemrograman Java Lanjut**.  
> Semoga bermanfaat, semangat ngoding terus! 💻🔥
