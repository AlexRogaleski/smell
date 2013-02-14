package smell

import grails.converters.JSON;
import org.springframework.dao.DataIntegrityViolationException

class PerfumeController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }
	
	def searchJSON () {
		def perfumes = Perfume.findAllfindAllByInspiracaoLike("%${params.name_startsWith}%")
		
		def c = Perfume.createCriteria();
		
		def results = c {
			like("inspiracao", "%${params.name_startsWith}%")
			maxResults(Integer.parseInt( params.maxRows))
		}
		
		render results as JSON;
	}

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [perfumeInstanceList: Perfume.list(params), perfumeInstanceTotal: Perfume.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[perfumeInstance: new Perfume(params)]
			break
		case 'POST':
	        def perfumeInstance = new Perfume(params)
	        if (!perfumeInstance.save(flush: true)) {
	            render view: 'create', model: [perfumeInstance: perfumeInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'perfume.label', default: 'Perfume'), perfumeInstance.id])
	        redirect action: 'show', id: perfumeInstance.id
			break
		}
    }

    def show() {
        def perfumeInstance = Perfume.get(params.id)
        if (!perfumeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'perfume.label', default: 'Perfume'), params.id])
            redirect action: 'list'
            return
        }

        [perfumeInstance: perfumeInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def perfumeInstance = Perfume.get(params.id)
	        if (!perfumeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'perfume.label', default: 'Perfume'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [perfumeInstance: perfumeInstance]
			break
		case 'POST':
	        def perfumeInstance = Perfume.get(params.id)
	        if (!perfumeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'perfume.label', default: 'Perfume'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (perfumeInstance.version > version) {
	                perfumeInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'perfume.label', default: 'Perfume')] as Object[],
	                          "Another user has updated this Perfume while you were editing")
	                render view: 'edit', model: [perfumeInstance: perfumeInstance]
	                return
	            }
	        }

	        perfumeInstance.properties = params

	        if (!perfumeInstance.save(flush: true)) {
	            render view: 'edit', model: [perfumeInstance: perfumeInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'perfume.label', default: 'Perfume'), perfumeInstance.id])
	        redirect action: 'show', id: perfumeInstance.id
			break
		}
    }

    def delete() {
        def perfumeInstance = Perfume.get(params.id)
        if (!perfumeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'perfume.label', default: 'Perfume'), params.id])
            redirect action: 'list'
            return
        }

        try {
            perfumeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'perfume.label', default: 'Perfume'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'perfume.label', default: 'Perfume'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
