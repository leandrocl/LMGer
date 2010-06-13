
<%@ page import="br.com.tdsis.lm.manager.Irmao" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'irmao.label', default: 'Irmao')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${irmaoInstance}">
            <div class="errors">
                <g:renderErrors bean="${irmaoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pessoa"><g:message code="irmao.pessoa.label" default="Pessoa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: irmaoInstance, field: 'pessoa', 'errors')}">
                                    <g:select name="pessoa.id" from="${br.com.tdsis.lm.manager.Pessoa.list()}" optionKey="id" value="${irmaoInstance?.pessoa?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="grau"><g:message code="irmao.grau.label" default="Grau" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: irmaoInstance, field: 'grau', 'errors')}">
                                    <g:select name="grau.id" from="${br.com.tdsis.lm.manager.Grau.list()}" optionKey="id" value="${irmaoInstance?.grau?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDaIniciacao"><g:message code="irmao.dataDaIniciacao.label" default="Data Da Iniciacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: irmaoInstance, field: 'dataDaIniciacao', 'errors')}">
                                    <g:datePicker name="dataDaIniciacao" precision="day" value="${irmaoInstance?.dataDaIniciacao}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="irmao.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: irmaoInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" maxlength="1" value="${irmaoInstance?.status}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cargo"><g:message code="irmao.cargo.label" default="Cargo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: irmaoInstance, field: 'cargo', 'errors')}">
                                    <g:select name="cargo.id" from="${br.com.tdsis.lm.manager.Cargo.list()}" optionKey="id" value="${irmaoInstance?.cargo?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lojaMae"><g:message code="irmao.lojaMae.label" default="Loja Mae" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: irmaoInstance, field: 'lojaMae', 'errors')}">
                                    <g:select name="lojaMae.id" from="${br.com.tdsis.lm.manager.Loja.list()}" optionKey="id" value="${irmaoInstance?.lojaMae?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
