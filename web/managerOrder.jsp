<%-- 
    Document   : manage
    Created on : Oct 25, 2024, 8:57:13 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="css/spur.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
        <script src="js/chart-js-config.js"></script>
        <title>Spur - A Bootstrap Admin Template</title>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                        <div>
                            <a href="managerFood" class="dash-nav-item">
                                Manage Food </a>
                        </div>
                        <div>
                            <a href="managerAccount" class="dash-nav-item">
                                Manage Account </a>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.acc.isAdmin == 1 || sessionScope.acc.isSeller == 1}">
                        <div>
                            <a href="managerOrder" class="dash-nav-item">
                                Manage Order </a>
                        </div>
                    </c:if>
                </nav>
            </div>
            <div class="dash-app">
                <!-- header -->
                <header class="dash-toolbar">
                    <a href="#!" class="menu-toggle">
                        <i class="fas fa-bars"></i>
                    </a>
<!--                    <a href="#!" class="searchbox-toggle">
                        <i class="fas fa-search"></i>
                    </a>
                    <form class="searchbox" action="#!">
                        <a href="#!" class="searchbox-toggle"> <i class="fas fa-arrow-left"></i> </a>
                        <button type="submit" class="searchbox-submit"> <i class="fas fa-search"></i> </button>
                        <input type="text" class="searchbox-input" placeholder="type to search">
                    </form>-->
                    <div class="tools">
                        <a href="#!" class="tools-item">
                            <i class="fas fa-bell"></i>
                            <!--<i class="tools-item-count">4</i>-->
                        </a>
                        <div class="dropdown tools-item">
                            <a href="#" class="" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu1">
                                <a class="dropdown-item" href="profile?aid=${sessionScope.acc.id}">Profile</a>
                                <a class="dropdown-item" href="logout">Logout</a>
                            </div>
                        </div>
                    </div>
                </header>
                <!-- end header -->
                <main class="dash-content">
                    <div class="container">
                        <div class="table-wrapper" style="border-style: solid; border-width: 1px">
                            <div class="table-title" style="background: #202831">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h2>Manage Order</h2>
                                    </div>
                                    <div class="col-sm-6">					
                                    </div>
                                </div>
                            </div>
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>
                                            <span class="custom-checkbox">
                                                <input type="checkbox" id="selectAll">
                                                <label for="selectAll"></label>
                                            </span>
                                        </th>
                                        <th>ID</th>
                                        <th>AID</th>
                                        <th>Total Money</th>
                                        <th>Date</th>
                                        <th><a href="#status" style="text-decoration: none; color: black" data-toggle="modal">Status</a></th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listO}" var="o">
                                        <tr>
                                            <td>
                                                <span class="custom-checkbox">
                                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                                    <label for="checkbox1"></label>
                                                </span>
                                            </td>
                                            <td>${o.id}</td>
                                            <td>${o.aid}</td>
                                            <td>${o.totalMoney}</td>
                                            <td>${o.date}</td>
                                            <td>${o.status}</td>
                                            <td>
                                                <a href="loadOrder?oid=${o.id}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                <a href="deleteOrder?oid=${o.id}&mode=2" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </main>
            </div>
            <div id="status" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content" style="display: block">
                        <br>
                        <p style="text-align: center">Define</p>
                        <p style="text-align: center">1 : Processing</p>
                        <p style="text-align: center">2 : Being ship</p>
                        <p style="text-align: center">3 : Completing</p>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/spur.js"></script>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
