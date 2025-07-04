<%-- 
    Document   : index
    Created on : 6 May 2025, 14.37.53
    Author     : evote
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flowsuns Website</title>
    <link rel="stylesheet" href="css/login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
    <header class="header">
        <nav class="navbar">
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Services</a>
            <a href="#">Contact</a>
        </nav>

        <form action="#" class="search-bar">
            <input type="text" placeholder="Search...">
            <button class="submit"><i class='bx bx-search'></i></button>
        </form>
    </header>

    <div class="background"></div>
    <div class="container">
        <div class="content">
            <h2 class="logo"><i class='bx bxl-firebase' ></i>Littlesuccumb.</h2>

            <div class="text-sci">
                <h2>Welcome<br><span>to our new website AppKampus!</span></h2>

                <p>AppKampus di buat oleh Muhamad Aliph 22110524, dibuat dengan penuh cinta</p>

                <div class="social-icons">
                    <a href="#"><i class='bx bxl-linkedin-square' ></i></a>
                    <a href="#"><i class='bx bxl-facebook' ></i></a>
                    <a href="#"><i class='bx bxl-instagram' ></i></a>
                    <a href="#"><i class='bx bxl-twitter' ></i></a>
                </div>
            </div>
        </div>

            

        <div class="logreg-box">
            <div class="form-box login">
                <form action="doLogin.jsp" method="post">
                    <h2>Sign In</h2>

                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-envelope' ></i></span>
                        <input type="text" name="username" required>
                        <label>Username</label>
                    </div>

                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-lock-alt' ></i></span>
                        <input type="password" name="password" required>
                        <label>Password</label>
                    </div>

                    <div class="remember-forgot">
                        <label><input type="checkbox">Remember me!</label>
                        <a href="#">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn">Sign In</button>

                    <div class="login-register">
                        <p>Don't have an account? <br><a href="#" class="register-link">Sign Up</a></p>
                    </div>
                </form>
            </div>



            <div class="form-box register">
                <form action="doRegister.jsp" method="post">
                    <h2>Sign Up</h2>

                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-user' ></i></span>
                        <input type="text" name="username" required>
                        <label>Username</label>
                    </div>

                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-envelope' ></i></span>
                        <input type="email" name="email" required>
                        <label>Email</label>
                    </div>

                    <div class="input-box">
                        <span class="icon"><i class='bx bxs-lock-alt' ></i></span>
                        <input type="password" name="password" required>
                        <label>Password</label>
                    </div>

                    <div class="remember-forgot">
                        <label><input type="checkbox">I agree to the terms and conditions.</label>
                    </div>

                    <button type="submit" class="btn">Sign Up</button>

                    <div class="login-register">
                        <p>Already have an account? <br><a href="#" class="login-link">Sign In</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script src="js/login.js"></script>
    <%
    String registrasi = request.getParameter("register");
    if ("success".equals(registrasi)) {
%>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Registrasi Berhasil!',
        text: 'Silakan login untuk melanjutkan.',
        confirmButtonText: 'OK'
    });
</script>
<% } %>

<%-- Pop-up logout jika parameter logout=success --%>
    <%
        String logout = request.getParameter("logout");
        if ("success".equals(logout)) {
    %>
        <script>
            Swal.fire({
                icon: 'success',
                title: 'Logout Berhasil',
                text: 'Anda telah berhasil logout!',
                confirmButtonText: 'OK'
            });
        </script>
    <%
        }
    %>

</body>
</html>