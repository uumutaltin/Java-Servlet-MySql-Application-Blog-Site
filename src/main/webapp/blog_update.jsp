
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="props.Admin" %>
<%@ page import="props.Blog" %>
<jsp:useBean id="util" class="utils.Util"></jsp:useBean>
<% Admin adm = util.isLogin(request, response); %>
<jsp:useBean id="dbUtil" class="utils.DBUtil"></jsp:useBean>


<html>
<head>
    <title>Blog Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%-- Google Fonts --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
    <%--Custom Styling --%>
    <link rel="stylesheet" href="css/style.css">
</head>
<body style="padding: 0px;margin: 0px;background: #EAE7DC">

    <header style="background-color: #8E8D8A;height: 66px;font-family: 'Righteous';box-sizing: border-box">
    <div style="float: left;height: inherit;margin-left: 2em;">
        <h1 style="color: black;margin: 5px">
            <span style="color: black">Java</span>Öğreniyorum
        </h1>
    </div>

        <nav class="navbar navbar-expand-lg navbar-light bg-#8E8D8A" style="float: right;height: inherit;margin-right: 20em;" >
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

                </div>
            </div>
        </nav>

</header>

<div class="container">




    <div class="row">
        <div class="col-sm-4"></div>

        <div class="col-sm-4">

            <h1 style="color: black;font-weight: normal;font-family: serif">Blog Düzenle</h1>
            <%
                Blog blog = (Blog) request.getAttribute("blog");
            %>
            <form action="blog-update" method="post">

                <div class="mb-3">
                    <input value="<%=blog.getTitle()%>" type="text" name="title" placeholder="Başlık" class="form-control" required />
                </div>

                <div class="mb-3">
                    <input value="<%=blog.getDescription()%>" type="text" name="description" placeholder="İçerik" class="form-control" required />
                </div>


                <div class="mb-3">
                    <div class="form-floating">
                        <textarea name="detail" class="form-control" placeholder="Detay" id="editor"><%=blog.getDetail()%></textarea>
                        <label for="editor"></label>
                    </div>
                </div>


                <button class="btn btn-success"> Düzenle </button>
            </form>
        </div>
        <div class="col-sm-4"></div>
    </div>






    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>


    <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ), {
                toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ],
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' }
                    ]
                }
            } )
            .catch( error => {
                console.log( error );
            } );



    </script>






    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</div>
</body>
</html>
