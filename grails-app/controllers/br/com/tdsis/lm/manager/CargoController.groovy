package br.com.tdsis.lm.manager

class CargoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cargoInstanceList: Cargo.list(params), cargoInstanceTotal: Cargo.count()]
    }

    def create = {
        def cargoInstance = new Cargo()
        cargoInstance.properties = params
        return [cargoInstance: cargoInstance]
    }

    def save = {
        def cargoInstance = new Cargo(params)
        if (cargoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'cargo.label', default: 'Cargo'), cargoInstance.id])}"
            redirect(action: "show", id: cargoInstance.id)
        }
        else {
            render(view: "create", model: [cargoInstance: cargoInstance])
        }
    }

    def show = {
        def cargoInstance = Cargo.get(params.id)
        if (!cargoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cargoInstance: cargoInstance]
        }
    }

    def edit = {
        def cargoInstance = Cargo.get(params.id)
        if (!cargoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cargoInstance: cargoInstance]
        }
    }

    def update = {
        def cargoInstance = Cargo.get(params.id)
        if (cargoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cargoInstance.version > version) {
                    
                    cargoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'cargo.label', default: 'Cargo')] as Object[], "Another user has updated this Cargo while you were editing")
                    render(view: "edit", model: [cargoInstance: cargoInstance])
                    return
                }
            }
            cargoInstance.properties = params
            if (!cargoInstance.hasErrors() && cargoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'cargo.label', default: 'Cargo'), cargoInstance.id])}"
                redirect(action: "show", id: cargoInstance.id)
            }
            else {
                render(view: "edit", model: [cargoInstance: cargoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cargoInstance = Cargo.get(params.id)
        if (cargoInstance) {
            try {
                cargoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'cargo.label', default: 'Cargo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'cargo.label', default: 'Cargo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), params.id])}"
            redirect(action: "list")
        }
    }
}
