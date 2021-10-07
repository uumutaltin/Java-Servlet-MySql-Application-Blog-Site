
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Bize Ulaşın</title>
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

    <nav class="navbar navbar-expand-lg navbar-light bg-#8E8D8A" style="float: right;height: inherit;margin-right: 10em;" >
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
                        <a  class="nav-link active" aria-current="page" href="about.jsp">Hakkımızda</a>
                    </li>

                    <li class="nav-item">
                        <a  class="nav-link active" aria-current="page" href="contact_us.jsp">Bize Ulaşın</a>
                    </li>





                </ul>

            </div>
        </div>
    </nav>

</header>

<div class="container">

    <div class="row">

        <div class="col-sm-4"></div>

        <div class="col-sm-4">

            <h1 style="color: black; font-weight: normal;font-family: serif;font-size: 40px"> Bize Ulaşın </h1>
            <h2></h2>
            <h4 style="color: black;font-weight: normal;font-family: serif;font-size: 20px"><i>Beraber Java öğrenme sürecinde görüşlerin bizim için çok önemli. Aşağıdaki formu doldur ve beraber gelişmeye başlayalım.</i></h4>
            <h2></h2>
            <%
                Object loginObj = request.getAttribute("contactMessage");
                if ( loginObj != null ) {
                    String contactMessage = ""+loginObj;
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Hata!</strong> <%=contactMessage%>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>
            <form action="contact-servlet" method="post">
                <div class="mb-3">
                    <input type="text" class="form-control" name="name" placeholder="İsim" required />
                </div>







                <div class="mb-3">
                    <input type="email" class="form-control" name="email" placeholder="E-Mail" required />
                </div>





                <div class="mb-3">
                    <input type="number" class="form-control" name="phone_number" placeholder="Telefon" required />
                </div>






                <div class="mb-3">
                    <textarea name="message" class="form-control" placeholder="Mesaj" id="floatingTextarea2" style="height: 200px"></textarea>
                    <label for="floatingTextarea2"></label>
                </div>

                <button class="btn btn-success"> Kaydet </button>








            </form>


        </div>

        <div class="col-sm-4"></div>





    </div>




    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</div>





</body>
</html>
