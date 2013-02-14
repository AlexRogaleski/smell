package smell

class Deposito {

    static constraints = {
		nome blank: false
    }	
	String nome	
	String telefone	
	static mapping = {
		endereco cascade: 'all'
	}
	Endereco endereco
	String toString() {
		return nome;
	}
}
