
<%@ page import="smell.Perfume" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'perfume.label', default: 'Perfume')}" />
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
				
					<g:if test="${perfumeInstance?.numero}">
						<dt><g:message code="perfume.numero.label" default="Número" /></dt>
						
							<dd><g:fieldValue bean="${perfumeInstance}" field="numero"/></dd>
						
					</g:if>
				
					<g:if test="${perfumeInstance?.inspiracao}">
						<dt><g:message code="perfume.inspiracao.label" default="Inspiração" /></dt>
						
							<dd><g:fieldValue bean="${perfumeInstance}" field="inspiracao"/></dd>
						
					</g:if>
				
					<g:if test="${perfumeInstance?.classificacao}">
						<dt><g:message code="perfume.classificacao.label" default="Classificação" /></dt>
						
							<dd><g:link controller="classificacao" action="show" id="${perfumeInstance?.classificacao?.id}">${perfumeInstance?.classificacao?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${perfumeInstance?.linha}">
						<dt><g:message code="perfume.linha.label" default="Linha" /></dt>
						
							<dd><g:link controller="linha" action="show" id="${perfumeInstance?.linha?.id}">${perfumeInstance?.linha?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${perfumeInstance?.valor}">
						<dt><g:message code="perfume.valor.label" default="Valor" /></dt>
						
							<dd><g:fieldValue bean="${perfumeInstance}" field="valor"/></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${perfumeInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${perfumeInstance?.id}">
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
