
<%@ page import="smell.Venda" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'venda.label', default: 'Venda')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
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
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${vendaInstance?.data}">
						<dt><g:message code="venda.data.label" default="Data" /></dt>
						
							<dd><g:formatDate date="${vendaInstance?.data}" format="dd-MM-yyyy"/></dd>
						
					</g:if>
					
					<g:if test="${vendaInstance?.vendedor}">
						<dt><g:message code="venda.vendedor.label" default="Vendedor" /></dt>
						
							<dd><g:link controller="vendedor" action="show" id="${vendaInstance?.vendedor?.id}">${vendaInstance?.vendedor?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
					
					<g:if test="${vendaInstance?.deposito}">
						<dt><g:message code="venda.deposito.label" default="Depósito" /></dt>
						
							<dd><g:link controller="deposito" action="show" id="${vendaInstance?.deposito?.id}">${vendaInstance?.deposito?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${vendaInstance?.itens}">
						<dt><g:message code="venda.itens.label" default="Perfumes" /></dt>						
							<g:each in="${vendaInstance.itens}" var="p">
							<dd><g:link controller="perfume" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></dd>
							</g:each>						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${vendaInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${vendaInstance?.id}">
							<i class="icon-pencil"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
