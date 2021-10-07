
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Admin" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>

<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>
<html>
<head>
    <title>Home</title>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%-- Google Fonts --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
    <%--Custom Styling --%>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>





<header>
    <div style="float: left;height: inherit;margin-left: 2em;">
        <h1 style="color: black;margin: 5px">
            <span style="color: black">Java</span>Öğreniyorum
        </h1>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-#8E8D8A" style="float: right;height: inherit;margin-right: 9em;" >
        <div class="container-fluid">

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a  class="nav-link active" aria-current="page" href="index.jsp">Anasayfa</a>
                    </li>
                    <li class="nav-item">
                        <a  class="nav-link active" aria-current="page" href="about.jsp">Hakkımızda</a>
                    </li>

                    <li class="nav-item">
                        <a  class="nav-link active" aria-current="page" href="contact_us.jsp">Bize Ulaşın</a>
                    </li>

                    <li class="nav-item">
                        <a  class="nav-link active" aria-current="page" href="admin.jsp">Giriş Yap</a>
                    </li>




                </ul>

            </div>
        </div>
    </nav>



</header>







<div class="container">
    <div class="row">

        <div class="col-sm-2"></div>



        <div class="col-sm-8">

            <div class="table table-hover">

                <thead>
                <tr>
                    <hr>
                </tr>
                </thead>
                <tbody>


                <c:forEach items="${dbUtil.homeallBlog()}" var="item">
                    <td>
                        <a style="link:;text-decoration: none" href="blog-detail?bid=${item.bid}">
                            <tr>
                                <h1 style="color: black; font-weight: bold ;font-family: serif"> <c:out value="${item.title}"></c:out> </h1>
                            </tr>
                            <tr>
                                <h3 style="color: black;font-weight: normal;font-family: serif"> <c:out value="${item.description}"></c:out> </h3>
                            </tr>
                        </a>
                        <tr>
                            <h4 style="color: black;font-weight: lighter ;font-family: serif"><i>Yayınlanma Tarihi : <c:out value="${item.date}"></c:out> </i> </h4>
                        </tr>


                    </td>
                    <hr>
                </c:forEach>


                </tbody>

            </div>




        </div>




        <div class="col-sm-2"></div>






    </div>







</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


</body>
</html>
