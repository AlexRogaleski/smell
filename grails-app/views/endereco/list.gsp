
<%@ page import="smell.Endereco" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereco')}" />
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
						
							<g:sortableColumn property="estado" title="${message(code: 'endereco.estado.label', default: 'Estado')}" />
						
							<g:sortableColumn property="bairro" title="${message(code: 'endereco.bairro.label', default: 'Bairro')}" />
						
							<g:sortableColumn property="cidade" title="${message(code: 'endereco.cidade.label', default: 'Cidade')}" />
						
							<g:sortableColumn property="endereco" title="${message(code: 'endereco.endereco.label', default: 'Endereço')}" />
						
							<g:sortableColumn property="numero" title="${message(code: 'endereco.numero.label', default: 'Número')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${enderecoInstanceList}" var="enderecoInstance">
						<tr>
						
							<td>${fieldValue(bean: enderecoInstance, field: "estado")}</td>
						
							<td>${fieldValue(bean: enderecoInstance, field: "bairro")}</td>
						
							<td>${fieldValue(bean: enderecoInstance, field: "cidade")}</td>
						
							<td>${fieldValue(bean: enderecoInstance, field: "endereco")}</td>
						
							<td>${fieldValue(bean: enderecoInstance, field: "numero")}</td>
						
							<td class="link">
								<g:link action="show" id="${enderecoInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${enderecoInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
