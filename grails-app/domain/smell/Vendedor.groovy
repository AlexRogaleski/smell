package smell

class Vendedor {

    static constraints = {
		nome unique: true
		nome blank: false
		cpf unique: true
		rg unique: true
    }
	String nome
	String cpf
	String rg
	String telefone
	static mapping = {
		endereco cascade: 'all'
	}
	Endereco endereco
	String toString() {
		return nome;
	}
	
}
