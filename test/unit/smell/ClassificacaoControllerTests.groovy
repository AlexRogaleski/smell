package smell



import org.junit.*
import grails.test.mixin.*

@TestFor(ClassificacaoController)
@Mock(Classificacao)
class ClassificacaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/classificacao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.classificacaoInstanceList.size() == 0
        assert model.classificacaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.classificacaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.classificacaoInstance != null
        assert view == '/classificacao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/classificacao/show/1'
        assert controller.flash.message != null
        assert Classificacao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/classificacao/list'

        populateValidParams(params)
        def classificacao = new Classificacao(params)

        assert classificacao.save() != null

        params.id = classificacao.id

        def model = controller.show()

        assert model.classificacaoInstance == classificacao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/classificacao/list'

        populateValidParams(params)
        def classificacao = new Classificacao(params)

        assert classificacao.save() != null

        params.id = classificacao.id

        def model = controller.edit()

        assert model.classificacaoInstance == classificacao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/classificacao/list'

        response.reset()

        populateValidParams(params)
        def classificacao = new Classificacao(params)

        assert classificacao.save() != null

        // test invalid parameters in update
        params.id = classificacao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/classificacao/edit"
        assert model.classificacaoInstance != null

        classificacao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/classificacao/show/$classificacao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        classificacao.clearErrors()

        populateValidParams(params)
        params.id = classificacao.id
        params.version = -1
        controller.update()

        assert view == "/classificacao/edit"
        assert model.classificacaoInstance != null
        assert model.classificacaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/classificacao/list'

        response.reset()

        populateValidParams(params)
        def classificacao = new Classificacao(params)

        assert classificacao.save() != null
        assert Classificacao.count() == 1

        params.id = classificacao.id

        controller.delete()

        assert Classificacao.count() == 0
        assert Classificacao.get(classificacao.id) == null
        assert response.redirectedUrl == '/classificacao/list'
    }
}
