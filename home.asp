<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- #include file="includes/config.asp"-->
<!-- #include file="includes/functions.asp"-->
<!-- #include file="includes/md5.asp"-->
<%
'=== login ===
if session("login") <> "login" then
  	response.Redirect("login.asp")
end if

'=== logout ===
sair = request("logout")
if sair = "s" then
  	session.Abandon()
	  response.Redirect("login.asp")
end if

'=== variáveis ===
id = request("id")
acao = request("acao")
userid = Session("userid")
usertype = Session("usertype")
if usertype <> 1 then
	response.Redirect("default.asp")
end if
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>COMPREV - EMBRAC</title>
  <meta name="description" content="sistema comprev - compensação previdenciária">
  <meta name="author" content="embrac">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- google font -->
  <!--link href="http://fonts.googleapis.com/css?family=Aclonica:regular" rel="stylesheet" type="text/css" /-->
    
  <!-- styles -->
  
  <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/bootstrap-responsive.css" rel="stylesheet">
  <link href="css/stilearn.css" rel="stylesheet">
  <link href="css/stilearn-responsive.css" rel="stylesheet">
  <link href="css/stilearn-helper.css" rel="stylesheet">
  <link href="awesome/assets/css/font-awesome.min.css" rel="stylesheet">
  <link href="css/animate.css" rel="stylesheet">
  <link href="css/uniform.default.css" rel="stylesheet">
  <link href="css/select2.css" rel="stylesheet">
  <link href="css/bootstrap-wysihtml5.css" rel="stylesheet">
  <link href="css/datepicker.css" rel="stylesheet">
  
  <link href="css/DT_bootstrap.css" rel="stylesheet">
  <link href="css/responsive-tables.css" rel="stylesheet">  
  
  <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <!--[if IE 7]>
  <link href="awesome/assets/css/font-awesome-ie7.min.css" rel="stylesheet">
  <![endif]-->
</head>

<body>

<!-- #include file="includes/header.asp"-->

<section class="section">
<div class="row-fluid">
  <div class="span12">
    <div class="content-home">
        <!-- #include file="includes/content-header.asp"-->
        <%select case id%>
				<%case empty%>
          <!-- # include file="includes/content-body-home.asp"-->
          <!-- #include file="includes/entidades.asp"-->
          
        <%case "entidades"%>
				<!-- #include file="includes/entidades.asp"-->

        <%case "configuracoes"%>
        <!-- #include file="includes/configuracoes.asp"-->
        
        <%case "relatorio_adm"%>
        <!-- #include file="includes/relatorio_adm.asp"-->
          
        <%end select%>        
    </div>
  </div>
</div>
</section>










<!-- #include file="includes/scripts.asp"-->














</body>
</html>
