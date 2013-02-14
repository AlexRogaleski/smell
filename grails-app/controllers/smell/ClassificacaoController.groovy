package smell

import org.springframework.dao.DataIntegrityViolationException

class ClassificacaoController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [classificacaoInstanceList: Classificacao.list(params), classificacaoInstanceTotal: Classificacao.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[classificacaoInstance: new Classificacao(params)]
			break
		case 'POST':
	        def classificacaoInstance = new Classificacao(params)
	        if (!classificacaoInstance.save(flush: true)) {
	            render view: 'create', model: [classificacaoInstance: classificacaoInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), classificacaoInstance.id])
	        redirect action: 'show', id: classificacaoInstance.id
			break
		}
    }

    def show() {
        def classificacaoInstance = Classificacao.get(params.id)
        if (!classificacaoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])
            redirect action: 'list'
            return
        }

        [classificacaoInstance: classificacaoInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def classificacaoInstance = Classificacao.get(params.id)
	        if (!classificacaoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [classificacaoInstance: classificacaoInstance]
			break
		case 'POST':
	        def classificacaoInstance = Classificacao.get(params.id)
	        if (!classificacaoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (classificacaoInstance.version > version) {
	                classificacaoInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'classificacao.label', default: 'Classificacao')] as Object[],
	                          "Another user has updated this Classificacao while you were editing")
	                render view: 'edit', model: [classificacaoInstance: classificacaoInstance]
	                return
	            }
	        }

	        classificacaoInstance.properties = params

	        if (!classificacaoInstance.save(flush: true)) {
	            render view: 'edit', model: [classificacaoInstance: classificacaoInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), classificacaoInstance.id])
	        redirect action: 'show', id: classificacaoInstance.id
			break
		}
    }

    def delete() {
        def classificacaoInstance = Classificacao.get(params.id)
        if (!classificacaoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])
            redirect action: 'list'
            return
        }

        try {
            classificacaoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'classificacao.label', default: 'Classificacao'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
