<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<meta name="viewport" content="initial-scale = 1.0">

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<r:require modules="scaffolding"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">

		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
			<%--<div class="navbar navbar-inverse"> --%>
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<a class="brand" href="${createLink(uri: '/')}">Smell - Controle de Estoque de Perfumes</a>
					</br>
					</br>
					<div class="nav-collapse">
						<ul class="nav">							
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Início</a></li>
							<%-- <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
								<li<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
							</g:each>--%>
							<li class="dropdown">
							    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
							      Cadastros
							      <b class="caret"></b>
							    </a>
							    <ul class="dropdown-menu">
										<li><a href="${createLink(uri: '/Classificacao/index')}">Classificação</a></li>
										<li><a href="${createLink(uri: '/Linha/index')}">Linha</a></li>
										<li><a href="${createLink(uri: '/Deposito/index')}">Depósito</a></li> 
										<li><a href="${createLink(uri: '/Vendedor/index')}">Vendedor</a></li>
										<li><a href="${createLink(uri: '/Perfume/index')}">Perfume</a></li> 
										<li><a href="${createLink(uri: '/Endereco/index')}">Endereço</a></li>  				    		
							    </ul>
							</li>							
							<li><a href="${createLink(uri: '/Compra/index')}">Compra</a></li>
							<li><a href="${createLink(uri: '/Venda/index')}">Venda</a></li>							
							<li class="dropdown">
							    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
							      Relatórios
							      <b class="caret"></b>
							    </a>
							    <ul class="dropdown-menu">
							    	<li class="dropdown-submenu">
									    <a tabindex="-1" href="#">Estoque</a>
										<ul class="dropdown-menu">
											<g:jasperReport jasper="estoque" name="Estoque" format="PDF,HTML,XLSX" ></g:jasperReport> 
										</ul>
									</li>				    		
							    </ul>
							  </li>	    
						</ul>
					</div>
				</div>
			</div>
		</nav>

		<div class="container-fluid">
			<g:layoutBody/>

			<hr>

			<footer>
				<p>&copy; Smell 2012</p>
			</footer>
		</div>

		<r:layoutResources/>

	</body>
</html>