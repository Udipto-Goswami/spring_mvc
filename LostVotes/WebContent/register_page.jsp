<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registrations page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/typicons/2.0.9/typicons.min.css">
    
</head>
<style>
<%@include file="/resources/css/styles_register.min.css"%>
</style>

<body style="overflow:hidden">
<div style="position:absolute;width:100%;text-align:left; margin-top:40px;margin-left:40px;">
<a href="index.jsp" name="register" class="btn btn-secondary" style="background-color:#31373a;border-radius:250px;height:40px;width:40px;">
<i class="typcn typcn-arrow-back"></i>
</a>
</div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-7" style="margin-top:120px;">
                <div class="row register-form" >
                    <div class="col-md-8 col-xl-12 offset-md-2 offset-xl-0" style="height:751px;">
                        <form class="custom-form" action="register" method="POST">
                            <h1>Sign Up</h1>
                            <div class="form-row form-group">
                                <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Name </label></div>
                                <div class="col-sm-6 input-column"><input class="form-control" type="text"></div>
                            </div>
                            <div class="form-row form-group">
                                <div class="col-sm-4 label-column"><label class="col-form-label" for="email-input-field">Username</label></div>
                                <div class="col-sm-6 input-column"><input class="form-control" type="email"></div>
                            </div>
                            <div class="form-row form-group">
                                <div class="col-sm-4 label-column"><label class="col-form-label" for="pawssword-input-field">Password </label></div>
                                <div class="col-sm-6 input-column"><input class="form-control" type="password"></div>
                            </div>
                            <div class="form-row form-group">
                                <div class="col-sm-4 label-column"><label class="col-form-label" for="repeat-pawssword-input-field">Repeat Password </label></div>
                                <div class="col-sm-6 input-column"><input class="form-control" type="password"></div>
                            </div><button class="btn btn-light submit-button" type="submit">Submit Form</button>
                            </form>
                    </div>
                </div>
            </div>
            <div class="col " style="background-color:#00305e;height:992px;">
                <h1 style="color:rgb(255,255,255);margin-top:195px;padding:41px;margin-left:14px;">REGISTER YOURSELF</h1>
                <p style="padding:49px;margin-top:-95px;margin-right:-2px;margin-left:14px;font-size:22px;color:rgb(255,255,255);">Come &amp; be a part of us.<br></p>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>