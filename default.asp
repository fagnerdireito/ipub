<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!-- #include file="includes/config.asp"-->
<!-- #include file="includes/functions.asp"-->
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

'=======entidade=======
if Session("entidade") <> "" then
	codEntidade = Session("entidade")
else
	set rs=conexao.execute("SELECT entidade FROM users WHERE codigo = "&userid&";")
	codEntidade = rs("entidade")
	rs.close
	set rs=nothing
end if
'=======================
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>COMPREV - EMBRAC</title>
  <meta name="description" content="sistema comprev - compensação previdenciária">
  <meta name="author" content="embrac">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- google font -->
  <link href="http://fonts.googleapis.com/css?family=Aclonica:regular" rel="stylesheet" type="text/css" />
    
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
  <div class="span1">
    <aside class="side-left">
      <!-- #include file="includes/menu-primario.asp"-->
    </aside>
	</div>
  <div class="span11">
    <div class="content">
        <!-- #include file="includes/content-header.asp"-->
        <%select case id%>
				<%case empty%>
          <!-- #include file="includes/content-body-adm.asp"-->
          
        <%case "processos"%>
					<!-- #include file="includes/processos.asp"-->
        
        <%case "cadastro"%>
          <!-- #include file="includes/cadastro.asp"-->
          
        <%case "ctc"%>
          <!-- #include file="includes/ctc.asp"-->
          
        <%case "documentos"%>
          <!-- #include file="includes/documentos.asp"-->
          
        <%case "relatorios"%>
          <!-- #include file="includes/relatorios.asp"-->
          
        <%case "dependentes"%>
					<!-- #include file="includes/cadastro-dependentes.asp"-->
          
        <%end select%>        
    </div>
  </div>
</div>
</section>



<!-- #include file="includes/scripts.asp"-->










</body>
</html>
