package smell

import org.springframework.dao.DataIntegrityViolationException

class DepositoController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [depositoInstanceList: Deposito.list(params), depositoInstanceTotal: Deposito.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[depositoInstance: new Deposito(params), enderecoInstance: new Endereco(params)]
			break
		case 'POST':
			println params
			def endereco = new Endereco(params.endereco )
			endereco.save()
					
	        def depositoInstance = new Deposito(params)
			depositoInstance.endereco = endereco
	        if (!depositoInstance.save(flush: true)) {
	            render view: 'create', model: [depositoInstance: depositoInstance, enderecoInstance: depositoInstance.endereco]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'deposito.label', default: 'Deposito'), depositoInstance.id])
	        redirect action: 'show', id: depositoInstance.id
			break
		}
    }

    def show() {
        def depositoInstance = Deposito.get(params.id)
        if (!depositoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), params.id])
            redirect action: 'list'
            return
        }

        [depositoInstance: depositoInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def depositoInstance = Deposito.get(params.id)
	        if (!depositoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [depositoInstance: depositoInstance]
			break
		case 'POST':
	        def depositoInstance = Deposito.get(params.id)
	        if (!depositoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (depositoInstance.version > version) {
	                depositoInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'deposito.label', default: 'Deposito')] as Object[],
	                          "Another user has updated this Deposito while you were editing")
	                render view: 'edit', model: [depositoInstance: depositoInstance]
	                return
	            }
	        }

	        depositoInstance.properties = params

	        if (!depositoInstance.save(flush: true)) {
	            render view: 'edit', model: [depositoInstance: depositoInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'deposito.label', default: 'Deposito'), depositoInstance.id])
	        redirect action: 'show', id: depositoInstance.id
			break
		}
    }

    def delete() {
        def depositoInstance = Deposito.get(params.id)
        if (!depositoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'deposito.label', default: 'Deposito'), params.id])
            redirect action: 'list'
            return
        }

        try {
            depositoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'deposito.label', default: 'Deposito'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'deposito.label', default: 'Deposito'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
