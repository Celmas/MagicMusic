<%--
  Created by IntelliJ IDEA.
  User: saget
  Date: 12.11.2018
  Time: 10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/amplitudejs@v3.3.1/dist/amplitude.js"></script>
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<head>
    <title>Magic Music</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
          integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="/css/mdb.min.css">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<script type="text/javascript">
    function logOut() {
        $.ajax({
            type: 'post',
            url: '/logout',     // URL - сервлет
            data: {                // передаваемые сервлету данные
            }
        }).done(function () {
            window.location.href = "/home"
        }).fail(function () {
            alert("НЕ ОЧ");
        });
    }

    function profile() {
        window.location.href = "/profile"
    }

    $(document).ready(function () {
        // вызов функции после потери полем 'userName' фокуса
        $.ajax({
            type: 'get',
            url: '/profileinfo',     // URL - сервлет
            data: {                 // передаваемые сервлету данные
            }
        }).done(function (data) {
            let formHtml = "";
            formHtml += '<label for="form1">First name</label>\n' +
                '                                        <input type="text" name="firstName" class="form-control" id="form1" value="' + data.firstName +'">'
            $("#firstName").html(formHtml);
            formHtml = '<label for="form2">Last name</label>\n' +
                '                                        <input type="text" name="lastName" class="form-control" id="form2" value="' + data.lastName +'">';
            $("#lastName").html(formHtml);
            formHtml = '<label for="form4">Email</label>\n' +
                '                                        <input type="email" name="email" class="form-control" id="form4" value="' + data.email +'">';
            $("#email").html(formHtml);
            if (data.status == null) data.status = "";
            formHtml = '<label for="form5">Status</label>\n' +
                '                                        <input type="text" name="status" id="form5" class="form-control" value="' + data.status +
                '">';
            $("#status").html(formHtml);
        }).fail(function () {
            alert("НЕ ОЧ");
        });
    });
</script>
<header>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top scrolling-navbar">
        <a href="main" class="navbar-brand badge badge-pill badge-secondary mt-2 mr-auto"><strong
                class="white-text px-3">MAGIC MUSIC <i class="fas fa-music"></i></strong></a>
        <button type="button" id="profile" onclick="profile()" class="btn btn-pink"><i class="fas fa-user-alt"
                                                                                       aria-hidden="true"></i> Профиль
        </button>
        <button type="button" id="logOut" onclick="logOut()" class="btn btn-pink"><i class="fas fa-share-square"
                                                                                     aria-hidden="true"></i> Выйти
        </button>
    </nav>
    <!-- Navbar -->
    <!-- Full Page Intro -->
    <div class="view  jarallax" data-jarallax='{"speed": 0.2}'
         style="background-image: url('https://mdbootstrap.com/img/Photos/Others/gradient2.png'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <!-- Mask & flexbox options-->
        <div class="mask rgba-purple-slight d-flex justify-content-center align-items-center">
            <!-- Content -->
            <div class="container">
                <!--Grid row-->

                <div class="row wow fadeIn d-flex justify-content-center">
                    <div class="col-lg-10">
                        <div class="card wow fadeInUp">

                            <!--Card content-->
                            <div class="card-body wow fadeInUp">

                                <!-- Form -->
                                <form method="post" id="user">
                                    <!-- Heading -->
                                    <h1 class="card-header rgba-purple-strong text-white text-center">
                                        <strong>Профиль</strong>
                                    </h1>
                                    <hr>

                                    <div class="form-group" id="firstName">

                                    </div>
                                    <div class="form-group" id="lastName">

                                    </div>
                                    <div class="form-group">
                                        <label for="form3">Password</label>
                                        <input type="password" name="password" id="form3" class="form-control">
                                    </div>
                                    <div class="form-group" id="email">

                                    </div>
                                    <div class="form-group" id="status">

                                    </div>

                                    <div class="text-center">
                                        <button class="btn btn-secondary">Сохранить</button>
                                        <hr>
                                    </div>
                                </form>
                                <!-- Form -->

                            </div>
                        </div>
                    </div>
                    <!--Grid row-->
                </div>

                <!-- Content -->
            </div>
            <!-- Mask & flexbox options-->
        </div>
    </div>
    <!-- Full Page Intro -->
</header>
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
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="/js/mdb.min.js"></script>
<script type="text/javascript">new WOW.init()</script>
</html>