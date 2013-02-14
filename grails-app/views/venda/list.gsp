
<%@ page import="smell.Venda" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
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
						
							<g:sortableColumn property="data" title="${message(code: 'venda.data.label', default: 'Data')}" />
						
							<th class="header"><g:message code="venda.vendedor.label" default="Vendedor" /></th>
							
							<th class="header"><g:message code="venda.deposito.label" default="Depósito" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${vendaInstanceList}" var="vendaInstance">
						<tr>
						
							<td><g:formatDate date="${vendaInstance.data}" format="dd-MM-yyyy" /></td>
						
							<td>${fieldValue(bean: vendaInstance, field: "vendedor")}</td>
							
							<td>${fieldValue(bean: vendaInstance, field: "deposito")}</td>
						
							<td class="link">
								<g:link action="show" id="${vendaInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${vendaInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
