<%@ page import="smell.Classificacao" %>



<div class="fieldcontain ${hasErrors(bean: classificacaoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="classificacao.descricao.label" default="Descrição" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${classificacaoInstance?.descricao}"/>
</div>

