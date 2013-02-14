package smell

class Perfume {

    static constraints = {
		numero unique: true
		numero blank: false
		inspiracao blank: false
    }
	String numero
	String inspiracao
	Classificacao classificacao
	Linha linha
	Double valor
	String toString() {
		"${numero} ${inspiracao}"
		//return numero + ' ' + inspiracao;
	}
}
