package smell

import org.springframework.dao.DataIntegrityViolationException

class VendaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [vendaInstanceList: Venda.list(params), vendaInstanceTotal: Venda.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[vendaInstance: new Venda(params)]
			break
		case 'POST':
	        def vendaInstance = new Venda(params)
			
			def itens = []			
			params.perfumes.id.eachWithIndex { id, i ->
				
				def perfume = Perfume.get(Long.valueOf(id));
				def item = new ItemDeVenda(perfume: perfume);
				item.quantidade = Integer.valueOf(params.perfumes.quantidade[i])
				vendaInstance.addToItens(item)
			}			
			
	        if (!vendaInstance.save(flush: true)) {
	            render view: 'create', model: [vendaInstance: vendaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'venda.label', default: 'Venda'), vendaInstance.id])
	        redirect action: 'show', id: vendaInstance.id
			break
		}
    }

    def show() {
        def vendaInstance = Venda.get(params.id)
        if (!vendaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
            redirect action: 'list'
            return
        }

        [vendaInstance: vendaInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def vendaInstance = Venda.get(params.id)
	        if (!vendaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [vendaInstance: vendaInstance]
			break
		case 'POST':
	        def vendaInstance = Venda.get(params.id)
	        if (!vendaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (vendaInstance.version > version) {
	                vendaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'venda.label', default: 'Venda')] as Object[],
	                          "Another user has updated this Venda while you were editing")
	                render view: 'edit', model: [vendaInstance: vendaInstance]
	                return
	            }
	        }

	        vendaInstance.properties = params

	        if (!vendaInstance.save(flush: true)) {
	            render view: 'edit', model: [vendaInstance: vendaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'venda.label', default: 'Venda'), vendaInstance.id])
	        redirect action: 'show', id: vendaInstance.id
			break
		}
    }

    def delete() {
        def vendaInstance = Venda.get(params.id)
        if (!vendaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
            redirect action: 'list'
            return
        }

        try {
            vendaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'venda.label', default: 'Venda'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
