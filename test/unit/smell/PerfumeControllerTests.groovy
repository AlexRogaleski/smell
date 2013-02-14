package smell



import org.junit.*
import grails.test.mixin.*

@TestFor(PerfumeController)
@Mock(Perfume)
class PerfumeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/perfume/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.perfumeInstanceList.size() == 0
        assert model.perfumeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.perfumeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.perfumeInstance != null
        assert view == '/perfume/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/perfume/show/1'
        assert controller.flash.message != null
        assert Perfume.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/perfume/list'

        populateValidParams(params)
        def perfume = new Perfume(params)

        assert perfume.save() != null

        params.id = perfume.id

        def model = controller.show()

        assert model.perfumeInstance == perfume
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/perfume/list'

        populateValidParams(params)
        def perfume = new Perfume(params)

        assert perfume.save() != null

        params.id = perfume.id

        def model = controller.edit()

        assert model.perfumeInstance == perfume
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/perfume/list'

        response.reset()

        populateValidParams(params)
        def perfume = new Perfume(params)

        assert perfume.save() != null

        // test invalid parameters in update
        params.id = perfume.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/perfume/edit"
        assert model.perfumeInstance != null

        perfume.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/perfume/show/$perfume.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        perfume.clearErrors()

        populateValidParams(params)
        params.id = perfume.id
        params.version = -1
        controller.update()

        assert view == "/perfume/edit"
        assert model.perfumeInstance != null
        assert model.perfumeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/perfume/list'

        response.reset()

        populateValidParams(params)
        def perfume = new Perfume(params)

        assert perfume.save() != null
        assert Perfume.count() == 1

        params.id = perfume.id

        controller.delete()

        assert Perfume.count() == 0
        assert Perfume.get(perfume.id) == null
        assert response.redirectedUrl == '/perfume/list'
    }
}
