
<%@ page import="smell.Perfume" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'perfume.label', default: 'Perfume')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>

			<div class="span9">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="numero" title="${message(code: 'perfume.numero.label', default: 'Número')}" />
						
							<g:sortableColumn property="inspiracao" title="${message(code: 'perfume.inspiracao.label', default: 'Inspiração')}" />
						
							<th class="header"><g:message code="perfume.classificacao.label" default="Classificação" /></th>
						
							<th class="header"><g:message code="perfume.linha.label" default="Linha" /></th>
						
							<g:sortableColumn property="valor" title="${message(code: 'perfume.valor.label', default: 'Valor')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${perfumeInstanceList}" var="perfumeInstance">
						<tr>
						
							<td>${fieldValue(bean: perfumeInstance, field: "numero")}</td>
						
							<td>${fieldValue(bean: perfumeInstance, field: "inspiracao")}</td>
						
							<td>${fieldValue(bean: perfumeInstance, field: "classificacao")}</td>
						
							<td>${fieldValue(bean: perfumeInstance, field: "linha")}</td>
						
							<td>${fieldValue(bean: perfumeInstance, field: "valor")}</td>
						
							<td class="link">
								<g:link action="show" id="${perfumeInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${perfumeInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
