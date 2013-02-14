<%@ page import="smell.Perfume" %>



<div class="fieldcontain ${hasErrors(bean: perfumeInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="perfume.numero.label" default="Número" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numero" required="" value="${perfumeInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfumeInstance, field: 'inspiracao', 'error')} required">
	<label for="inspiracao">
		<g:message code="perfume.inspiracao.label" default="Inspiração" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="inspiracao" required="" value="${perfumeInstance?.inspiracao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfumeInstance, field: 'classificacao', 'error')} required">
	<label for="classificacao">
		<g:message code="perfume.classificacao.label" default="Classificação" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="classificacao" name="classificacao.id" from="${smell.Classificacao.list()}" optionKey="id" required="" value="${perfumeInstance?.classificacao?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfumeInstance, field: 'linha', 'error')} required">
	<label for="linha">
		<g:message code="perfume.linha.label" default="Linha" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="linha" name="linha.id" from="${smell.Linha.list()}" optionKey="id" required="" value="${perfumeInstance?.linha?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: perfumeInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="perfume.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="valor" value="${fieldValue(bean: perfumeInstance, field: 'valor')}" required=""/>
</div>

