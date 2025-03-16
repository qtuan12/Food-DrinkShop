<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">

        <title>Feane</title>

        <!-- Bootstrap core CSS -->
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

        <!-- Owl slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- Nice select -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- Responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />

        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }

            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }

            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }

            .img-big-wrap img {
                width: 100% !important;
                height: auto !important;
            }

            .price-detail-wrap {
                margin: 10px 0;
            }

            .price {
                font-size: 24px;
                font-weight: bold;
            }

            .item-property dt {
                font-weight: bold;
            }

            .item-property dd {
                margin-bottom: 20px;
            }
        </style>
    </head>

    <body class="sub_page">
        <div class="hero_area">
            <div class="bg-box">
                <img src="images/hero-bg.jpg" alt="">
            </div>
            <jsp:include page="header.jsp"></jsp:include>
            </div>

            <br>
            <div class="container">
                <div class="card">
                    <div class="row">
                        <aside class="col-sm-5 border-right">
                            <article class="gallery-wrap"> 
                                <div class="img-big-wrap">
                                    <div> <a href="#"><img src="${detail.image}" alt="${detail.name}"></a></div>
                            </div>
                            <div class="img-small-wrap"></div>
                        </article>
                    </aside>
                    <aside class="col-sm-7">
                        <article class="card-body p-5">
                            <h3 class="title mb-3">${detail.name}</h3>

                            <p class="price-detail-wrap"> 
                                <span class="currency" style="color: black; font-size: 18px;">Price:</span>
                                <span class="price h3 text-warning"> 
                                    <span class="num">${detail.price}</span>
                                </span> 
                            </p>
                            <dl class="item-property">
                                <dt>Description:</dt>
                                <dd>
                                    <p>${detail.description}</p>
                                </dd>
                            </dl>

                            <hr>
                            <div class="row">
                                <div class="col-sm-5"></div>
                            </div>
                            <hr>

                            <a href="addToCart?fid=${detail.id}" 
                               class="btn btn-lg btn-warning text-uppercase" 
                               style="color: white;" 
                               onclick="event.preventDefault(); alert('Item added to cart!'); window.location.href = 'addToCart?fid=${detail.id}';">
                                Add to cart 
                            </a>
                            <a href="javascript:history.back()" class="btn btn-lg btn-secondary text-uppercase" style="color: white;">
                                Back
                            </a>
                        </article>
                    </aside>
                </div>
            </div>
        </div>
        <br>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
