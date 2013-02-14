package smell

class Endereco {

    static constraints = {
		estado inList: ["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RR", "RO", "RJ", "RN", "RS", "SC", "SP", "SE", "TO"]
    }
	String endereco
	String bairro
	String numero
	String cidade
	String estado	
	String toString() {
		"${endereco}, ${numero}, ${bairro}, ${cidade}-${estado}"
		//return endereco + ', ' + numero + ', ' + bairro + ', ' + cidade + '-' + estado;	
	}
}
