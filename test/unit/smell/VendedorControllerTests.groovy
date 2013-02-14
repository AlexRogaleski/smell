package smell



import org.junit.*
import grails.test.mixin.*

@TestFor(VendedorController)
@Mock(Vendedor)
class VendedorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/vendedor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.vendedorInstanceList.size() == 0
        assert model.vendedorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.vendedorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.vendedorInstance != null
        assert view == '/vendedor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/vendedor/show/1'
        assert controller.flash.message != null
        assert Vendedor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/vendedor/list'

        populateValidParams(params)
        def vendedor = new Vendedor(params)

        assert vendedor.save() != null

        params.id = vendedor.id

        def model = controller.show()

        assert model.vendedorInstance == vendedor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/vendedor/list'

        populateValidParams(params)
        def vendedor = new Vendedor(params)

        assert vendedor.save() != null

        params.id = vendedor.id

        def model = controller.edit()

        assert model.vendedorInstance == vendedor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/vendedor/list'

        response.reset()

        populateValidParams(params)
        def vendedor = new Vendedor(params)

        assert vendedor.save() != null

        // test invalid parameters in update
        params.id = vendedor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/vendedor/edit"
        assert model.vendedorInstance != null

        vendedor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/vendedor/show/$vendedor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        vendedor.clearErrors()

        populateValidParams(params)
        params.id = vendedor.id
        params.version = -1
        controller.update()

        assert view == "/vendedor/edit"
        assert model.vendedorInstance != null
        assert model.vendedorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/vendedor/list'

        response.reset()

        populateValidParams(params)
        def vendedor = new Vendedor(params)

        assert vendedor.save() != null
        assert Vendedor.count() == 1

        params.id = vendedor.id

        controller.delete()

        assert Vendedor.count() == 0
        assert Vendedor.get(vendedor.id) == null
        assert response.redirectedUrl == '/vendedor/list'
    }
}
