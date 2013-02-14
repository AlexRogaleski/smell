package smell

class Venda {
	Date data
	Vendedor vendedor
	static hasMany = [itens: ItemDeVenda]
	Deposito deposito
    static constraints = {
		data blank : false
    }
	static mapping = {
		//itens cascade: 'all'	
	}	
}
