<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    if (session == null || session.getAttribute("user") == null) {
%>
    <script>
        alert("Silakan login terlebih dahulu.");
        window.location.href = "index.jsp";
    </script>
<%
        return;
    }

    String menu = request.getParameter("menu");
    if (menu == null) menu = "dashboard";

    String namaUser = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Dashboard Mahasiswa</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/home.css" />
</head>
<body>
    <!-- SIDEBAR -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <i class='bx bxs-graduation'></i>
        <span class="app-title">AppKampus</span>
    </div>

    <ul class="menu-links">
        <li><a href="home.jsp?menu=dashboard"><i class='bx bx-home'></i> <span>Dashboard</span></a></li>
        <li><a href="home.jsp?menu=mahasiswa"><i class='bx bx-user'></i> <span>Mahasiswa</span></a></li>
        <li><a href="#"><i class='bx bx-cog'></i> <span>Settings</span></a></li>
    </ul>

    <ul class="logout-link">
        <li><a href="doLogout.jsp"><i class='bx bx-log-out'></i> <span>Logout</span></a></li>
    </ul>
</div>


    <!-- NAVBAR -->
    <div class="navbar">
        <button class="toggle-btn" onclick="toggleSidebar()"><i class='bx bx-menu'></i></button>

        <div class="navbar-center">
            <div id="clock" class="realtime-clock"><i class='bx bx-time'></i> <span id="clock-time"></span></div>
        </div>

        <div class="navbar-right">
            <button class="dark-btn" id="darkModeToggle"><i class='bx bx-moon'></i></button>
        </div>
    </div>

    <!-- CONTENT -->
    <div class="content">
        <div class="container">

        <% if ("dashboard".equals(menu)) { %>
            <h2><i class='bx bx-smile'></i> Selamat datang, <%= namaUser %>!</h2>
            <p>Selamat datang di <i class='bx bxs-graduation'></i> <strong>AppKampus</strong>.</p>

        <% } else if ("mahasiswa".equals(menu)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kampus", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM mahasiswa");
        %>
            <% String status = request.getParameter("status"); %>
            <% if ("updated".equals(status)) { %>
                <div class="notif success"><i class='bx bx-check-circle'></i> Data berhasil diupdate!</div>
            <% } else if ("added".equals(status)) { %>
                <div class="notif success"><i class='bx bx-check-circle'></i> Data berhasil ditambahkan!</div>
            <% } %>

            <script>
                setTimeout(() => {
                    const notif = document.querySelector(".notif");
                    if (notif) notif.style.display = "none";
                }, 3000);
            </script>

            <h2><i class='bx bx-table'></i> Data Mahasiswa</h2>
            <div class="top-bar">
                <a href="home.jsp?menu=tambah" class="btn tambah"><i class='bx bx-plus'></i> Tambah Data</a>
                <div class="search-wrapper">
                    <div class="search-box">
                        <i class='bx bx-search'></i>
                        <input type="text" id="searchInput" placeholder="Cari nama atau NIM..." />
                    </div>
                </div>
            </div>

            <div class="table-wrapper">
                <table id="mahasiswaTable">
                    <thead>
                        <tr>
                            <th><i class='bx bx-hash'></i> No</th>
                            <th><i class='bx bx-id-card'></i> NIM</th>
                            <th><i class='bx bx-user'></i> Nama</th>
                            <th><i class='bx bx-bar-chart'></i> Nilai</th>
                            <th><i class='bx bx-book'></i> Mata Kuliah</th>
                            <th><i class='bx bx-group'></i> Kelas</th>
                            <th><i class='bx bx-cog'></i> Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int no = 1; while (rs.next()) { %>
                        <tr>
                            <td><%= no++ %></td>
                            <td><%= rs.getString("nim") %></td>
                            <td><%= rs.getString("nama") %></td>
                            <td><%= rs.getInt("nilai") %></td>
                            <td><%= rs.getString("matkul") %></td>
                            <td><%= rs.getString("kelas") %></td>
                            <td>
                                <a href="home.jsp?menu=edit&nim=<%= rs.getString("nim") %>" class="btn edit"><i class='bx bx-edit'></i></a>
                                <a href="home.jsp?menu=hapus&id=<%= rs.getString("id") %>" class="btn delete" onclick="return confirm('Yakin hapus data ini?')"><i class='bx bx-trash'></i></a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

        <% rs.close(); stmt.close(); conn.close(); } catch (Exception e) { out.println("<p style='color:red'>" + e.getMessage() + "</p>"); } %>

        <% } else if ("tambah".equals(menu)) { %>
            <div class="form-wrapper">
                <h2><i class='bx bx-plus-circle'></i> Tambah Data Mahasiswa</h2>
                <% if ("1".equals(request.getParameter("error"))) { %>
                    <div class="notif error"><i class='bx bx-error-circle'></i> Terjadi kesalahan saat menyimpan data.</div>
                <% } %>
                <form action="tambah" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="nim"><i class='bx bx-id-card'></i> NIM</label>
                        <input type="text" name="nim" id="nim" required />
                    </div>
                    <div class="form-group">
                        <label for="nama"><i class='bx bx-user'></i> Nama</label>
                        <input type="text" name="nama" id="nama" required />
                    </div>
                    <div class="form-group">
                        <label for="nilai"><i class='bx bx-bar-chart'></i> Nilai</label>
                        <input type="number" name="nilai" id="nilai" min="0" max="100" required />
                    </div>
                    <div class="form-group">
                        <label for="matkul"><i class='bx bx-book'></i> Mata Kuliah</label>
                        <input type="text" name="matkul" id="matkul" required />
                    </div>
                    <div class="form-group">
                        <label for="kelas"><i class='bx bx-group'></i> Kelas</label>
                        <input type="text" name="kelas" id="kelas" required />
                    </div>
                    <div class="form-button-group">
                        <button type="submit" class="btn simpan"><i class='bx bx-save'></i> Simpan</button>
                        <a href="home.jsp?menu=mahasiswa" class="btn batal"><i class='bx bx-x'></i> Batal</a>
                    </div>
                </form>
            </div>

        <% } else if ("edit".equals(menu)) {
            String nim = request.getParameter("nim");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kampus", "root", "");
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM mahasiswa WHERE nim=?");
                ps.setString(1, nim);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>
            <div class="form-wrapper">
                <h2><i class='bx bx-edit'></i> Edit Data Mahasiswa</h2>
                <form action="edit" method="post">
                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>" />
                    <input type="hidden" name="nim" value="<%= rs.getString("nim") %>" />
                    <div class="form-group">
                        <label for="nama"><i class='bx bx-user'></i> Nama</label>
                        <input type="text" name="nama" value="<%= rs.getString("nama") %>" required />
                    </div>
                    <div class="form-group">
                        <label for="nilai"><i class='bx bx-bar-chart'></i> Nilai</label>
                        <input type="number" name="nilai" value="<%= rs.getInt("nilai") %>" required />
                    </div>
                    <div class="form-group">
                        <label for="matkul"><i class='bx bx-book'></i> Mata Kuliah</label>
                        <input type="text" name="matkul" value="<%= rs.getString("matkul") %>" required />
                    </div>
                    <div class="form-group">
                        <label for="kelas"><i class='bx bx-group'></i> Kelas</label>
                        <input type="text" name="kelas" value="<%= rs.getString("kelas") %>" required />
                    </div>
                    <div class="form-button-group">
                        <button type="submit" class="btn simpan"><i class='bx bx-save'></i> Update</button>
                        <a href="home.jsp?menu=mahasiswa" class="btn batal"><i class='bx bx-x'></i> Batal</a>
                    </div>
                </form>
            </div>
        <% }
            rs.close(); ps.close(); conn.close();
            } catch (Exception e) {
                out.println("<p style='color:red'>" + e.getMessage() + "</p>");
            }
        %>

        <% } else if ("hapus".equals(menu)) {
            String nim = request.getParameter("id");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/kampus", "root", "");
                PreparedStatement ps = conn.prepareStatement("DELETE FROM mahasiswa WHERE id=?");
                ps.setString(1, nim);
                ps.executeUpdate();
                ps.close(); conn.close();
        %>
            <script>
                alert("Data berhasil dihapus.");
                window.location.href = "home.jsp?menu=mahasiswa";
            </script>
        <% } catch (Exception e) {
            out.println("<p style='color:red'>" + e.getMessage() + "</p>");
        } } %>

        </div>
    </div>

    <script src="js/home.js"></script>

</body>
</html>
