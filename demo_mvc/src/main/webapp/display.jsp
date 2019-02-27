<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

int a =Integer.parseInt(request.getParameter("a"));

if( a == 1){
	out.print("Request Has Arrived");
}
else{
	out.print("I'm HEREEE" + request.getParameter("a") + " " + request.getParameter("b"));
}


%>
</body>
</html>