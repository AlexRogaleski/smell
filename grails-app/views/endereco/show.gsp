
<%@ page import="smell.Endereco" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'endereco.label', default: 'Endereço')}" />
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
				
					<g:if test="${enderecoInstance?.estado}">
						<dt><g:message code="endereco.estado.label" default="Estado" /></dt>
						
							<dd><g:fieldValue bean="${enderecoInstance}" field="estado"/></dd>
						
					</g:if>
				
					<g:if test="${enderecoInstance?.bairro}">
						<dt><g:message code="endereco.bairro.label" default="Bairro" /></dt>
						
							<dd><g:fieldValue bean="${enderecoInstance}" field="bairro"/></dd>
						
					</g:if>
				
					<g:if test="${enderecoInstance?.cidade}">
						<dt><g:message code="endereco.cidade.label" default="Cidade" /></dt>
						
							<dd><g:fieldValue bean="${enderecoInstance}" field="cidade"/></dd>
						
					</g:if>
				
					<g:if test="${enderecoInstance?.endereco}">
						<dt><g:message code="endereco.endereco.label" default="Endereço" /></dt>
						
							<dd><g:fieldValue bean="${enderecoInstance}" field="endereco"/></dd>
						
					</g:if>
				
					<g:if test="${enderecoInstance?.numero}">
						<dt><g:message code="endereco.numero.label" default="Número" /></dt>
						
							<dd><g:fieldValue bean="${enderecoInstance}" field="numero"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${enderecoInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${enderecoInstance?.id}">
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
