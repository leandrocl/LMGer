
<%@ page import="br.com.tdsis.lm.manager.Loja" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'loja.label', default: 'Loja')}" />
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
            <g:hasErrors bean="${lojaInstance}">
            <div class="errors">
                <g:renderErrors bean="${lojaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="prefixo"><g:message code="loja.prefixo.label" default="Prefixo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lojaInstance, field: 'prefixo', 'errors')}">
                                    <g:textField name="prefixo" maxlength="100" value="${lojaInstance?.prefixo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="loja.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lojaInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="100" value="${lojaInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="numero"><g:message code="loja.numero.label" default="Numero" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lojaInstance, field: 'numero', 'errors')}">
                                    <g:textField name="numero" value="${fieldValue(bean: lojaInstance, field: 'numero')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataDaFundacao"><g:message code="loja.dataDaFundacao.label" default="Data Da Fundacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lojaInstance, field: 'dataDaFundacao', 'errors')}">
                                    <g:datePicker name="dataDaFundacao" precision="day" value="${lojaInstance?.dataDaFundacao}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="filiacao"><g:message code="loja.filiacao.label" default="Filiacao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: lojaInstance, field: 'filiacao', 'errors')}">
                                    <g:select name="filiacao.id" from="${br.com.tdsis.lm.manager.Potencia.list()}" optionKey="id" value="${lojaInstance?.filiacao?.id}"  />
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
