
<%@ page import="smell.Compra" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
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
						
							<g:sortableColumn property="data" title="${message(code: 'compra.data.label', default: 'Data')}" />
						
							<g:sortableColumn property="numeroNota" title="${message(code: 'compra.numeroNota.label', default: 'Número da Nota')}" />
							
							<g:sortableColumn property="deposito" title="${message(code: 'compra.deposito.label', default: 'Depósito')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${compraInstanceList}" var="compraInstance">
						<tr>
						
							<td><g:formatDate date="${compraInstance.data}" format="dd-MM-yyyy"/></td>
						
							<td>${fieldValue(bean: compraInstance, field: "numeroNota")}</td>
							
							<td>${fieldValue(bean: compraInstance, field: "deposito")}</td>
						
							<td class="link">
								<g:link action="show" id="${compraInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${compraInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
