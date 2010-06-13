package br.com.tdsis.lm.manager

class Pessoa {

	String nome
	Date dataDeNascimento
	String sexo
	Date dataDeCadastro = new Date()
	String status
	
	User user

    static constraints = {
		nome(blank:false,size:1..100,nullable:false)
		dataDeNascimento(nullable:false)
		sexo(inList:["M","F"])
		dataDeCadastro(nullable:false)
		status(inList:["A","I"])
		user(nullable:true)
    }

	String toString(){
		nome + "($user?.login)"
	}
			
}
