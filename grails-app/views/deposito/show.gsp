
<%@ page import="smell.Deposito" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'deposito.label', default: 'Depósito')}" />
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
				
					<g:if test="${depositoInstance?.nome}">
						<dt><g:message code="deposito.nome.label" default="Nome" /></dt>
						
							<dd><g:fieldValue bean="${depositoInstance}" field="nome"/></dd>
						
					</g:if>
				
					<g:if test="${depositoInstance?.endereco}">
						<dt><g:message code="deposito.endereco.label" default="Endereço" /></dt>
						
							<dd><g:link controller="endereco" action="show" id="${depositoInstance?.endereco?.id}">${depositoInstance?.endereco?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${depositoInstance?.telefone}">
						<dt><g:message code="deposito.telefone.label" default="Telefone" /></dt>
						
							<dd><g:fieldValue bean="${depositoInstance}" field="telefone"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${depositoInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${depositoInstance?.id}">
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
