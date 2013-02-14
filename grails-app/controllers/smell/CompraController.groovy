package smell

import org.springframework.dao.DataIntegrityViolationException

class CompraController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [compraInstanceList: Compra.list(params), compraInstanceTotal: Compra.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[compraInstance: new Compra(params)]
			break
		case 'POST':	
			
	        def compraInstance = new Compra(params)
			
			println(params.perfumes)
			def itens = []
			params.perfumes.id.eachWithIndex { id, i -> 
				
				def perfume = Perfume.get(Long.valueOf(id));
				def item = new ItemDeCompra(perfume: perfume);
				item.quantidade = Integer.valueOf(params.perfumes.quantidade[i])
				compraInstance.addToItens(item)
			}
			
	        if (!compraInstance.save(flush: true)) {
	            render view: 'create', model: [compraInstance: compraInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
	        redirect action: 'show', id: compraInstance.id
			break
		}
    }

    def show() {
        def compraInstance = Compra.get(params.id)
        if (!compraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
            redirect action: 'list'
            return
        }

        [compraInstance: compraInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def compraInstance = Compra.get(params.id)
			println(params)
			def item = ItemDeCompra.findWhere(id: compraInstance.id)
			def itemNome = 
			println(item)
	        if (!compraInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [compraInstance: compraInstance]
			break
		case 'POST':
	        def compraInstance = Compra.get(params.id)
	        if (!compraInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (compraInstance.version > version) {
	                compraInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'compra.label', default: 'Compra')] as Object[],
	                          "Another user has updated this Compra while you were editing")
	                render view: 'edit', model: [compraInstance: compraInstance]
	                return
	            }
	        }

	        compraInstance.properties = params

	        if (!compraInstance.save(flush: true)) {
	            render view: 'edit', model: [compraInstance: compraInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
	        redirect action: 'show', id: compraInstance.id
			break
		}
    }

    def delete() {
        def compraInstance = Compra.get(params.id)
        if (!compraInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
            redirect action: 'list'
            return
        }

        try {
            compraInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
