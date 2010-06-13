package br.com.tdsis.lm.manager

class Irmao {

	Pessoa pessoa
	Grau grau
	Date dataDaIniciacao
	String status
	
	Cargo cargo
	Loja lojaMae

    static constraints = {
		pessoa(nullable:false)
		grau(nullable:false)
		dataDaIniciacao(nullable:false)
		status(nullable:false,size:1..1)
		cargo(nullable:true)
		lojaMae(nullable:false)
    }
	
	String toString(){
		grau.saudacao + " $pessoa.nome - $lojaMae"
	}
}
