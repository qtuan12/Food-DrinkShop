<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .login-title {
            font-family: 'Dancing Script', cursive;
            font-weight: bold;
            color: #343a40;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="login-container mt-5">
        <h2 class="login-title">Welcome Back!</h2>
        <p class="text-center">Please log in to your account.</p>
        <form action="login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username <span class="text-danger">*</span></label>
                <input type="text" class="form-control" name="user" id="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                <input type="password" class="form-control" name="pass" id="password" required>
            </div>
            <div class="mb-3 form-check">
                <input class="form-check-input" type="checkbox" id="remember_me" name="remember_me">
                <label class="form-check-label" for="remember_me">Remember me</label>
            </div>
            <div class="text-danger mb-2">${message}</div>
            <button type="submit" class="btn btn-dark w-100">Log In</button>
        </form>
        <hr class="my-4">
        <div class="text-center">
            <a href="signup.jsp" class="text-decoration-none">Sign up</a> | 
            <a href="#!" class="text-decoration-none">Forgot password?</a>
        </div>
        <div class="text-center mt-3">
            <p>Or sign in with</p>
            <div>
                <a href="#!" class="btn btn-outline-danger mx-1">
                    <i class="bi bi-google"></i> Google
                </a>
                <a href="#!" class="btn btn-outline-primary mx-1">
                    <i class="bi bi-facebook"></i> Facebook
                </a>
            </div>
        </div>
    </div>
    <script src="https://unpkg.com/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
