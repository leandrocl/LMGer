package br.com.tdsis.lm.manager

class IrmaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [irmaoInstanceList: Irmao.list(params), irmaoInstanceTotal: Irmao.count()]
    }

    def create = {
        def irmaoInstance = new Irmao()
        irmaoInstance.properties = params
        return [irmaoInstance: irmaoInstance]
    }

    def save = {
        def irmaoInstance = new Irmao(params)
        if (irmaoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'irmao.label', default: 'Irmao'), irmaoInstance.id])}"
            redirect(action: "show", id: irmaoInstance.id)
        }
        else {
            render(view: "create", model: [irmaoInstance: irmaoInstance])
        }
    }

    def show = {
        def irmaoInstance = Irmao.get(params.id)
        if (!irmaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'irmao.label', default: 'Irmao'), params.id])}"
            redirect(action: "list")
        }
        else {
            [irmaoInstance: irmaoInstance]
        }
    }

    def edit = {
        def irmaoInstance = Irmao.get(params.id)
        if (!irmaoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'irmao.label', default: 'Irmao'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [irmaoInstance: irmaoInstance]
        }
    }

    def update = {
        def irmaoInstance = Irmao.get(params.id)
        if (irmaoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (irmaoInstance.version > version) {
                    
                    irmaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'irmao.label', default: 'Irmao')] as Object[], "Another user has updated this Irmao while you were editing")
                    render(view: "edit", model: [irmaoInstance: irmaoInstance])
                    return
                }
            }
            irmaoInstance.properties = params
            if (!irmaoInstance.hasErrors() && irmaoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'irmao.label', default: 'Irmao'), irmaoInstance.id])}"
                redirect(action: "show", id: irmaoInstance.id)
            }
            else {
                render(view: "edit", model: [irmaoInstance: irmaoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'irmao.label', default: 'Irmao'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def irmaoInstance = Irmao.get(params.id)
        if (irmaoInstance) {
            try {
                irmaoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'irmao.label', default: 'Irmao'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'irmao.label', default: 'Irmao'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'irmao.label', default: 'Irmao'), params.id])}"
            redirect(action: "list")
        }
    }
}
