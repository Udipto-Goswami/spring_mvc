<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
   
</head>
<style>
<%@ include file="resources/css/stylesdash.min.css"%>
</style>
<body>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

if(session.getAttribute("username")==null){
	response.sendRedirect("login_page.jsp?login=3");
}
%>
    <div id="wrapper">
        <div id="sidebar-wrapper" style="background-color:#f77f00; overflow:hidden">
            <ul class="sidebar-nav nav">
                <li class="sidebar-brand nav-item"> <a class="d-inline-block" style="color:rgb(255,255,255);width:250px;margin-left:-20px;"><i class="fa fa-user-circle" style="font-size:18px;width:38px;margin-right:0px;margin-left:0px;"></i><strong>&nbsp; <% out.println("Hi " + session.getAttribute("firstname")); %> </strong></a></li>
                <li>
                <a class="d-block" href="#tab-3" style="color:rgb(255,255,255);width:250px;" role="tab" data-toggle="tab" id="showbtn"><i class="fa fa-newspaper-o" style="text-align:center"></i>&nbsp;Latest News</a></li>
                <li class="nav-item"> <a href="#tab-4" style="color:rgb(255,255,255);width:250px;" role="tab" data-toggle="tab"><i class="fa fa-qrcode"></i>&nbsp;Election 2019</a></li>
                <li class="nav-item"> <a href="#tab-5" style="color:rgb(255,255,255);width:250px;" role="tab" data-toggle="tab"><i class="fa fa-address-card"></i>&nbsp;My Voters Profile</a></li>
                <li class="nav-item"> <a href="#tab-6" style="color:rgb(255,255,255);width:250px;" role="tab" data-toggle="tab"><i class="fa fa-user-circle-o" style="font-size:18px;margin:0px;margin-top:5px;margin-bottom:0px;padding-top:0px;width:37px;"></i>&nbsp;Profile</a>
                    <div style="color:rgb(255,255,255);width:250px;padding:13px;background-color:#f77f00;">&nbsp;
                    
  <form action="logout" method="POST">
<button  type="submit" name="logout" value="404" class="btn btn-warning" style="color:rgb(255,255,255);">
<strong>Logout <i class="fa fa-power-off"></i></strong>
</button>
 </form>
                    </div>
                </li>
            </ul>
        </div>
        <div class="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div>
                            <h6><%=(new java.util.Date()).toLocaleString()%></h6>
                            <h1>Let's Begin The Lost Votes Initiative</h1><div>
    
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane" id="tab-3">
            <p id='count'></p>
            <div id='demo'>

               
            </div>
        </div>
         <div role="tabpanel" class="tab-pane" id="tab-6">
            <p>Content for tab 6.</p>
          <div class="container">
    <div class="row">
        <div class="col-lg-4">
            <div class="card"><span class="card-img-top w-100 d-block "><i class="fa fa-user-circle text-center" style="font-size:70px;margin-right:0px;margin-left:90px;"></i></span>
                <div class="card-body">
                    <h4 class="card-title"><% out.println(session.getAttribute("fullname")); %></h4>
                    <p class="card-text">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus.</p>
                </div>
            </div>
        </div>
        <div class="col">
            <h2>Update Profile</h2>
            <hr />
            <form>
                <div class="form-group"><input type="text" placeholder="Username" value='<% out.println(session.getAttribute("username")); %>' class="form-control form-control-lg" /></div>
                <div class="form-group"><input type="password" placeholder="Password" value='<% out.println(session.getAttribute("password")); %>' class="form-control form-control-lg" /></div>
                <hr />
                <header></header>
                <div class="form-group">
                    <h5>Current Address</h5><textarea placeholder="Address" class="form-control" ><% out.println(session.getAttribute("current_address"));%></textarea></div>
                <div class="form-group">
                    <h5>Permanent Address</h5><textarea placeholder="Address" class="form-control"><% out.println(session.getAttribute("permanent_address"));%></textarea></div>
                 <div class="form-group">
                        <input type="submit" name="submit" class="btn btn-primary" style="background-color: #f77f00; border:0px" value="Submit"/> 
                        <input type="reset" name="reset" class="btn btn-default" style="background-color:#30383a;color:white;border:0px" value="Reset"/>    
                     
                </div>
            </form>
        </div>
    </div>
</div>
             
             
        </div>
        <div role="tabpanel" class="tab-pane" id="tab-4">
            <p>Content for tab 4.</p>
            <div class="jumbotron">
                <h1>Heading text</h1>
                <p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                <p><a class="btn btn-primary" role="button" href="#">Learn more</a></p>
            </div>
            <div class="jumbotron">
                <h1>Heading text</h1>
                <p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                <p><a class="btn btn-primary" role="button" href="#">Learn more</a></p>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane active" id="tab-5">
            <p>Content for tab 5.</p>
            <div class="jumbotron">
                <h1>Heading text</h1>
                <p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                <p><a class="btn btn-primary" role="button" href="#">Learn more</a></p>
            </div>
            <div class="jumbotron">
                <h1>Heading text</h1>
                <p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                <p><a class="btn btn-primary" role="button" href="#">Learn more</a></p>
            </div>
            <div class="jumbotron">
                <h1>Heading text</h1>
                <p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                <p><a class="btn btn-primary" role="button" href="#">Learn more</a></p>
            </div>
            <div class="jumbotron">
                <h1>Heading text</h1>
                <p>Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                <p><a class="btn btn-primary" role="button" href="#">Learn more</a></p>
            </div>
        </div>
    </div>
</div>
                            <div id="tab-1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
   
   <script> 
   var container = document.getElementById('demo');
   var counter = document.getElementById('count');
   var news= document.getElementById("showbtn");
   news.addEventListener("click",function(){
	   var xhttp = new XMLHttpRequest();
	   xhttp.open("GET", "https://newsapi.org/v2/top-headlines?from=2019-03-10&to=2019-04-07&country=in&apiKey=1d3d595a0eb04f0f927cc183bfab6464", true);
	
	   xhttp.onload = function(){
	 	  var mydat = JSON.parse(xhttp.responseText);
	 		renderHTML(mydat);
	 		console.log(mydat);
	   };
	 xhttp.send();

   });

function renderHTML(data){

	var htmlString="";
	var cnt=0;
	for(i=0;i<data.articles.length;i++){
	if((data.articles[i].title).includes("elections") ||(data.articles[i].title).includes("election")|| (data.articles[i].title).includes("Elections") ||(data.articles[i].title).includes("Election")
	|| (data.articles[i].title).includes("BJP")||(data.articles[i].title).includes("Congress")|| (data.articles[i].title).includes("UPA")|| (data.articles[i].title).includes("NDA")){
		
	cnt++;
	htmlString+="<div class='jumbotron' ><h3>"+ data.articles[i].title + "</h3><p>" +data.articles[i].content + "</p><p><a class='btn btn-primary' role='button' href='"+data.articles[i].url+"''>Learn more</a></p></div>";
	}
	
	}
	container.insertAdjacentHTML('beforeend',htmlString);
	counter.insertAdjacentHTML('beforeend',"Showing " + cnt +" revevant results out of " + i + " fetched");

}
</script>
</body>

</html>
