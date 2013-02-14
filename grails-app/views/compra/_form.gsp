<%@ page import="smell.Compra" %>



<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="compra.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${compraInstance?.data}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'numeroNota', 'error')} required">
	<label for="numeroNota">
		<g:message code="compra.numeroNota.label" default="Número Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numeroNota" type="number" value="${compraInstance.numeroNota}" required=""/>
</div>


<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'deposito', 'error')} required">
	<label for="deposito">
		<g:message code="compra.deposito.label" default="Depósito" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="deposito" name="deposito.id" from="${smell.Deposito.list()}" optionKey="id" required="" value="${compraInstance?.deposito?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'perfumes', 'error')} ">
	<label for="perfumes">
		<g:message code="compra.perfumes.label" default="Perfumes" />
		
	</label>
	<%--<g:select name="perfumes" from="${smell.Perfume.list()}" multiple="multiple" optionKey="id" size="5" value="${compraInstance?.perfumes*.id}" class="many-to-many"/> 
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
		 
		  $('<tr>' + '<td>' + $('#ordemAuto').val() + input.outerHTML + '</td>' + '<td allign="center">' + inputQuant.outerHTML  +  '</td>' + '</tr>').appendTo($('#perfumes'));
		
		  $( '#idperfumesAdd').val("");
		  $('#ordemAuto').val("");
	  }
  });

</script>


