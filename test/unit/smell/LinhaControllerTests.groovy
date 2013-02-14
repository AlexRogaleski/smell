package smell



import org.junit.*
import grails.test.mixin.*

@TestFor(LinhaController)
@Mock(Linha)
class LinhaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/linha/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.linhaInstanceList.size() == 0
        assert model.linhaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.linhaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.linhaInstance != null
        assert view == '/linha/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/linha/show/1'
        assert controller.flash.message != null
        assert Linha.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/linha/list'

        populateValidParams(params)
        def linha = new Linha(params)

        assert linha.save() != null

        params.id = linha.id

        def model = controller.show()

        assert model.linhaInstance == linha
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/linha/list'

        populateValidParams(params)
        def linha = new Linha(params)

        assert linha.save() != null

        params.id = linha.id

        def model = controller.edit()

        assert model.linhaInstance == linha
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/linha/list'

        response.reset()

        populateValidParams(params)
        def linha = new Linha(params)

        assert linha.save() != null

        // test invalid parameters in update
        params.id = linha.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/linha/edit"
        assert model.linhaInstance != null

        linha.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/linha/show/$linha.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        linha.clearErrors()

        populateValidParams(params)
        params.id = linha.id
        params.version = -1
        controller.update()

        assert view == "/linha/edit"
        assert model.linhaInstance != null
        assert model.linhaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/linha/list'

        response.reset()

        populateValidParams(params)
        def linha = new Linha(params)

        assert linha.save() != null
        assert Linha.count() == 1

        params.id = linha.id

        controller.delete()

        assert Linha.count() == 0
        assert Linha.get(linha.id) == null
        assert response.redirectedUrl == '/linha/list'
    }
}
