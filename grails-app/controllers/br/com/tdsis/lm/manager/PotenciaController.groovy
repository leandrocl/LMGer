package br.com.tdsis.lm.manager

class PotenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [potenciaInstanceList: Potencia.list(params), potenciaInstanceTotal: Potencia.count()]
    }

    def create = {
        def potenciaInstance = new Potencia()
        potenciaInstance.properties = params
        return [potenciaInstance: potenciaInstance]
    }

    def save = {
        def potenciaInstance = new Potencia(params)
        if (potenciaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'potencia.label', default: 'Potencia'), potenciaInstance.id])}"
            redirect(action: "show", id: potenciaInstance.id)
        }
        else {
            render(view: "create", model: [potenciaInstance: potenciaInstance])
        }
    }

    def show = {
        def potenciaInstance = Potencia.get(params.id)
        if (!potenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potencia.label', default: 'Potencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            [potenciaInstance: potenciaInstance]
        }
    }

    def edit = {
        def potenciaInstance = Potencia.get(params.id)
        if (!potenciaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potencia.label', default: 'Potencia'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [potenciaInstance: potenciaInstance]
        }
    }

    def update = {
        def potenciaInstance = Potencia.get(params.id)
        if (potenciaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (potenciaInstance.version > version) {
                    
                    potenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'potencia.label', default: 'Potencia')] as Object[], "Another user has updated this Potencia while you were editing")
                    render(view: "edit", model: [potenciaInstance: potenciaInstance])
                    return
                }
            }
            potenciaInstance.properties = params
            if (!potenciaInstance.hasErrors() && potenciaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'potencia.label', default: 'Potencia'), potenciaInstance.id])}"
                redirect(action: "show", id: potenciaInstance.id)
            }
            else {
                render(view: "edit", model: [potenciaInstance: potenciaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potencia.label', default: 'Potencia'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def potenciaInstance = Potencia.get(params.id)
        if (potenciaInstance) {
            try {
                potenciaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'potencia.label', default: 'Potencia'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'potencia.label', default: 'Potencia'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'potencia.label', default: 'Potencia'), params.id])}"
            redirect(action: "list")
        }
    }
}
