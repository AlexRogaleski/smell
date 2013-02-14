<%@ page import="smell.Linha" %>



<div class="fieldcontain ${hasErrors(bean: linhaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="linha.descricao.label" default="Descrição" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${linhaInstance?.descricao}"/>
</div>

