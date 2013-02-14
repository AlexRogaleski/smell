package smell

import java.util.Formatter.DateTime;

class Compra {
	Date data
	int numeroNota
	static hasMany = [itens: ItemDeCompra]
	Deposito deposito;
    static constraints = {
		data blank : false
    }
	static mapping = {
		//itens cascade: 'all'	
	}
	
}
