<%--
  Created by IntelliJ IDEA.
  User: saget
  Date: 10.11.2018
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Magic Music</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link  rel="stylesheet" href="/css/mdb.min.css">
    <!-- Your custom styles (optional) -->
    <link  rel="stylesheet" href="/css/style.css">
</head>

<body>

<!-- Main navigation -->
<header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top scrolling-navbar">
        <a href="home" class="navbar-brand badge badge-pill badge-secondary mt-2 mr-auto"><strong class="white-text px-3">MAGIC MUSIC <i class="fas fa-music"></i></strong></a>
    </nav>
    <!-- Navbar -->
    <!-- Full Page Intro -->
    <div class="view  jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('https://mdbootstrap.com/img/Photos/Others/gradient2.png'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <!-- Mask & flexbox options-->
        <div class="mask rgba-purple-slight d-flex justify-content-center align-items-center">
            <!-- Content -->
            <div class="container">
                <!--Grid row-->
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <div class="col-md-12 text-center">
                        <h1 class="display-4 font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInUp text-secondary">Magic Music</h1>
                        <h5 class="pt-md-5 pt-sm-2 pt-5 pb-md-5 pb-sm-3 pb-5 wow fadeInUp" data-wow-delay="0.2s">Идеальный сервис для удобного прослушивания музыки</h5>



                        <div class="wow fadeInUp" data-wow-delay="0.4s">
                            <a href="signup" class="btn btn-purple btn-rounded"><i class="fa fa-user left"></i> Зарегистрироваться!</a>
                            <a class="btn btn-outline-purple btn-rounded" data-toggle="modal" data-target="#modalLoginForm"><i class="fas fa-sign-in-alt"></i> Войти</a>
                        </div>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </div>
            <!-- Content -->
        </div>
        <!-- Mask & flexbox options-->
    </div>
    <!-- Full Page Intro -->
</header>
<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form method="post">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">
                    <div class="md-form mb-5">
                        <i class="fa fa-envelope prefix grey-text"></i>
                        <input type="email" name="email" id="defaultForm-email" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="defaultForm-email">Your email</label>
                    </div>

                    <div class="md-form mb-4">
                        <i class="fa fa-lock prefix grey-text"></i>
                        <input type="password" name="password" id="defaultForm-pass" class="form-control validate">
                        <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <input type="submit" class="btn btn-primary purple-gradient" value="Sign in">
                </div>
            </div></form>
    </div>
</div>

<main class="mt-5">

    <div class="container">
        <hr class="my-3">
        <section class="my-5">

            <!-- Section heading -->
            <h2 class="h1-responsive font-weight-bold text-center my-5">Почему нужно выбрать нас?</h2>
            <!-- Section description -->
            <p class="lead grey-text text-center w-responsive mx-auto mb-5">Мы вышли на рынок в ноябре 2018, но смогли завоевать доверие миллионов пользователей. Вот лишь несколько причин выбрать нас: </p>

            <!-- Grid row -->
            <div class="row">

                <!-- Grid column -->
                <div class="col-lg-5 text-center text-lg-left">
                    <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Others/screens-section.jpg" alt="Sample image">
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-lg-7">

                    <!-- Grid row -->
                    <div class="row mb-3">

                        <!-- Grid column -->
                        <div class="col-1">
                            <i class="fas fa-share fa-lg indigo-text"></i>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-xl-10 col-md-11 col-10">
                            <h5 class="font-weight-bold mb-3">Огромный выбор</h5>
                            <p class="grey-text">Наши коталоги полны музыкой со всего мира</p>
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row -->

                    <!-- Grid row -->
                    <div class="row mb-3">

                        <!-- Grid column -->
                        <div class="col-1">
                            <i class="fa fa-share fa-lg indigo-text"></i>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-xl-10 col-md-11 col-10">
                            <h5 class="font-weight-bold mb-3">Гибкость</h5>
                            <p class="grey-text">Наш проект доступен на всех устройства со всем функционалом. Интерфейс понятен на интуитивном уровне</p>
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row -->

                    <!--Grid row-->
                    <div class="row mb-3">

                        <!-- Grid column -->
                        <div class="col-1">
                            <i class="fa fa-share fa-lg indigo-text"></i>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-xl-10 col-md-11 col-10">
                            <h5 class="font-weight-bold mb-3">Доступность</h5>
                            <p class="grey-text mb-0">Бесплатная ценовая политика, отсутствие рекламы и возможность получения доступа из любой точки мира</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!--Grid row-->
                    <div class="row">

                        <!-- Grid column -->
                        <div class="col-1">
                            <i class="fa fa-share fa-lg indigo-text"></i>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-xl-10 col-md-11 col-10">
                            <h5 class="font-weight-bold mb-3">Доверие музыкантов</h5>
                            <p class="grey-text mb-0">Нашими партнерыми являются все самые популярные артисты</p>
                        </div>


                    </div>
                    <!--Grid column-->

                </div>
                <!-- Grid row -->
            </div>
        </section>
        <hr class="my-3">
        <!--Section: Testimonials v.1-->
        <section class="section pb-3 text-center">

            <!--Section heading-->
            <h1 class="section-heading h1 pt-4">Отзывы</h1>
            <!--Section description-->
            <p class="section-description">Проект только начал свое существование, но уже обзовелся преданными фанатами</p>

            <div class="row">

                <!--Grid column-->
                <div class="col-lg-4 col-md-12 mb-4">

                    <!--Card-->
                    <div class="card testimonial-card">

                        <!--Background color-->
                        <div class="card-up teal lighten-2">
                        </div>

                        <!--Avatar-->
                        <div class="avatar mx-auto white"><img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(27).jpg"
                                                               alt="avatar mx-auto white" class="rounded-circle img-fluid">
                        </div>

                        <div class="card-body">
                            <!--Name-->
                            <h4 class="card-title mt-1">Майкл Джексон</h4>
                            <hr>
                            <!--Quotation-->
                            <p><i class="fa fa-quote-left"></i> Не видел ничего прекраснее!</p>
                        </div>

                    </div>
                    <!--Card-->

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-12 mb-4">

                    <!--Card-->
                    <div class="card testimonial-card">

                        <!--Background color-->
                        <div class="card-up blue lighten-2">
                        </div>

                        <!--Avatar-->
                        <div class="avatar mx-auto white"><img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(20).jpg"
                                                               alt="avatar mx-auto white" class="rounded-circle img-fluid">
                        </div>

                        <div class="card-body">
                            <!--Name-->
                            <h4 class="card-title mt-1">Аманда Грей</h4>
                            <hr>
                            <!--Quotation-->
                            <p><i class="fa fa-quote-left"></i>Пользуюсь со старта, лучшее предложение на рынке, которое выше своих конкурентов на голову</p>
                        </div>

                    </div>
                    <!--Card-->

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-12 mb-4">

                    <!--Card-->
                    <div class="card testimonial-card">

                        <!--Background color-->
                        <div class="card-up deep-purple lighten-2"></div>

                        <!--Avatar-->
                        <div class="avatar mx-auto white"><img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(10).jpg"
                                                               alt="avatar mx-auto white" class="rounded-circle img-fluid">
                        </div>

                        <div class="card-body">
                            <!--Name-->
                            <h4 class="card-title mt-1">Мария Кожевникова</h4>
                            <hr>
                            <!--Quotation-->
                            <p><i class="fa fa-quote-left"></i>Сервис топчик ИМХО</p>
                        </div>

                    </div>
                    <!--Card-->

                </div>
                <!--Grid column-->

            </div>

        </section>
        <hr class="my-3">
        <!-- Section: Features v.3 -->

        <!-- Section: Features v.3 -->
    </div>


</main>

<!-- Footer -->
<footer class="page-footer font-small purple-gradient darken-3">

    <!-- Footer Elements -->
    <div class="container">

        <!-- Grid row-->
        <div class="row">

            <!-- Grid column -->
            <div class="col-md-12 py-5">
                <div class="mb-5 flex-center">

                    <!-- Facebook -->
                    <a class="fb-ic">
                        <i class="fab fa-facebook fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Twitter -->
                    <a class="tw-ic">
                        <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!-- Google +-->
                    <a class="gplus-ic">
                        <i class="fab fa-google-plus fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Linkedin -->
                    <a class="li-ic">
                        <i class="fab fa-linkedin fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Instagram-->
                    <a class="ins-ic">
                        <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
                    </a>
                    <!--Pinterest-->
                    <a class="pin-ic">
                        <i class="fab fa-pinterest fa-lg white-text fa-2x"> </i>
                    </a>
                </div>
            </div>
            <!-- Grid column -->

        </div>
        <!-- Grid row-->

    </div>
    <!-- Footer Elements -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2018 Copyright:
        <a href="https://mdbootstrap.com/education/bootstrap/"> Magicmusic.com</a>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->

</body>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="/js/mdb.min.js"></script>
</body>
<script type="text/javascript">
    new WOW().init();
</script>

</html>

<!--Section: Testimonials v.1-->

<!-- Grid row -->
<!-- Main navigation -->
<!-- /Start your project here-->

<!-- SCRIPTS -->
<!-- JQuery -->
