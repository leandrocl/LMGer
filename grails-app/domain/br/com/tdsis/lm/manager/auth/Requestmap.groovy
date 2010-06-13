package br.com.tdsis.lm.manager.auth

/**
 * Request Map domain class.
 */
class Requestmap {

	String url
	String configAttribute

	static constraints = {
		url(blank: false, unique: true)
		configAttribute(blank: false)
	}
}
