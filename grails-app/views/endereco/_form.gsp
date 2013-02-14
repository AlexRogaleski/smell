<%@ page import="smell.Endereco" %>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'bairro', 'error')} ">
	<label for="bairro">
		<g:message code="endereco.bairro.label" default="Bairro" />
		
	</label>
	<g:textField name="bairro" value="${enderecoInstance?.bairro}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'cidade', 'error')} ">
	<label for="cidade">
		<g:message code="endereco.cidade.label" default="Cidade" />
		
	</label>
	<g:textField name="cidade" value="${enderecoInstance?.cidade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'endereco', 'error')} ">
	<label for="endereco">
		<g:message code="endereco.endereco.label" default="Endereço" />
		
	</label>
	<g:textField name="endereco" value="${enderecoInstance?.endereco}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'numero', 'error')} ">
	<label for="numero">
		<g:message code="endereco.numero.label" default="Número" />
		
	</label>
	<g:textField name="numero" value="${enderecoInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: enderecoInstance, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="endereco.estado.label" default="Estado" />
		
	</label>
	<g:select name="estado" from="${enderecoInstance.constraints.estado.inList}" value="${enderecoInstance.estado}" noSelection="['':'']" valueMessagePrefix="enderecoInstance.estado"/>
</div>


