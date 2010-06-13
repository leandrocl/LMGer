package br.com.tdsis.lm.manager

class LojaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [lojaInstanceList: Loja.list(params), lojaInstanceTotal: Loja.count()]
    }

    def create = {
        def lojaInstance = new Loja()
        lojaInstance.properties = params
        return [lojaInstance: lojaInstance]
    }

    def save = {
        def lojaInstance = new Loja(params)
        if (lojaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'loja.label', default: 'Loja'), lojaInstance.id])}"
            redirect(action: "show", id: lojaInstance.id)
        }
        else {
            render(view: "create", model: [lojaInstance: lojaInstance])
        }
    }

    def show = {
        def lojaInstance = Loja.get(params.id)
        if (!lojaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loja.label', default: 'Loja'), params.id])}"
            redirect(action: "list")
        }
        else {
            [lojaInstance: lojaInstance]
        }
    }

    def edit = {
        def lojaInstance = Loja.get(params.id)
        if (!lojaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loja.label', default: 'Loja'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [lojaInstance: lojaInstance]
        }
    }

    def update = {
        def lojaInstance = Loja.get(params.id)
        if (lojaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (lojaInstance.version > version) {
                    
                    lojaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'loja.label', default: 'Loja')] as Object[], "Another user has updated this Loja while you were editing")
                    render(view: "edit", model: [lojaInstance: lojaInstance])
                    return
                }
            }
            lojaInstance.properties = params
            if (!lojaInstance.hasErrors() && lojaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'loja.label', default: 'Loja'), lojaInstance.id])}"
                redirect(action: "show", id: lojaInstance.id)
            }
            else {
                render(view: "edit", model: [lojaInstance: lojaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loja.label', default: 'Loja'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def lojaInstance = Loja.get(params.id)
        if (lojaInstance) {
            try {
                lojaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'loja.label', default: 'Loja'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'loja.label', default: 'Loja'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'loja.label', default: 'Loja'), params.id])}"
            redirect(action: "list")
        }
    }
}
