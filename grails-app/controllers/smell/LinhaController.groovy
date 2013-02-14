package smell

import org.springframework.dao.DataIntegrityViolationException

class LinhaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [linhaInstanceList: Linha.list(params), linhaInstanceTotal: Linha.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[linhaInstance: new Linha(params)]
			break
		case 'POST':
	        def linhaInstance = new Linha(params)
	        if (!linhaInstance.save(flush: true)) {
	            render view: 'create', model: [linhaInstance: linhaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'linha.label', default: 'Linha'), linhaInstance.id])
	        redirect action: 'show', id: linhaInstance.id
			break
		}
    }

    def show() {
        def linhaInstance = Linha.get(params.id)
        if (!linhaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'linha.label', default: 'Linha'), params.id])
            redirect action: 'list'
            return
        }

        [linhaInstance: linhaInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def linhaInstance = Linha.get(params.id)
	        if (!linhaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'linha.label', default: 'Linha'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [linhaInstance: linhaInstance]
			break
		case 'POST':
	        def linhaInstance = Linha.get(params.id)
	        if (!linhaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'linha.label', default: 'Linha'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (linhaInstance.version > version) {
	                linhaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'linha.label', default: 'Linha')] as Object[],
	                          "Another user has updated this Linha while you were editing")
	                render view: 'edit', model: [linhaInstance: linhaInstance]
	                return
	            }
	        }

	        linhaInstance.properties = params

	        if (!linhaInstance.save(flush: true)) {
	            render view: 'edit', model: [linhaInstance: linhaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'linha.label', default: 'Linha'), linhaInstance.id])
	        redirect action: 'show', id: linhaInstance.id
			break
		}
    }

    def delete() {
        def linhaInstance = Linha.get(params.id)
        if (!linhaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'linha.label', default: 'Linha'), params.id])
            redirect action: 'list'
            return
        }

        try {
            linhaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'linha.label', default: 'Linha'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'linha.label', default: 'Linha'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
