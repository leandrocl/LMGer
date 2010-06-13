package br.com.tdsis.lm.manager

class Loja {

	String prefixo
	String nome
	Integer numero
	Date dataDaFundacao
	Potencia filiacao
	
	static constraints = {
		prefixo(nullable:false,size:1..100)
		nome(nullable:false,size:1..100)
		numero(min:0,nullable:false)
		dataDaFundacao(nullable:false)
		filiacao(nullable:false)
	}
	
	String toString(){
		prefixo + " " + nome + " N. " + numero + " ($filiacao)"
	}
	

}
