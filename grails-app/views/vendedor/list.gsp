
<%@ page import="smell.Vendedor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'vendedor.label', default: 'Vendedor')}" />
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
						
							<g:sortableColumn property="nome" title="${message(code: 'vendedor.nome.label', default: 'Nome')}" />
						
							<g:sortableColumn property="cpf" title="${message(code: 'vendedor.cpf.label', default: 'Cpf')}" />
						
							<g:sortableColumn property="rg" title="${message(code: 'vendedor.rg.label', default: 'Rg')}" />
						
							<th class="header"><g:message code="vendedor.endereco.label" default="Endereço" /></th>
						
							<g:sortableColumn property="telefone" title="${message(code: 'vendedor.telefone.label', default: 'Telefone')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${vendedorInstanceList}" var="vendedorInstance">
						<tr>
						
							<td>${fieldValue(bean: vendedorInstance, field: "nome")}</td>
						
							<td>${fieldValue(bean: vendedorInstance, field: "cpf")}</td>
						
							<td>${fieldValue(bean: vendedorInstance, field: "rg")}</td>
						
							<td>${fieldValue(bean: vendedorInstance, field: "endereco")}</td>
						
							<td>${fieldValue(bean: vendedorInstance, field: "telefone")}</td>
						
							<td class="link">
								<g:link action="show" id="${vendedorInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${vendedorInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
