package br.com.tdsis.lm.manager

class GrauController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [grauInstanceList: Grau.list(params), grauInstanceTotal: Grau.count()]
    }

    def create = {
        def grauInstance = new Grau()
        grauInstance.properties = params
        return [grauInstance: grauInstance]
    }

    def save = {
        def grauInstance = new Grau(params)
        if (grauInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'grau.label', default: 'Grau'), grauInstance.id])}"
            redirect(action: "show", id: grauInstance.id)
        }
        else {
            render(view: "create", model: [grauInstance: grauInstance])
        }
    }

    def show = {
        def grauInstance = Grau.get(params.id)
        if (!grauInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grau.label', default: 'Grau'), params.id])}"
            redirect(action: "list")
        }
        else {
            [grauInstance: grauInstance]
        }
    }

    def edit = {
        def grauInstance = Grau.get(params.id)
        if (!grauInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grau.label', default: 'Grau'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [grauInstance: grauInstance]
        }
    }

    def update = {
        def grauInstance = Grau.get(params.id)
        if (grauInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (grauInstance.version > version) {
                    
                    grauInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'grau.label', default: 'Grau')] as Object[], "Another user has updated this Grau while you were editing")
                    render(view: "edit", model: [grauInstance: grauInstance])
                    return
                }
            }
            grauInstance.properties = params
            if (!grauInstance.hasErrors() && grauInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'grau.label', default: 'Grau'), grauInstance.id])}"
                redirect(action: "show", id: grauInstance.id)
            }
            else {
                render(view: "edit", model: [grauInstance: grauInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grau.label', default: 'Grau'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def grauInstance = Grau.get(params.id)
        if (grauInstance) {
            try {
                grauInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'grau.label', default: 'Grau'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'grau.label', default: 'Grau'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'grau.label', default: 'Grau'), params.id])}"
            redirect(action: "list")
        }
    }
}
