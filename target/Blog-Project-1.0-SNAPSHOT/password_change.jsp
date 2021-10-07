
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>


<html>
<head>
    <title>Password Change</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%-- Google Fonts --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
    <%--Custom Styling --%>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="padding: 0px;margin: 0px;background: #EAE7DC">

<header>
    <div style="float: left;height: inherit;margin-left: 2em;">
        <h1 style="color: black;margin: 5px">
            <span style="color: black">Java</span>Öğreniyorum
        </h1>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-#8E8D8A" >
        <div class="container-fluid">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a  class="nav-link active" aria-current="page" href="main.jsp">Anasayfa</a>
                    </li>
                    <li class="nav-item">
                        <a  class="nav-link active" aria-current="page" href="blog-insert">Bloglar</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a  style="color: black" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <%=adm.getName()%>
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                            <li>
                                <a class="dropdown-item" href="password-change?aid=${dbUtil.singleAdmin(aid).aid}">Şifre Değiştir</a>

                            </li>
                            <li><a class="dropdown-item" href="logout">Çıkış</a></li>

                        </ul>
                    </li>

                </ul>
                <form style="margin: 2em" class="d-flex">
                    <input  class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>

<div class="container">


    <div class="row">


        <div class="col-sm-4"></div>





        <div class="col-sm-4">

            <h2>Şifre Değiştir</h2>

            <%
                Object loginObj = request.getAttribute("passwordError");
                if ( loginObj != null ) {
                    String errorMessage = ""+loginObj;
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hata!</strong> <%=errorMessage %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>

            <form action="password-change" method="post">
                <div class="mb-3">
                    <input type="password" class="form-control" name="oldpass" placeholder="Eski Şifre" required />
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" name="conform" placeholder="Eski Şifre (Tekrar)" required />
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" name="newpass" placeholder="Yeni Şifre" required />
                </div>
                <button class="btn btn-success"> Değiştir </button>
            </form>




        </div>

        <div class="col-sm-4"></div>









    </div>









</div>










<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
