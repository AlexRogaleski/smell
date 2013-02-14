package smell



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Perfume)
class PerfumeTests {

    void testSave() {
		Perfume teste = new Perfume(numero:'01', inspiracao:'Ferrari', classificacao:'Masculino', linha:'Perfume', valor:99.99)
		teste.save()
		
		Perfume perfume = Perfume.get(teste.id)
		assertEquals(perfume.numero, '01')
		assertEquals(perfume.inspiracao,'Ferrari')
		assertEquals(perfume.classificacao, 'Masculino')
		assertEquals(perfume.linha, 'Perfume')
		assertEquals(perfume.valor, 99.99)       
    }  
	
	void testDelete() {
		Perfume teste = new Perfume(numero:'01', inspiracao:'Ferrari', classificacao:'Masculino', linha:'Perfume', valor:99.9)
		teste.save()
		
		teste.delete()
		assertNull Perfume.findById(teste.id)		
	}
	
	void testeUpdate(){
		Perfume teste = new Perfume(numero:'01', inspiracao:'Ferrari', classificacao:'Masculino', linha:'Perfume', valor:99.99)
		teste.save()
		
		Perfume perfume = Perfume.get(teste.id)
		assertEquals(perfume.numero, '01')
		assertEquals(perfume.inspiracao,'Ferrari')
		assertEquals(perfume.classificacao, 'Masculino')
		assertEquals(perfume.linha, 'Perfume')
		assertEquals(perfume.valor, 99.99)
		
		teste.inspiracao = 'Coffee'
		teste.valor = 70
		teste.save()
		
		perfume.get(teste.id)
		assertEquals(perfume.numero, '01')
		assertEquals(perfume.inspiracao,'Coffee')
		assertEquals(perfume.classificacao, 'Masculino')
		assertEquals(perfume.linha, 'Perfume')
		assertEquals(perfume.valor, 70)
		
	}	
		
	void testUniqueNull() {
		 def perfumeExistente = new Perfume(numero:'01', inspiracao:'Ferrari', classificacao:'Masculino', linha:'Perfume', valor:99.99)

        mockForConstraintsTests(Perfume, [perfumeExistente])

        // validação deve falhar se ambas as propriedades são nulos
        def perfume = new Perfume()

        assert !perfume.validate()
        assert "nullable" == perfume.errors["numero"]
		assert "nullable" == perfume.errors["inspiracao"]

        // validação de campo unico
        perfume = new Perfume(numero:'01', inspiracao:'Malbec', classificacao:'Masculino', linha:'Perfume', valor:79.99)
        assert !perfume.validate()
        assert "unique" == perfume.errors["numero"]

        // validação devera passar
        perfume = new Perfume(numero:'02', inspiracao:'Malbec', classificacao:'Masculino', linha:'Perfume', valor:79.99)
        assert perfume.validate()			   
	}
}
