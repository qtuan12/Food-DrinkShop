<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Signup - Fiancé</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/components/logins/login-5/assets/css/login-5.css">
    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
        }
        .card {
            border-radius: 1rem;
            overflow: hidden;
        }
        .hero {
            background-image: url('images/bg.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }
        .hero h2 {
            font-family: 'Dancing Script', cursive;
            font-size: 2.5rem;
            font-weight: bold;
        }
        .login-form {
            background-color: #fff;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <div class="hero">
        <div class="text-center">
            <h2>Welcome to Tcanh Shop</h2>
            <p>A small restaurant for people with a passion for food.</p>
        </div>
    </div>

    <section class="p-4">
        <div class="container">
            <div class="card shadow-sm login-form">
                <div class="card-body">
                    <h3 class="text-center mb-4">Sign Up</h3>
                    <form action="signup" method="post">
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Fullname <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="fullname" id="fullname" required>
                        </div>
                        <div class="mb-3">
                            <label for="username" class="form-label">Username <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="user" id="username" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control" name="pass" id="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="repassword" class="form-label">Repeat Password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control" name="repass" id="repassword" required>
                        </div>
                        <div class="mb-3 text-danger">${message}</div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Sign Up</button>
                        </div>
                    </form>
                    <div class="text-center mt-4">
                        <p>Or sign in with</p>
                        <div class="d-flex justify-content-center gap-3">
                            <a href="#!" class="btn btn-outline-primary">
                                <i class="bi bi-google"></i> Google
                            </a>
                            <a href="#!" class="btn btn-outline-primary">
                                <i class="bi bi-facebook"></i> Facebook
                            </a>
                            <a href="#!" class="btn btn-outline-primary">
                                <i class="bi bi-twitter"></i> Twitter
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
