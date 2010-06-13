package br.com.tdsis.lm.manager


class User {

	static belongsTo = Pessoa

	Pessoa pessoa
	String login
	String password
	String status
	String email
	
    static constraints = {
		email(email:true,nullable:false)
		pessoa(nullable:false)
		login(nullable:false,blank:false,size:1..50)
		password(nullable:false,blank:false,size:6..20)
		status(nullable:false,blank:false,inList:["A","I"])
    }
	
	String toString(){
		login
	}
}
