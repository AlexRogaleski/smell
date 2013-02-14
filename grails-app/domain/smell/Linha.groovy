package smell

class Linha {

    static constraints = {
		descricao unique: true
		descricao blank: false
    }
	String descricao
	String toString() {
		return descricao;
	}
}
