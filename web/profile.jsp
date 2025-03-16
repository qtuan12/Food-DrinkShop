<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="css/spur.css">
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f8f9fa;
        }
        .dash {
            display: flex;
            min-height: 100vh;
        }
        .dash-nav {
            background: #343a40;
            width: 250px;
        }
        .dash-nav a {
            color: white;
        }
        .dash-content {
            flex: 1;
            padding: 20px;
        }
        .table-wrapper {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .table-title {
            margin-bottom: 20px;
        }
        .modal-footer {
            display: flex;
            justify-content: space-between;
        }
        .btn-info {
            background-color: #007bff;
            border: none;
        }
        .btn-info:hover {
            background-color: #0056b3;
        }
        .btn-default {
            border-color: #ced4da;
        }
    </style>
    <title>Profile</title>
</head>
<body>
    <div class="dash">
        <div class="dash-nav dash-nav-dark">
            <header>
                <a href="#!" class="menu-toggle">
                    <i class="fas fa-bars"></i>
                </a>
                <a href="home" class="spur-logo"><i class="fas fa-home"></i> <span>Home</span></a>
            </header>
            <nav class="dash-nav-list">
                <!-- Add any additional navigation items here -->
            </nav>
        </div>
        <div class="dash-app">
            <header class="dash-toolbar">
                <!-- Toolbar can be added here -->
            </header>
            <main class="dash-content">
                <div class="container">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <h2>Profile</h2>
                        </div>
                        <form action="editProfile?id=${account.id}" method="post">              
                            <div class="form-group">
                                <label for="fullname">Fullname</label>
                                <input id="fullname" value="${account.fullname}" name="fullname" type="text" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone</label>
                                <input id="phone" value="${account.phone}" name="phone" type="tel" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input id="email" value="${account.email}" name="email" type="email" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input id="username" value="${account.username}" name="user" type="text" class="form-control" required="">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input id="password" value="${account.password}" name="pass" type="password" class="form-control" required>
                            </div>
                            <div class="modal-footer">
                                <a href="home" style="text-decoration: none;">
                                    <button type="button" class="btn btn-default">Cancel</button>
                                </a>
                                <input type="submit" class="btn btn-info" value="Save">
                            </div>
                        </form>
                    </div>                     
                </div>
            </main>
        </div>
    </div>
</body>
</html>
