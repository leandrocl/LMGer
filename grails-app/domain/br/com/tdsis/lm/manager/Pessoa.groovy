package br.com.tdsis.lm.manager

class Pessoa {

	String nome
	Date dataDeNascimento
	String sexo
	Date dataDeCadastro = new Date()
	String status
	
    static constraints = {
		nome(blank:false,size:1..100,nullable:false)
		dataDeNascimento(nullable:false)
		sexo(inList:["M","F"])
		dataDeCadastro(nullable:false)
		status(inList:["A","I"])
    }

	String toString(){
		nome
	}
			
}
