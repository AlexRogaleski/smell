<%@ page import="smell.Venda" %>



<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="venda.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${vendaInstance?.data}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'vendedor', 'error')} required">
	<label for="vendedor">
		<g:message code="venda.vendedor.label" default="Vendedor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vendedor" name="vendedor.id" from="${smell.Vendedor.list()}" optionKey="id" required="" value="${vendaInstance?.vendedor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'deposito', 'error')} required">
	<label for="deposito">
		<g:message code="venda.deposito.label" default="Depósito" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="deposito" name="deposito.id" from="${smell.Deposito.list()}" optionKey="id" required="" value="${vendaInstance?.deposito?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: vendaInstance, field: 'perfumes', 'error')} ">
	<label for="perfumes">
		<g:message code="venda.perfumes.label" default="Perfumes" />
		
	</label>
	<%--<g:select name="perfumes" from="${smell.Perfume.list()}" multiple="multiple" optionKey="id" size="5" value="${vendaInstance?.perfumes*.id}" class="many-to-many"/>
</div> --%>
<input id='ordemAuto' size=70>
 <a href="#" id="addButton">Adicionar</a>
   
  <br><br>
    <table id="perfumes">
      <tr>
            <th>Perfumes</th>
            <th>Quantidade</th>   
      </tr>
    </table>
  
    <div id="res"></div>

    <g:hiddenField name="listaPerfumes" value="AddValor" />
    
    <g:hiddenField id="idperfumesAdd" name="idperfumesAdd" />
    
  </div>
<script>
 
  
  $( "#addButton" ).click(function() {

	  if ( $( '#idperfumesAdd').val() != null && $('#ordemAuto').val() ){

		  var input = document.createElement('input');
		  $(input).attr("value", $( '#idperfumesAdd').val() );
		  $(input).attr("name", 'perfumes.id' );
		  $(input).attr("type", 'hidden' );

		  var inputQuant = document.createElement('input');
		  $(inputQuant).attr("name", 'perfumes.quantidade' );
		  $(inputQuant).attr("type", 'text' );
		  $(inputQuant).attr("value", "0" );
		  $(inputQuant).attr("size", 2 );

		  $('<tr>' + '<td>' + $('#ordemAuto').val() + input.outerHTML + '</td>' + '<td>' + inputQuant.outerHTML  +  '</td>' + '</tr>').appendTo($('#perfumes'));
		
		  $( '#idperfumesAdd').val("");
		  $('#ordemAuto').val("");
	  }
  });

</script>


