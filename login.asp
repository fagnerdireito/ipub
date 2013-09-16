<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%'Option Explicit%>
<!-- #include file="includes/config.asp"-->
<!-- #include file="includes/md5.asp"-->
<!-- #include file="includes/functions.asp"-->
<%
'=== variáveis ===
'id = request("id")
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
        <%'select case id%>
				<%'case empty%>
						<!--Sign In-->
            <div class="content-body">
            	<br>
              <div class="container-fluid">
                <div class="row-fluid">
                  <div class="span12">
                    <div class="span4 offset4">
                        <div class="box corner-all">
                            <div class="box-header grd-teal color-white corner-top">
                                <span>Login</span>
                            </div>
                            <div class="box-body bg-white">
                                <form id="login" method="post" name="form" action="login.asp">
                                    <div class="control-group">
                                        <label class="control-label" for="login">Email</label>
                                        <div class="controls">
                                            <input type="text" class="input-block-level" data-validate="{required: true, email:true, messages:{required:'Digite o email', email:'Digite um email válido.'}}" name="login" id="login" autocomplete="on" autofocus />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Senha</label>
                                        <div class="controls">
                                            <input type="password" class="input-block-level" data-validate="{required: true, messages:{required:'Senha incorreta'}}" name="senha" id="senha" autocomplete="on" />
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <div class="pull-right helper-font-32">
                                            <a href="#" rel="tooltip-left" title="Sign in using twitter account"><i class="socialico-twitter-sign color-blue"></i></a>
                                            <a href="#" rel="tooltip-left" title="Sign in using facebook account"><i class="socialico-facebook-sign color-sky"></i></a>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <input type="submit" class="btn btn-block btn-large btn-primary" value="Entrar" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!--/Sign In-->
                    </div>
                  </div>
                </div>
              </div><!--/content-body -->
        
        
        
        
        
        
				
				
				<%'end select%>
    </div>
  </div>
</div>
</section>

<!-- #include file="includes/scripts.asp"-->



<%
if request.form <> "" then
	login = request.form("login")
	senha = request.form("senha")	
	
	login = ExpurgaApostrofe(login)
	login = LimpaLixo(login)
	senha = ExpurgaApostrofe(senha)
	senha = LimpaLixo(senha)
	
	senha = md5(senha)
	
	if login="" or senha="" then
		msgErro = "Login ou senha incorreta!"
		response.write "<script type=""text/javascript"">" &VbCrLf
		response.write "$(document).ready(function() {" &VbCrLf
		response.write "$('#modal-error-login').modal('toggle');" &VbCrLf
		response.write "});</script>" &VbCrLf
	else
    set rs=conexao.execute("SELECT * FROM users WHERE login='"&login&"' AND ver='S';")
		'login = rs("login")
    if rs.eof = false then
      if rs.fields("senha") = senha then
				userid = rs("codigo")
				usertype = rs("tipo")
				Session("login") = "login"
				Session("usuario") = login
				Session("userid") = userid
				Session("usertype") = usertype
				response.write usertype
				if usertype = 1 then
					response.Redirect("home.asp")
				else
					response.redirect("default.asp")
				end if 'Fim usertype
			else
				msgErro = "Senha incorreta!"
				response.write "<script type=""text/javascript"">" &VbCrLf
				response.write "$(document).ready(function() {" &VbCrLf
				response.write "$('#modal-error-login').modal('toggle');" &VbCrLf
				response.write "});</script>" &VbCrLf
      end if 'Fim if rs.fields
    else
			msgErro = "Login ou senha incorreta!"
			response.write "<script type=""text/javascript"">" &VbCrLf
			response.write "$(document).ready(function() {" &VbCrLf
			response.write "$('#modal-error-login').modal('toggle');" &VbCrLf
			response.write "});"&VbCrLf
      response.write "</script>" &VbCrLf
		end if 'Fim rs.eof
	end if 'Fim login
	
end if

if msgErro <> "" then
	msgErro = msgErro
end if

'==============
rs.close
set rs=nothing



%>

<!-- modal erro -->
<div id="modal-error-login" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modal-recoverLabel" aria-hidden="true">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h3 id="modal-recoverLabel-1">Atenção!<small>&nbsp;</small></h3>
</div>
<div class="modal-body">	
  <div class="control-group">
      <div class="controls">
          <p class="help-block help-inline"><%=msgErro%></p>
      </div>
  </div>
</div>
<div class="modal-footer">
	<button id="btn-modal-error" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">OK</button>
</div>
</div><!-- /modal erro-->






</body>
</html>
