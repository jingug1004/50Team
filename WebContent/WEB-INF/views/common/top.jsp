<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>
<html>
<head>



<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">

<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">


</head>

<body>


<jsp:useBean id="nows" class="java.util.Date"/>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand$</a>
      
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        
        
        
        <li class="dropdown">
          <a class="dropdown-toggle" role="button" aria-expanded="false" href="#" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        
        
      </ul>
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input class="form-control" type="text" placeholder="Search">
        </div>
        <button class="btn btn-default" type="submit">Submit</button>
      </form>
		<i class="fa fa-user fa-3x" aria-hidden="true"></i>
		<i class="fa fa-globe fa-3x" aria-hidden="true"></i>
		<i class="fa fa-comment-o fa-3x" aria-hidden="true"></i>
		<i class="fa fa-caret-down fa-3x" aria-hidden="true"></i>
      <ul class="nav navbar-nav navbar-right">
      	
        <li><a href="#">Link</a></li>
      </ul>
    </div>
  </div>
</nav>
	






</body>
</html>
