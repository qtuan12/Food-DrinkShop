<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" rel="stylesheet">
    <style>
        body {
            background: #f8f9fa;
            margin-top: 20px;
        }
        .card {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            color: white;
        }
        .total-price {
            font-size: 1.5rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-header text-center">
                <h2>Shopping Cart</h2>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th class="text-center">Food</th>
                                <th class="text-right">Price</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-right">Total</th>
                                <th class="text-center"><i class="fa fa-trash" style="color:black"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="cart" value="${sessionScope.cart}"></c:set>
                            <c:set var="index" value="1"></c:set>
                            <c:forEach items="${cart.items}" var="item">
                                <tr>
                                    <td>${index}</td>
                                    <td>
                                        <div class="media">
                                            <img src="${item.food.image}" class="mr-3" style="width: 80px;" alt="${item.food.name}">
                                            <div class="media-body">
                                                <a href="detail?fid=${item.food.id}" class="text-dark">${item.food.name}</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-right">$ ${item.food.price}</td>
                                    <td class="text-center">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <a href="cartProcess?num=-1&id=${item.food.id}" class="btn btn-outline-secondary">-</a>
                                            </div>
                                            <input type="text" class="form-control text-center" value="${item.quantity}" readonly>
                                            <div class="input-group-append">
                                                <a href="cartProcess?num=1&id=${item.food.id}" class="btn btn-outline-secondary">+</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-right">$ ${item.food.price * item.quantity}</td>
                                    <td class="text-center">
                                        <form action="cartProcess" method="post" style="display: inline;">
                                            <input type="hidden" name="id" value="${item.food.id}">
                                            <button type="submit" class="btn btn-danger btn-sm">X</button>
                                        </form>
                                    </td>
                                </tr>
                                <c:set var="index" value="${index + 1}"></c:set>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <h4 class="text-muted">Total Price: <span class="total-price">$ ${cart.getTotalMoney()}</span></h4>
                    <div>
                        <a href="category?cid=0&index=1" class="btn btn-secondary">Back to Shopping</a>
                        <a href="checkout" class="btn btn-custom">Checkout</a>
                        
                    </div>
                </div>
                    
            </div>
        </div>
    </div>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
